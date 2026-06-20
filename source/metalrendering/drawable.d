//metalrendering/source/metalrendering/drawable.d
module metalrendering.drawable;

import core.attribute : selector;
import metalrendering.types;

//MTLDrawable
extern(Objective-C)
extern class MTLDrawable : NSObject
{
    void present() @selector("present");
    MTLTexture texture() @selector("texture");
}
