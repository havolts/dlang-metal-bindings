#import <Metal/Metal.h>

void* makeOBJCCommandBuffer(void* queue)
{
    id<MTLCommandQueue> commandQueue = (__bridge id<MTLCommandQueue>)queue;
    id<MTLCommandBuffer> commandBuffer = [commandQueue commandBuffer];
    return (__bridge_retained void*)commandBuffer;
}
