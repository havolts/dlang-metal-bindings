//metalrendering/source/metalrendering/library.d
module dmetal.library;

import core.attribute : selector;
import dmetal;

//MTLLibrary
extern(Objective-C)
extern class MTLLibrary : NSObject
{
    MTLFunction makeFunction(NSString name) @selector("newFunctionWithName:");
}
