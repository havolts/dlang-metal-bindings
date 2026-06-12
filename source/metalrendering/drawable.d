//metalrendering/source/metalrendering/drawable.d
module metalrendering.drawable;

import core.attribute : selector;
import metalrendering.types;

//MTLDrawable
extern(Objective-C)
interface MTLDrawable : NSObject
{
    void present() @selector("present");
}
