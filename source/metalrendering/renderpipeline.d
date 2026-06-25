//metalrendering/source/metalrendering/renderpipeline.d
module metalrendering.renderpipeline;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.mtlfunction;

//MTLRenderPipelineDescriptor
extern(Objective-C)
extern class MTLRenderPipelineDescriptor : NSObject
{
    static MTLRenderPipelineDescriptor alloc() @selector("alloc");
    MTLRenderPipelineDescriptor init() @selector("init");
    MTLRenderPipelineColorAttachmentDescriptorArray colorAttachments() @selector("colorAttachments");
    MTLFunction vertexFunction() @selector("vertexFunction");
    void vertexFunction(MTLFunction vertFunction) @selector("setVertexFunction:");
    MTLFunction fragmentFunction() @selector("fragmentFunction");
    void fragmentFunction(MTLFunction fragFunction) @selector("setFragmentFunction:");
    NSString label() @selector("label");
    void label(NSString label) @selector("setLabel:");
    void depthAttachmentPixelFormat(MTLPixelFormat pixelFormat) @selector("setDepthAttachmentPixelFormat:");
}

extern (Objective-C)
extern class MTLRenderPipelineColorAttachmentDescriptor : NSObject
{
    MTLPixelFormat pixelFormat() @selector("pixelFormat");
    void pixelFormat(MTLPixelFormat pFormat) @selector("setPixelFormat:");
}

extern (Objective-C)
extern class MTLRenderPipelineColorAttachmentDescriptorArray : NSObject
{
    MTLRenderPipelineColorAttachmentDescriptor opIndex(size_t index) @selector("objectAtIndexedSubscript:");
}

extern (Objective-C)
extern class MTLRenderPipelineState : NSObject
{

}
