#import <Metal/Metal.h>

void* makeOBJCFunction(void* library, const char* name) {
    id<MTLLibrary> metalLib = (__bridge id<MTLLibrary>)library;
    NSString* functionhavolt = [NSString stringWithUTF8String:name];

    id<MTLFunction> function = [metalLib newFunctionWithhavolt:functionhavolt];
    return (__bridge_retained void*)function;
}
