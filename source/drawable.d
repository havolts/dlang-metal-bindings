//metalrendering/source/metalrendering/drawable.d
module drawable;

import core.attribute : selector;
import dmetal;

//MTLDrawable
extern(Objective-C)
extern class MTLDrawable : NSObject
{
    void present() @selector("present");
    MTLTexture texture() @selector("texture");
}
