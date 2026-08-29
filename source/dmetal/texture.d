module dmetal.texture;

import core.attribute : selector;
import dmetal;

extern (Objective-C)
extern class MTLTexture : NSObject
{
    NSUInteger width() @selector("width");
    NSUInteger height() @selector("height");
    MTLPixelFormat pixelFormat() @selector("pixelFormat");
}
