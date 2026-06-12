//metalrendering/source/metalrendering/commandbuffer.d
module metalrendering.commandbuffer;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.drawable;
import metalrendering.rendercommandencoder;
import metalrendering.renderpass;

//MTLCommandBuffer
extern(Objective-C)
extern class MTLCommandBuffer : NSObject
{
    MTLRenderCommandEncoder renderCommandEncoderWithDescriptor(MTLRenderPassDescriptor descriptor) @selector("renderCommandEncoderWithDescriptor:");
    void presentDrawable(MTLDrawable drawable) @selector("presentDrawable:");
    void commit() @selector("commit");
}
