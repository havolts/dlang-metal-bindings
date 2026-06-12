//metalrendering/source/metalrendering/device.d
module metalrendering.device;

import core.attribute : selector;
import metalrendering.types;
import metalrendering.commandqueue;
import metalrendering.library;
import metalrendering.buffer;
import metalrendering.renderpipeline;

//MTLDevice
extern (Objective-C)
extern class MTLDevice : NSObject
{
    MTLCommandQueue makeCommandQueue() @selector("newCommandQueue");
    MTLLibrary makeLibrary(NSString source, void* options, void* error) @selector("newLibraryWithSource:options:error:");
    MTLBuffer makeBuffer(const void* bytes, size_t length, uint options) @selector("newBufferWithBytes:length:options:");
    MTLRenderPipelineState makeRenderPipelineState(MTLRenderPipelineDescriptor rpd, void* error) @selector("newRenderPipelineStateWithDescriptor:error:");
}

extern (C) MTLDevice MTLCreateSystemDefaultDevice();
