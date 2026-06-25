module metalrendering.texture;

import core.attribute : selector;
import metalrendering.types;

extern (Objective-C)
extern class MTLTexture : NSObject
{
    NSUInteger width() @selector("width");
    NSUInteger height() @selector("height");
    MTLPixelFormat pixelFormat() @selector("pixelFormat");
}
