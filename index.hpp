// index.hpp
// Awesome Icons Demo 🎉
// Example C++ Header File

#ifndef INDEX_HPP
#define INDEX_HPP

#include <iostream>
#include <vector>
#include <string>
#include <cmath>

namespace AwesomeIcons {

    // 🔢 Constant
    const double PI = 3.14159265359;

    // 🎯 Inline function
    inline double square(double x) {
        return x * x;
    }

    // 🦊 Class
    class Animal {
    private:
        std::string name;
        int age;

    public:
        Animal(const std::string& n, int a);
        void speak() const;
        std::string getName() const { return name; }
        int getAge() const { return age; }
    };

    // 🐼 Template
    template <typename T>
    class Box {
    private:
        std::vector<T> items;
    public:
        void add(const T& item) { items.push_back(item); }
        void showAll() const {
            std::cout << "📦 Box contains:" << std::endl;
            for (const auto& i : items) {
                std::cout << " - " << i << std::endl;
            }
        }
    };

    // 🦖 Struct
    struct Point {
        double x, y;
        Point(double px, double py) : x(px), y(py) {}
    };

    // 🐧 Function prototype
    double circleArea(double radius);

} // namespace AwesomeIcons

#endif // INDEX_HPP
