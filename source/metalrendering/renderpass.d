//metalrendering/source/metalrendering/renderpass.d
module metalrendering.renderpass;

import core.attribute : selector;
import metalrendering.types;

//MTLRenderPassDescriptor
extern(Objective-C)
extern class MTLRenderPassDescriptor : NSObject
{
    static MTLRenderPassDescriptor renderPassDescriptor() @selector("renderPassDescriptor");
    MTLRenderPassColorAttachmentDescriptorArray colorAttachments() @selector("colorAttachments");
}

extern (Objective-C)
extern class MTLRenderPassColorAttachmentDescriptor : NSObject
{
    void texture(MTLTexture texture) @selector("setTexture:");
    void loadAction(MTLLoadAction action) @selector("setLoadAction:");
    void clearColor(MTLClearColor color) @selector("setClearColor:");
    void storeAction(MTLStoreAction action) @selector("setStoreAction:");
}

extern (Objective-C)
extern class MTLRenderPassColorAttachmentDescriptorArray : NSObject
{
    MTLRenderPassColorAttachmentDescriptor opIndex(size_t index) @selector("objectAtIndexedSubscript:");
}
