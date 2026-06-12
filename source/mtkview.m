#import <MetalKit/MetalKit.h>

void* createMTKView(float x, float y, float width, float height) {
    MTKView *mtkView = [[MTKView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    mtkView.device = MTLCreateSystemDefaultDevice();  // Same device, independent views
    mtkView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    return (__bridge_retained void*)mtkView;
}

void setMTKViewDrawableSize(void* mtkView, float width, float height) {
    MTKView* view = (__bridge MTKView*)mtkView;
    view.drawableSize = CGSizeMake(width, height);
}

void* getMTLDevice(void* mtkView) {
    MTKView* view = (__bridge MTKView*)mtkView;
    return (__bridge void*)view.device;
}
