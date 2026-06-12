//metalrendering/source/metalrendering/renderpipeline.d
module metalrendering.renderpipeline;

import core.attribute : selector;
import metalrendering.types;

//MTLRenderPipelineDescriptor
extern(Objective-C)
interface MTLRenderPipelineDescriptor : NSObject
{
    static MTLRenderPipelineDescriptor alloc() @selector("alloc");
    MTLRenderPipelineDescriptor init() @selector("init");
    MTLRenderPipelineColorAttachmentDescriptorArray colorAttachments() @selector("colorAttachments");
    MTLFunction vertexFunction() @selector("vertexFunction");
    void vertexFunction(MTLFunction vertFunction) @selector("setVertexFunction:");
    MTLFunction fragmentFunction() @selector("fragmentFunction");
    void fragmentFunction(MTLFunction fragFunction) @selector("setFragmentFunction:");
}

extern (Objective-C)
interface MTLRenderPipelineColorAttachmentDescriptor : NSObject
{
    MTLPixelFormat pixelFormat() @selector("pixelFormat");
    void pixelFormat(MTLPixelFormat pFormat) @selector("setPixelFormat:");
}

extern (Objective-C)
interface MTLRenderPipelineColorAttachmentDescriptorArray : NSObject
{
    MTLRenderPipelineColorAttachmentDescriptor opIndex(size_t index) @selector("objectAtIndexedSubscript:");
}

extern (Objective-C)
interface MTLRenderPipelineState : NSObject
{

}
