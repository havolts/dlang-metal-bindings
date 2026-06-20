//metalrendering/source/metalrendering/buffer.d
module metalrendering.buffer;

import core.attribute : selector;
import metalrendering.types;

//MTLBuffer
extern(Objective-C)
extern class MTLBuffer : NSObject
{
    void* contents() @selector("contents");
}
