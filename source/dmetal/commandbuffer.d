//d-metal/source/commandbuffer.d
module commandbuffer;

import core.attribute : selector;
import dmetal;

//MTLCommandBuffer
extern(Objective-C)
extern class MTLCommandBuffer : NSObject
{
    MTLRenderCommandEncoder makeRenderCommandEncoder(MTLRenderPassDescriptor descriptor) @selector("renderCommandEncoderWithDescriptor:");
    void present(MTLDrawable drawable) @selector("presentDrawable:");
    void commit() @selector("commit");
}
