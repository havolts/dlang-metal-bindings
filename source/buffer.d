//metalrendering/source/metalrendering/buffer.d
module buffer;

import core.attribute : selector;
import types;

//MTLBuffer
extern(Objective-C)
extern class MTLBuffer : NSObject
{
    void* contents() @selector("contents");
}
