#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_SIZE 100
#define PI 3.14159

typedef struct {
    char name[50];
    int age;
    float score;
} Student;

typedef struct Node {
    int data;
    struct Node* next;
} Node;

Node* createNode(int value) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = value;
    newNode->next = NULL;
    return newNode;
}

void printList(Node* head) {
    Node* current = head;
    while (current != NULL) {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");
}

int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

void bubbleSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

int binarySearch(int arr[], int left, int right, int target) {
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == target) return mid;
        if (arr[mid] < target) left = mid + 1;
        else right = mid - 1;
    }
    return -1;
}

float calculateAverage(float numbers[], int size) {
    float sum = 0;
    for (int i = 0; i < size; i++) {
        sum += numbers[i];
    }
    return sum / size;
}

void reverseString(char* str) {
    int length = strlen(str);
    for (int i = 0; i < length / 2; i++) {
        char temp = str[i];
        str[i] = str[length - 1 - i];
        str[length - 1 - i] = temp;
    }
}

int isPrime(int n) {
    if (n <= 1) return 0;
    for (int i = 2; i <= sqrt(n); i++) {
        if (n % i == 0) return 0;
    }
    return 1;
}

void generateFibonacci(int n) {
    int first = 0, second = 1;
    for (int i = 0; i < n; i++) {
        printf("%d ", first);
        int next = first + second;
        first = second;
        second = next;
    }
    printf("\n");
}

void printPattern(int n) {
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= i; j++) {
            printf("* ");
        }
        printf("\n");
    }
}

float calculateBMI(float weight, float height) {
    return weight / (height * height);
}

void generateRandomArray(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        arr[i] = rand() % 100;
    }
}

int findMax(int arr[], int size) {
    int max = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] > max) max = arr[i];
    }
    return max;
}

void printMatrix(int matrix[][MAX_SIZE], int rows, int cols) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

float calculateCircleArea(float radius) {
    return PI * radius * radius;
}

int countVowels(char* str) {
    int count = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        char c = tolower(str[i]);
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
            count++;
        }
    }
    return count;
}

int main() {
    srand(time(NULL));
    
    printf("Demo of various C programming concepts:\n\n");

    int numbers[10] = {64, 34, 25, 12, 22, 11, 90, 87, 45, 33};
    printf("Original array: ");
    for (int i = 0; i < 10; i++) printf("%d ", numbers[i]);
    printf("\n");

    bubbleSort(numbers, 10);
    printf("Sorted array: ");
    for (int i = 0; i < 10; i++) printf("%d ", numbers[i]);
    printf("\n");

    int target = 22;
    int result = binarySearch(numbers, 0, 9, target);
    printf("Binary Search for %d: Found at index %d\n", target, result);

    printf("Factorial of 5: %d\n", factorial(5));

    printf("First 10 Fibonacci numbers: ");
    generateFibonacci(10);

    printf("Pattern with 5 rows:\n");
    printPattern(5);

    Node* head = createNode(1);
    head->next = createNode(2);
    head->next->next = createNode(3);
    printf("Linked List: ");
    printList(head);

    char str[] = "Hello, World!";
    printf("Original string: %s\n", str);
    reverseString(str);
    printf("Reversed string: %s\n", str);

    printf("Prime numbers up to 20: ");
    for (int i = 1; i <= 20; i++) {
        if (isPrime(i)) printf("%d ", i);
    }
    printf("\n");

    float bmi = calculateBMI(70.0, 1.75);
    printf("BMI for weight=70kg, height=1.75m: %.2f\n", bmi);

    int randomArray[10];
    generateRandomArray(randomArray, 10);
    printf("Random array: ");
    for (int i = 0; i < 10; i++) printf("%d ", randomArray[i]);
    printf("\n");

    printf("Maximum in random array: %d\n", findMax(randomArray, 10));

    printf("Circle area with radius 5: %.2f\n", calculateCircleArea(5.0));

    printf("Number of vowels in 'Hello, World!': %d\n", countVowels("Hello, World!"));

    Student student = {"John Doe", 20, 85.5};
    printf("Student: %s, Age: %d, Score: %.2f\n", student.name, student.age, student.score);

    return 0;
}

