//metalrendering/source/metalrendering/renderpass.d
module metalrendering.renderpass;
import core.attribute : selector;
import metalrendering;

//MTLRenderPassDescriptor
extern(Objective-C)
extern class MTLRenderPassDescriptor : NSObject
{
    static MTLRenderPassDescriptor renderPassDescriptor() @selector("renderPassDescriptor");
    MTLRenderPassColorAttachmentDescriptorArray colorAttachments() @selector("colorAttachments");
    MTLRenderPassDepthAttachmentDescriptor depthAttachment() @selector("depthAttachment");
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

extern (Objective-C)
extern class MTLRenderPassDepthAttachmentDescriptor : NSObject
{
    void texture(MTLTexture texture) @selector("setTexture:");
    void loadAction(MTLLoadAction action) @selector("setLoadAction:");
    void clearDepth(double depth) @selector("setClearDepth:");
    void storeAction(MTLStoreAction action) @selector("setStoreAction:");
}
