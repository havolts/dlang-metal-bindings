#import <Metal/Metal.h>

void* initMTLRenderPassColorAttachmentDescriptor()
{
    MTLRenderPassColorAttachmentDescriptor* descriptor = [[MTLRenderPassColorAttachmentDescriptor alloc] init];
    return (__bridge_retained void*)descriptor;
}
