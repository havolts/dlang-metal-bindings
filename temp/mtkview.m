#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>

void* initMTKView(void* frame, void* device) {
    CGRect* cgrect = (CGRect*)frame;
    NSLog(@"Frame: %@", cgrect, @"width:%f", cgrect->size.width);
    id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;
    MTKView* metalView = [[MTKView alloc] initWithFrame:*cgrect device:metalDevice];
    metalView.colorPixelFormat = MTLPixelFormatBGRA8Unorm;
    return (__bridge_retained void*)metalView;
}

void* getCurrentDrawable(void* metalView) {
    MTKView* view = (__bridge MTKView*)metalView;
    id<MTLDrawable> drawable = [view currentDrawable];
    return (__bridge_retained void*)drawable;
}

void* getCurrentRenderPassDescriptor(void* metalView) {
    MTKView* view = (__bridge MTKView*)metalView;
    MTLRenderPassDescriptor* renderPassDescriptor = [view currentRenderPassDescriptor];
    return (__bridge_retained void*)renderPassDescriptor;
}

void setMTKViewClearColor(void* view, double red, double green, double blue, double alpha) {
    MTKView* mtkView = (__bridge MTKView*)view;
    mtkView.clearColor = MTLClearColorMake(red, green, blue, alpha);
}
