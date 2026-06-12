//metalrendering/source/metalrendering/rendercommandencoder.d
module metalrendering.rendercommandencoder;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.renderpipelinestate;
import metalrendering.buffer;
import metalrendering.primitivetype;

//MTLRenderCommandEncoder
extern(Objective-C)
interface MTLRenderCommandEncoder : NSObject
{
    void setRenderPipelineState(MTLRenderPipelineState renderPipelineState) @selector("setRenderPipelineState:");
    void setVertexBuffer(MTLBuffer vertexBuffer, uint offset, uint index) @selector("setVertexBuffer:offset:atIndex:");
    void drawPrimitives(MTLPrimitiveType primitiveType, uint vertexStart, uint vertexCount) @selector("drawPrimitives:vertexStart:vertexCount:");
    void endEncoding() @selector("endEncoding");
}
