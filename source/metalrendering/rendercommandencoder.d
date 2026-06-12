//metalrendering/source/metalrendering/rendercommandencoder.d
module metalrendering.rendercommandencoder;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.renderpipeline;
import metalrendering.buffer;

//MTLRenderCommandEncoder
extern(Objective-C)
extern class MTLRenderCommandEncoder : NSObject
{
    void setRenderPipelineState(MTLRenderPipelineState renderPipelineState) @selector("setRenderPipelineState:");
    void setVertexBuffer(MTLBuffer vertexBuffer, uint offset, uint index) @selector("setVertexBuffer:offset:atIndex:");
    void drawPrimitives(MTLPrimitiveType primitiveType, uint vertexStart, uint vertexCount) @selector("drawPrimitives:vertexStart:vertexCount:");
    void endEncoding() @selector("endEncoding");
}
