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
interface MTLDevice : NSObject
{
    MTLCommandQueue newCommandQueue() @selector("newCommandQueue");
    MTLLibrary newLibraryWithSource(NSString source, void* options, void* error) @selector("newLibraryWithSource:options:error:");
    MTLBuffer newBufferWithBytes(const void* bytes, size_t length, uint options) @selector("newBufferWithBytes:length:options:");
    MTLRenderPipelineState newRenderPipelineStateWithDescriptor(MTLRenderPipelineDescriptor rpd, void* error) @selector("newRenderPipelineStateWithDescriptor:error:");
}

extern (C) MTLDevice MTLCreateSystemDefaultDevice();
