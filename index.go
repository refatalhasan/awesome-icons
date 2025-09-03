package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
	"sync"
	"time"

	"crypto/sha256"
	"encoding/hex"
)

// Home page handler
func homeHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, `
		<!DOCTYPE html>
		<html>
		<head>
			<title>Go Demo 🚀</title>
			<style>
				body { font-family: Arial, sans-serif; background: #1e1e1e; color: #eee; text-align: center; padding: 50px; }
				h1 { color: #00ffcc; }
				ul { list-style: none; padding: 0; }
				li { background: #333; margin: 5px; padding: 10px; border-radius: 5px; }
			</style>
		</head>
		<body>
			<h1>Hello from Go 🐹</h1>
			<p>Welcome to the Awesome Icons demo server!</p>
			<h2>📂 Files</h2>
			<ul>
				<li>index.go</li>
				<li>index.py</li>
				<li>index.js</li>
				<li>index.rs</li>
				<li>index.kt</li>
			</ul>
			<footer>
				<p>Generated at %s</p>
			</footer>
		</body>
		</html>
	`, time.Now().Format(time.RFC1123))
}

type User struct {
	ID       string    `json:"id"`
	Username string    `json:"username"`
	Email    string    `json:"email"`
	Created  time.Time `json:"created"`
}

type Icon struct {
	ID          string    `json:"id"`
	Name        string    `json:"name"`
	Category    string    `json:"category"`
	Tags        []string  `json:"tags"`
	CreatedBy   string    `json:"created_by"`
	CreatedAt   time.Time `json:"created_at"`
	Downloads   int       `json:"downloads"`
	Likes       int       `json:"likes"`
}

type ApiResponse struct {
	Success bool        `json:"success"`
	Data    interface{} `json:"data"`
	Error   string      `json:"error,omitempty"`
}

type InMemoryDB struct {
	users    sync.Map
	icons    sync.Map
	sessions sync.Map
}

var db = &InMemoryDB{}

func init() {
	// Initialize some sample data
	sampleUser := User{
		ID:       "u1",
		Username: "demo",
		Email:    "demo@example.com",
		Created:  time.Now(),
	}
	db.users.Store(sampleUser.ID, sampleUser)

	sampleIcon := Icon{
		ID:        "i1",
		Name:      "rocket",
		Category:  "transportation",
		Tags:      []string{"space", "launch", "travel"},
		CreatedBy: "u1",
		CreatedAt: time.Now(),
	}
	db.icons.Store(sampleIcon.ID, sampleIcon)
}

func jsonResponse(w http.ResponseWriter, status int, data interface{}) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)
	json.NewEncoder(w).Encode(ApiResponse{
		Success: status >= 200 && status < 300,
		Data:    data,
	})
}

func errorResponse(w http.ResponseWriter, status int, message string) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)
	json.NewEncoder(w).Encode(ApiResponse{
		Success: false,
		Error:   message,
	})
}

func authMiddleware(next http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		token := r.Header.Get("Authorization")
		if token == "" {
			errorResponse(w, http.StatusUnauthorized, "No authorization token provided")
			return
		}

		if _, ok := db.sessions.Load(token); !ok {
			errorResponse(w, http.StatusUnauthorized, "Invalid token")
			return
		}

		next(w, r)
	}
}

func usersHandler(w http.ResponseWriter, r *http.Request) {
	switch r.Method {
	case http.MethodGet:
		var users []User
		db.users.Range(func(_, value interface{}) bool {
			users = append(users, value.(User))
			return true
		})
		jsonResponse(w, http.StatusOK, users)

	case http.MethodPost:
		var newUser User
		if err := json.NewDecoder(r.Body).Decode(&newUser); err != nil {
			errorResponse(w, http.StatusBadRequest, "Invalid request body")
			return
		}

		newUser.ID = generateID()
		newUser.Created = time.Now()
		db.users.Store(newUser.ID, newUser)
		jsonResponse(w, http.StatusCreated, newUser)

	default:
		errorResponse(w, http.StatusMethodNotAllowed, "Method not allowed")
	}
}

func iconsHandler(w http.ResponseWriter, r *http.Request) {
	switch r.Method {
	case http.MethodGet:
		var icons []Icon
		db.icons.Range(func(_, value interface{}) bool {
			icons = append(icons, value.(Icon))
			return true
		})
		jsonResponse(w, http.StatusOK, icons)

	case http.MethodPost:
		var newIcon Icon
		if err := json.NewDecoder(r.Body).Decode(&newIcon); err != nil {
			errorResponse(w, http.StatusBadRequest, "Invalid request body")
			return
		}

		newIcon.ID = generateID()
		newIcon.CreatedAt = time.Now()
		db.icons.Store(newIcon.ID, newIcon)
		jsonResponse(w, http.StatusCreated, newIcon)

	default:
		errorResponse(w, http.StatusMethodNotAllowed, "Method not allowed")
	}
}

func searchHandler(w http.ResponseWriter, r *http.Request) {
	query := r.URL.Query().Get("q")
	category := r.URL.Query().Get("category")

	var results []Icon
	db.icons.Range(func(_, value interface{}) bool {
		icon := value.(Icon)
		if (query == "" || contains(icon.Tags, query) ||
			containsIgnoreCase(icon.Name, query)) &&
			(category == "" || icon.Category == category) {
			results = append(results, icon)
		}
		return true
	})

	jsonResponse(w, http.StatusOK, results)
}

func statsHandler(w http.ResponseWriter, r *http.Request) {
	var totalUsers, totalIcons int
	db.users.Range(func(_, _ interface{}) bool {
		totalUsers++
		return true
	})
	db.icons.Range(func(_, _ interface{}) bool {
		totalIcons++
		return true
	})

	stats := map[string]interface{}{
		"total_users": totalUsers,
		"total_icons": totalIcons,
		"uptime":      time.Since(startTime).String(),
		"version":     "1.0.0",
	}

	jsonResponse(w, http.StatusOK, stats)
}

func generateID() string {
	hash := sha256.New()
	hash.Write([]byte(time.Now().String()))
	return hex.EncodeToString(hash.Sum(nil))[:8]
}

func contains(slice []string, item string) bool {
	for _, s := range slice {
		if s == item {
			return true
		}
	}
	return false
}

func containsIgnoreCase(s, substr string) bool {
	s, substr = strings.ToLower(s), strings.ToLower(substr)
	return strings.Contains(s, substr)
}

var startTime = time.Now()

func setupRoutes() {
	http.HandleFunc("/", homeHandler)
	http.HandleFunc("/api/users", authMiddleware(usersHandler))
	http.HandleFunc("/api/icons", authMiddleware(iconsHandler))
	http.HandleFunc("/api/search", searchHandler)
	http.HandleFunc("/api/stats", statsHandler)
}

func main() {
	setupRoutes()

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	server := &http.Server{
		Addr:         ":" + port,
		ReadTimeout:  10 * time.Second,
		WriteTimeout: 10 * time.Second,
	}

	log.Printf("🚀 Starting Go server on http://localhost:%s", port)
	log.Fatal(server.ListenAndServe())
}
