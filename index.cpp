#include <iostream>
#include <vector>
#include <string>
#include <map>
#include <memory>
#include <algorithm>
#include <chrono>
#include <thread>
#include <mutex>
#include <random>
#include <fstream>
#include <sstream>
#include <queue>
#include <stack>

using namespace std;

class Shape {
public:
    virtual double area() = 0;
    virtual ~Shape() = default;
};

class Circle : public Shape {
    double radius;
public:
    Circle(double r) : radius(r) {}
    double area() override { return 3.14159 * radius * radius; }
};

class Rectangle : public Shape {
    double width, height;
public:
    Rectangle(double w, double h) : width(w), height(h) {}
    double area() override { return width * height; }
};

template<typename T>
class SmartPtr {
    T* ptr;
public:
    SmartPtr(T* p = nullptr) : ptr(p) {}
    ~SmartPtr() { delete ptr; }
    T& operator*() { return *ptr; }
    T* operator->() { return ptr; }
};

class ThreadSafeQueue {
    queue<int> q;
    mutex mtx;
public:
    void push(int val) {
        lock_guard<mutex> lock(mtx);
        q.push(val);
    }
    
    bool pop(int& val) {
        lock_guard<mutex> lock(mtx);
        if (q.empty()) return false;
        val = q.front();
        q.pop();
        return true;
    }
};

vector<int> generateRandomNumbers(int n) {
    vector<int> nums;
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> dis(1, 1000);
    
    for (int i = 0; i < n; i++) {
        nums.push_back(dis(gen));
    }
    return nums;
}

template<typename T>
void bubbleSort(vector<T>& arr) {
    int n = arr.size();
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(arr[j], arr[j + 1]);
            }
        }
    }
}

class FileHandler {
    string filename;
public:
    FileHandler(const string& fname) : filename(fname) {}
    
    void writeToFile(const string& content) {
        ofstream file(filename);
        if (file.is_open()) {
            file << content;
            file.close();
        }
    }
    
    string readFromFile() {
        ifstream file(filename);
        stringstream buffer;
        if (file.is_open()) {
            buffer << file.rdbuf();
            file.close();
        }
        return buffer.str();
    }
};

class Calculator {
public:
    static int add(int a, int b) { return a + b; }
    static int subtract(int a, int b) { return a - b; }
    static int multiply(int a, int b) { return a * b; }
    static double divide(int a, int b) { return b != 0 ? (double)a / b : 0; }
};

class Student {
    string name;
    int age;
    vector<double> grades;
public:
    Student(string n, int a) : name(n), age(a) {}
    
    void addGrade(double grade) {
        grades.push_back(grade);
    }
    
    double getAverage() {
        if (grades.empty()) return 0;
        return accumulate(grades.begin(), grades.end(), 0.0) / grades.size();
    }
};

class BinaryTree {
    struct Node {
        int data;
        Node *left, *right;
        Node(int val) : data(val), left(nullptr), right(nullptr) {}
    };
    
    Node* root;
    
    void insertRecursive(Node*& node, int value) {
        if (!node) {
            node = new Node(value);
            return;
        }
        if (value < node->data)
            insertRecursive(node->left, value);
        else
            insertRecursive(node->right, value);
    }
    
public:
    BinaryTree() : root(nullptr) {}
    
    void insert(int value) {
        insertRecursive(root, value);
    }
};

class Matrix {
    vector<vector<int>> data;
    int rows, cols;
    
public:
    Matrix(int r, int c) : rows(r), cols(c) {
        data.resize(rows, vector<int>(cols));
    }
    
    void set(int i, int j, int value) {
        if (i < rows && j < cols)
            data[i][j] = value;
    }
    
    int get(int i, int j) {
        return (i < rows && j < cols) ? data[i][j] : 0;
    }
};

int main() {
    cout << "C++ Features Demo" << endl;
    
    vector<unique_ptr<Shape>> shapes;
    shapes.push_back(make_unique<Circle>(5));
    shapes.push_back(make_unique<Rectangle>(4, 6));
    
    for (const auto& shape : shapes) {
        cout << "Area: " << shape->area() << endl;
    }
    
    ThreadSafeQueue tsq;
    thread producer([&tsq]() {
        for (int i = 0; i < 5; i++) {
            tsq.push(i);
            this_thread::sleep_for(chrono::milliseconds(100));
        }
    });
    
    thread consumer([&tsq]() {
        int val;
        while (tsq.pop(val)) {
            cout << "Consumed: " << val << endl;
            this_thread::sleep_for(chrono::milliseconds(200));
        }
    });
    
    producer.join();
    consumer.join();
    
    auto numbers = generateRandomNumbers(10);
    bubbleSort(numbers);
    
    cout << "Sorted numbers: ";
    for (int num : numbers) {
        cout << num << " ";
    }
    cout << endl;
    
    FileHandler fh("test.txt");
    fh.writeToFile("Hello, File!");
    cout << "File content: " << fh.readFromFile() << endl;
    
    cout << "10 + 5 = " << Calculator::add(10, 5) << endl;
    
    Student student("John Doe", 20);
    student.addGrade(85.5);
    student.addGrade(90.0);
    student.addGrade(88.5);
    cout << "Average grade: " << student.getAverage() << endl;
    
    BinaryTree tree;
    vector<int> values = {5, 3, 7, 2, 4, 6, 8};
    for (int val : values) {
        tree.insert(val);
    }
    
    Matrix matrix(3, 3);
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            matrix.set(i, j, i * 3 + j);
        }
    }
    
    return 0;
}
