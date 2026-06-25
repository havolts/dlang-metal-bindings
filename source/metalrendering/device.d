//metalrendering/source/metalrendering/device.d
module metalrendering.device;

import core.attribute : selector;
import metalrendering;

//MTLDevice
extern (Objective-C)
extern class MTLDevice : NSObject
{
    MTLCommandQueue makeCommandQueue() @selector("newCommandQueue");
    MTLLibrary makeDefaultLibrary() @selector("newDefaultLibrary");
    MTLLibrary makeLibrary(NSString source, void* options, void* error) @selector("newLibraryWithSource:options:error:");
    MTLBuffer makeBuffer(const void* bytes, size_t length, size_t options) @selector("newBufferWithBytes:length:options:");
    MTLBuffer makeBuffer(size_t length, size_t options) @selector("newBufferWithLength:options:");
    MTLRenderPipelineState makeRenderPipelineState(MTLRenderPipelineDescriptor rpd, void* error) @selector("newRenderPipelineStateWithDescriptor:error:");
    MTLDepthStencilState makeDepthStencilState(MTLDepthStencilDescriptor descriptor) @selector("newDepthStencilStateWithDescriptor:");
}

extern (C) MTLDevice MTLCreateSystemDefaultDevice();
