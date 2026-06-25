//metalrendering/source/metalrendering/drawable.d
module metalrendering.drawable;

import core.attribute : selector;
import metalrendering;

//MTLDrawable
extern(Objective-C)
extern class MTLDrawable : NSObject
{
    void present() @selector("present");
    MTLTexture texture() @selector("texture");
}
