#import <Metal/Metal.h>

void* createSystemDefaultDevice() {
    id<MTLDevice> device = MTLCreateSystemDefaultDevice();
    if (device == NULL || device == nil) {
            NSLog(@"Failed to create Metal device in OBJC");
            return NULL;
        }
    return (__bridge_retained void*)device;
}
