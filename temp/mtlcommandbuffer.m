#import <Metal/Metal.h>

void* makeOBJCRenderCommandEncoder(void* commandBuffer, void* renderPassDescriptor) {
    id<MTLCommandBuffer> buffer = (__bridge id<MTLCommandBuffer>)commandBuffer;
    MTLRenderPassDescriptor* descriptor = (__bridge MTLRenderPassDescriptor*)renderPassDescriptor;
    if (buffer == nil || descriptor == nil) {
        NSLog(@"Failed to get valid Metal objects for encoder.");
        return NULL;
    }

    id<MTLRenderCommandEncoder> encoder = [buffer renderCommandEncoderWithDescriptor:descriptor];
    return (__bridge_retained void*)encoder;
}


void OBJCPresent(void* commandBuffer, void* drawable) {
    id<MTLCommandBuffer> buffer = (__bridge id<MTLCommandBuffer>)commandBuffer;
    id<MTLDrawable> mtlDrawable = (__bridge id<MTLDrawable>)drawable;
    [buffer presentDrawable:mtlDrawable];
}

void OBJCCommit(void* commandBuffer) {
    id<MTLCommandBuffer> buffer = (__bridge id<MTLCommandBuffer>)commandBuffer;
    [buffer commit];
}
