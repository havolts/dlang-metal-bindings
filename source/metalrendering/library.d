//metalrendering/source/metalrendering/library.d
module metalrendering.library;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.mtlfunction;

//MTLLibrary
extern(Objective-C)
extern class MTLLibrary : NSObject
{
    MTLFunction makeFunction(NSString name) @selector("newFunctionWithhavolt:");
}
