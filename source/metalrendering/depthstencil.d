module metalrendering.depthstencil;

import core.attribute : selector;
import metalrendering.types;

extern (Objective-C)
extern class MTLDepthStencilState : NSObject
{

}

extern (Objective-C)
extern class MTLDepthStencilDescriptor : NSObject
{
    static MTLDepthStencilDescriptor alloc() @selector("alloc");
    MTLDepthStencilDescriptor init() @selector("init");
    void depthCompareFunction(MTLCompareFunction compareFunction) @selector("setDepthCompareFunction:");
    void depthWriteEnabled(bool b) @selector("setDepthWriteEnabled:");

}
