//metalrendering/source/metalrendering/commandqueue.d
module metalrendering.commandqueue;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.commandbuffer;

//MTLCommandQueue
extern(Objective-C)
interface MTLCommandQueue : NSObject
{
    MTLCommandBuffer commandBuffer() @selector("commandBuffer");
}
