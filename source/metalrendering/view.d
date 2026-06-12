//metalrendering/source/metalrendering/view.d
module metalrendering.view;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.device;
import metalrendering.renderpass;
import metalrendering.drawable;

//MTKView
extern(Objective-C)
interface MTKView : NSObject
{
    static MTKView alloc() @selector("alloc");
    MTKView initWithFrame(CGRect frame, MTLDevice device) @selector("initWithFrame:device:");
    MTLClearColor clearColor() @selector ("clearColor");
    void clearColor(MTLClearColor color) @selector("setClearColor:");
    MTLRenderPassDescriptor currentRenderPassDescriptor() @selector ("currentRenderPassDescriptor");
    MTLDrawable currentDrawable() @selector ("currentDrawable");
    MTLPixelFormat colorPixelFormat() @selector ("colorPixelFormat");
    void colorPixelFormat(MTLPixelFormat colorPF) @selector("setColorPixelFormat:");
}
