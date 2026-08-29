//metalrendering/source/metalrendering/library.d
module library;

import core.attribute : selector;
import types;
import mtlfunction;

//MTLLibrary
extern(Objective-C)
extern class MTLLibrary : NSObject
{
    MTLFunction makeFunction(NSString name) @selector("newFunctionWithName:");
}
