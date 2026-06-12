#import <Cocoa/Cocoa.h>

void* initCGRect(int x, int y, int width, int height) {
    CGRect rect = CGRectMake(x, y, width, height);
    return (__bridge_retained void*)[NSValue valueWithBytes:&rect objCType:@encode(CGRect)];
}
