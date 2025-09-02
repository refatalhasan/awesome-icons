// index.h
// Awesome Icons Demo 🎉
// Example C/C++ Header File

#ifndef INDEX_H
#define INDEX_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 🔢 Constants
#define MAX_BUFFER 256
#define PI 3.14159

// 🎯 Macros
#define SQUARE(x) ((x) * (x))
#define DEBUG_LOG(msg) printf("[DEBUG] %s:%d: %s\n", __FILE__, __LINE__, msg)

// 🐼 Struct
typedef struct {
    char name[50];
    int age;
    double score;
} Student;

// 🦊 Enum
typedef enum {
    LANGUAGE_C,
    LANGUAGE_CPP,
    LANGUAGE_PYTHON,
    LANGUAGE_JAVA,
    LANGUAGE_GO
} Language;

// 🐧 Function prototypes
void greet(const char* name);
int add(int a, int b);
double area_of_circle(double radius);
void print_student(const Student* s);

// 🦖 Inline function
static inline void show_language(Language lang) {
    switch (lang) {
        case LANGUAGE_C: printf("Language: C\n"); break;
        case LANGUAGE_CPP: printf("Language: C++\n"); break;
        case LANGUAGE_PYTHON: printf("Language: Python\n"); break;
        case LANGUAGE_JAVA: printf("Language: Java\n"); break;
        case LANGUAGE_GO: printf("Language: Go\n"); break;
        default: printf("Unknown Language\n");
    }
}

#endif // INDEX_H
