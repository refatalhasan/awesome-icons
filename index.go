package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
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

func main() {
	http.HandleFunc("/", homeHandler)
	fmt.Println("🚀 Starting Go server on http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
