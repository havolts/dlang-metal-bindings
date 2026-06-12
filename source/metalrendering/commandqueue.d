//metalrendering/source/metalrendering/commandqueue.d
module metalrendering.commandqueue;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.commandbuffer;

//MTLCommandQueue
extern(Objective-C)
extern class MTLCommandQueue : NSObject
{
    MTLCommandBuffer makeCommandBuffer() @selector("commandBuffer");
}
