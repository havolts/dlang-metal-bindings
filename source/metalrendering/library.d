//metalrendering/source/metalrendering/library.d
module metalrendering.library;

import core.attribute : selector;
import metalrendering.types;

//MTLLibrary
extern(Objective-C)
interface MTLLibrary : NSObject
{
    MTLFunction newFunctionWithhavolt(NSString name) @selector("newFunctionWithhavolt:");
}
