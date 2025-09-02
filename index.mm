#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Welcome to the Objective-C++ Demo!");

        // Variables and types
        NSString *language = @"Objective-C++";
        double version = 1.0;
        BOOL isFun = YES;

        NSLog(@"Language: %@, Version: %.1f, Fun: %@", language, version, isFun ? @"YES" : @"NO");

        // Arrays
        NSArray *numbers = @[@1, @2, @3, @4, @5];
        NSLog(@"Numbers: %@", numbers);

        // Dictionaries
        NSDictionary *ages = @{@"Alice": @30, @"Bob": @25};
        NSLog(@"Ages: %@", ages);

        // Looping
        for (int i = 1; i <= 5; i++) {
            NSLog(@"Loop %d", i);
        }

        // Conditionals
        int x = 10;
        if (x > 5) {
            NSLog(@"%d is greater than 5", x);
        } else {
            NSLog(@"%d is not greater than 5", x);
        }