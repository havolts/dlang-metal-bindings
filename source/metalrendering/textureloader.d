module metalrendering.textureloader;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.device;
import metalrendering.texture;

extern (Objective-C)
extern class MTKTextureLoader : NSObject
{
    static MTKTextureLoader alloc() @selector("alloc");
    MTKTextureLoader init(MTLDevice device) @selector("initWithDevice:");
    MTLTexture newTexture(NSURL url, void* options, NSError error) @selector("newTextureWithContentsOfURL:options:error:");
}
