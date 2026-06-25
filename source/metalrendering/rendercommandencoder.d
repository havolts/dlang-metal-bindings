//metalrendering/source/metalrendering/rendercommandencoder.d
module metalrendering.rendercommandencoder;

import core.attribute : selector;
import metalrendering;

//MTLRenderCommandEncoder
extern(Objective-C)
extern class MTLRenderCommandEncoder : NSObject
{
    void setRenderPipelineState(MTLRenderPipelineState renderPipelineState) @selector("setRenderPipelineState:");
    void setDepthStencilState(MTLDepthStencilState state) @selector("setDepthStencilState:");
    void setFrontFacingWinding(MTLWinding winding) @selector("setFrontFacingWinding:");
    void setCullMode(MTLCullMode cullMode) @selector("setCullMode:");
    void setVertexBuffer(MTLBuffer vertexBuffer, size_t offset, size_t index) @selector("setVertexBuffer:offset:atIndex:");
    void drawPrimitives(MTLPrimitiveType primitiveType, size_t vertexStart, size_t vertexCount) @selector("drawPrimitives:vertexStart:vertexCount:");
    void drawIndexedPrimitives(MTLPrimitiveType primitiveType, NSUInteger indexCount, MTLIndexType indexType, MTLBuffer indexBuffer, NSUInteger indexBufferOffset, NSUInteger instanceCount, NSInteger baseVertex, NSUInteger baseInstance) @selector("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:");
    void endEncoding() @selector("endEncoding");
}
