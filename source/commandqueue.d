//metalrendering/source/metalrendering/commandqueue.d
module commandqueue;

import core.attribute : selector;
import types;
import commandbuffer;

//MTLCommandQueue
extern(Objective-C)
extern class MTLCommandQueue : NSObject
{
    MTLCommandBuffer makeCommandBuffer() @selector("commandBuffer");
}
