module metalrendering.types;

import core.attribute : selector;

extern (Objective-C)
interface NSObject
{
    NSObject retain() @selector("retain");
    void release() @selector("release");
}

extern (Objective-C)
interface NSString : NSObject
{
    static NSString stringWithUTF8String(const(char)* str) @selector("stringWithUTF8String:");
}

// Helper to convert D strings to NSString
NSString ns(string s)
{
    return NSString.stringWithUTF8String(s.ptr);
}

extern (Objective-C)
interface NSError : NSObject
{
}

struct MTLClearColor
{
    double red, green, blue, alpha;
}

struct CGPoint { double x, y; }
struct CGSize  { double width, height; }
struct CGRect
{
    CGPoint origin;
    CGSize size;
}

enum MTLPixelFormat : uint
{
    BGRA8Unorm = 80,
}

enum MTLPrimitiveType : uint
{
    triangle = 3,
}

enum MTLLoadAction : uint
{
    MTLLoadActionDontCare = 0,
    MTLLoadActionLoad = 1,
    MTLLoadActionClear = 2,
}

enum MTLResourceOptions : uint
{
    storageModeShared = 0,
}
