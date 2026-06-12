#import <Metal/Metal.h>

void setOBJCRenderPipelineState(void* encoder, void* RenderPipelineState) {
    id<MTLRenderCommandEncoder> mtlEncoder = (__bridge id<MTLRenderCommandEncoder>)encoder;
    id<MTLRenderPipelineState> state = (__bridge id<MTLRenderPipelineState>)RenderPipelineState;
    [mtlEncoder setRenderPipelineState:state];
}

void setOBJCVertexBytes(void* encoder, void* UnsafeRawPointer, int length, int index) {
    id<MTLRenderCommandEncoder> mtlEncoder = (__bridge id<MTLRenderCommandEncoder>)encoder;
    [mtlEncoder setVertexBytes:UnsafeRawPointer
                       length:length
                      atIndex:index];
}

void drawOBJCEncoderPrimitives(void* encoder, uint primitiveType, uint vertexStart, uint vertexCount) {
    id<MTLRenderCommandEncoder> mtlEncoder = (__bridge id<MTLRenderCommandEncoder>)encoder;
    [mtlEncoder drawPrimitives:(MTLPrimitiveType)primitiveType
                   vertexStart:vertexStart
                   vertexCount:vertexCount];
}

void endOBJCEncoding(void* encoder) {
    id<MTLRenderCommandEncoder> mtlEncoder = (__bridge id<MTLRenderCommandEncoder>)encoder;
    [mtlEncoder endEncoding];
}
