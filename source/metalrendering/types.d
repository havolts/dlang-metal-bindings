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

extern (Objective-C)
extern class NSAutoreleasePool : NSObject
{
    static NSAutoreleasePool alloc() @selector("alloc");
    NSAutoreleasePool init() @selector("init");
    void drain() @selector("drain");
}

enum MTLStoreAction
{
    dontCare = 0,
    store = 1,
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
    Depth32Float = 252,
}

enum MTLPrimitiveType : size_t
{
    triangle = 3,
}

enum MTLLoadAction : size_t
{
    dontCare = 0,
    load = 1,
    clear = 2,
}

enum MTLResourceOptions : size_t
{
    storageModeShared = 0,
}

enum MTLIndexType : size_t
{
    uint16 = 1,
    uint32 = 2,
}

enum MTLCompareFunction : size_t
{
    lessEqual = 3
}

enum MTLWinding : size_t
{
    MTLWindingClockwise = 0,
    MTLWindingCounterClockwise = 1,
}
enum MTLCullMode : size_t
{
    MTLCullModeNone = 0,
    MTLCullModeFront = 1,
    MTLCullModeBack = 2,
}

alias NSUInteger = size_t;
alias NSInteger = long;
