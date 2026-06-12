#import <Metal/Metal.h>

void* initMTLRenderPipelineDescriptor() {
    MTLRenderPipelineDescriptor* descriptor = [[MTLRenderPipelineDescriptor alloc] init];
    return (__bridge_retained void*)descriptor;
}

void setVertexFunction(void* descriptor, void* vertexFunction) {
    MTLRenderPipelineDescriptor* desc = (__bridge MTLRenderPipelineDescriptor*)descriptor;
    desc.vertexFunction = (__bridge id<MTLFunction>)vertexFunction;
}

void setFragmentFunction(void* descriptor, void* fragmentFunction) {
    MTLRenderPipelineDescriptor* desc = (__bridge MTLRenderPipelineDescriptor*)descriptor;
    desc.fragmentFunction = (__bridge id<MTLFunction>)fragmentFunction;
}

void releaseDescriptor(void* descriptor) {
    MTLRenderPipelineDescriptor* desc = (__bridge_transfer MTLRenderPipelineDescriptor*)descriptor;
    // __bridge_transfer releases on scope exit (i.e., transfers ARC to Objective-C runtime)
}
