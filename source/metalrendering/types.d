module metalrendering.types;

import core.attribute : selector;

extern (Objective-C)
extern class NSObject
{
    NSObject retain() @selector("retain");
    void release() @selector("release");
}

extern (Objective-C)
extern class NSString : NSObject
{
    static NSString stringWithUTF8String(const(char)* str) @selector("stringWithUTF8String:");
}

// Helper to convert D strings to NSString
NSString ns(string s)
{
    return NSString.stringWithUTF8String(s.ptr);
}

extern (Objective-C)
extern class NSError : NSObject
{
}

struct MTLClearColor
{
    double red, green, blue, alpha;
}

extern (C) struct CGPoint { double x, y; }
extern (C) struct CGSize  { double width, height; }
extern (C) struct CGRect
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
