//metalrendering/source/metalrendering/renderpass.d
module metalrendering.renderpass;

import core.attribute : selector;
import metalrendering.types;

//MTLRenderPassDescriptor
extern(Objective-C)
interface MTLRenderPassDescriptor : NSObject
{
    static MTLRenderPassDescriptor renderPassDescriptor() @selector("renderPassDescriptor");
    MTLRenderPassColorAttachmentDescriptorArray colorAttachments() @selector("colorAttachments");
}

extern (Objective-C)
interface MTLRenderPassColorAttachmentDescriptor : NSObject
{
    void loadAction(MTLLoadAction action) @selector("setLoadAction:");
    void clearColor(MTLClearColor color) @selector("setClearColor:");
}

extern (Objective-C)
interface MTLRenderPassColorAttachmentDescriptorArray : NSObject
{
    MTLRenderPassColorAttachmentDescriptor opIndex(size_t index) @selector("objectAtIndexedSubscript:");
}
