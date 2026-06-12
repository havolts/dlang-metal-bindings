//metalrendering/source/metalrendering/metal_shim.mm
#include "metal_shim.h"
#include <Foundation/Foundation.h>
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Cocoa/Cocoa.h>



extern "C" {

    //non-specific
    void* metal_MTLCreateSystemDefaultDevice() {
        id<MTLDevice> device = MTLCreateSystemDefaultDevice();
        return (__bridge_retained void*)device;
    }

    void metal_release_object(void* obj) {
        id o = (__bridge_transfer id)obj;
        o = nil;
    }

    void metal_retain_object(void* obj) {
        id o = (__bridge id)obj;
        CFRetain((__bridge CFTypeRef)o); // retains the Objective-C object
    }


    //MTLDevice
    void* metal_makeCommandQueue(void* device)
    {
        id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;
        id<MTLCommandQueue> commandQueue = [metalDevice newCommandQueue];
        return (__bridge_retained void*)commandQueue;
    }
    void* metal_makeLibrary(void* device, void* source)
    {
        id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;
        NSString* src = (__bridge NSString*)source;
        NSError* error = nil;
        id<MTLLibrary> library = [metalDevice newLibraryWithSource:(src) options:nil error:&error];
        return (__bridge_retained void*)library;
    }
    void* metal_makeBuffer(void* device, void* bytes, size_t length) {
        id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;
        id<MTLBuffer> buffer = [metalDevice newBufferWithBytes:bytes length:length options:MTLResourceStorageModeShared];
        return (__bridge_retained void*)buffer;
    }
    void* metal_MTLDevice_makeRenderPipelineState(void* device, void* mtlrenderpipelinedescriptor)
    {
        id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;
        MTLRenderPipelineDescriptor* rpd = (__bridge MTLRenderPipelineDescriptor*)mtlrenderpipelinedescriptor;
        NSError* error = nil;
        id<MTLRenderPipelineState> pipelineState = [metalDevice newRenderPipelineStateWithDescriptor:rpd error:&error];
        return (__bridge_retained void*)pipelineState;
    }


    //MTKView
    void* metal_create_MTKView(void* device, CGRect frame)
    {
        id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;
        MTKView* mtkView = [[MTKView alloc] initWithFrame:frame device:metalDevice];
        mtkView.colorPixelFormat = MTLPixelFormatBGRA8Unorm;
        return (__bridge_retained void*)mtkView;
    }

    void metal_set_MTKView_clear_color(void* view, MTLClearColor color)
    {
        MTKView* mtkView = (__bridge MTKView*)view;
        mtkView.clearColor = color;
    }
    void* metal_get_drawable(void* view)
    {
        MTKView* mtkView = (__bridge MTKView*)view;
        return (__bridge void*)mtkView.currentDrawable;
    }
    int metal_get_colorPixelFormat(void* view)
    {
        MTKView* mtkView = (__bridge MTKView*)view;
        return (int)mtkView.colorPixelFormat;
    }

    void* metal_make_command_buffer(void* commandQueue)
    {
        id<MTLCommandQueue> metalCommandQueue = (__bridge id<MTLCommandQueue>)commandQueue;
        id<MTLCommandBuffer> commandBuffer = [metalCommandQueue commandBuffer];
        return (__bridge_retained void*)commandBuffer;
    }
    void* metal_make_render_command_encoder(void* buffer, void* descriptor)
    {
        id<MTLCommandBuffer> commandBuffer = (__bridge id<MTLCommandBuffer>)buffer;
        MTLRenderPassDescriptor* passDescriptor = (__bridge MTLRenderPassDescriptor*)descriptor;
        return (__bridge_retained void*) [commandBuffer renderCommandEncoderWithDescriptor:passDescriptor];
    }
    void metal_present(void* commandBuffer, void* mtldrawable)
    {
        id<MTLCommandBuffer> buffer = (__bridge id<MTLCommandBuffer>)commandBuffer;
        id<MTLDrawable> drawable = (__bridge id<MTLDrawable>)mtldrawable;
        [buffer presentDrawable:drawable];
    }
    void metal_commit(void* commandBuffer)
    {
        id<MTLCommandBuffer> buffer = (__bridge id<MTLCommandBuffer>)commandBuffer;
        [buffer commit];
    }


    void* metal_get_render_pass_descriptor(void* view)
    {
        MTKView* mtkView = (__bridge MTKView*)view;
        MTLRenderPassDescriptor* renderPassDescriptor = [mtkView currentRenderPassDescriptor];
        return (__bridge void*)renderPassDescriptor;
    }
    void metal_set_mtlrenderpasscolorattachmentdescriptor_load_action(void* ptr, int loadAction)
    {
        MTLRenderPassColorAttachmentDescriptor* descriptor = (__bridge MTLRenderPassColorAttachmentDescriptor*)ptr;
        MTLLoadAction la = (MTLLoadAction) loadAction;
        descriptor.loadAction = la;
    }
    void metal_set_mtlrenderpasscolorattachmentdescriptor_clear_color(void* ptr, MTLClearColor color)
    {
        MTLRenderPassColorAttachmentDescriptor* descriptor = (__bridge MTLRenderPassColorAttachmentDescriptor*)ptr;
        descriptor.clearColor = color;
    }
    void* metal_get_mtlrenderpasscolorattachment(void* descriptor, NSUInteger index) {
        MTLRenderPassDescriptor* passDesc = (__bridge MTLRenderPassDescriptor*)descriptor;
        return (__bridge void*)[passDesc.colorAttachments objectAtIndexedSubscript:index];
    }

    void metal_set_mtlrenderpasscolorattachment(void* descriptor, void* val, NSUInteger index)
    {
        MTLRenderPassDescriptor* passDesc = (__bridge MTLRenderPassDescriptor*)descriptor;
        MTLRenderPassColorAttachmentDescriptor* attachment = (__bridge MTLRenderPassColorAttachmentDescriptor*)val;
        [passDesc.colorAttachments setObject:attachment atIndexedSubscript:index];
    }

    //MTLRenderCommandEncoder
    void metal_MTLRenderCommandEncoder_setRenderPipelineState(void* rendercommandencoder, void* renderpipelinestate)
    {
        id<MTLRenderCommandEncoder> renderCommandEncoder = (__bridge id<MTLRenderCommandEncoder>) rendercommandencoder;
        id<MTLRenderPipelineState> renderPipelineState = (__bridge id<MTLRenderPipelineState>) renderpipelinestate;
        [renderCommandEncoder setRenderPipelineState:renderPipelineState];
    }
    void metal_MTLRenderCommandEncoder_setVertexBuffer(void* rendercommandencoder, void* buffer, int offset, int index)
    {
        id<MTLRenderCommandEncoder> renderCommandEncoder = (__bridge id<MTLRenderCommandEncoder>) rendercommandencoder;
        id<MTLBuffer> vertexBuffer = (__bridge id<MTLBuffer>) buffer;
        [renderCommandEncoder setVertexBuffer:vertexBuffer offset:(NSUInteger)offset atIndex:(NSUInteger)index];
    }
    void metal_MTLRenderCommandEncoder_drawPrimitives(void* rendercommandencoder,int primitivetype, int vertexstart, int vertexcount)
    {
        id<MTLRenderCommandEncoder> renderCommandEncoder = (__bridge id<MTLRenderCommandEncoder>) rendercommandencoder;
        [renderCommandEncoder drawPrimitives:(MTLPrimitiveType)primitivetype vertexStart:(NSUInteger)vertexstart vertexCount:(NSUInteger)vertexcount];
    }

    void metal_end_encoding(void* encoder)
    {
        id<MTLRenderCommandEncoder> renderCommandEncoder = (__bridge id<MTLRenderCommandEncoder>) encoder;
        [renderCommandEncoder endEncoding];
    }

    void* metal_makeFunction(void* inLibrary, void* inhavolt)
    {
        id<MTLLibrary> library = (__bridge id<MTLLibrary>) inLibrary;
        NSString* name = (__bridge NSString*) inhavolt;
        id<MTLFunction> function = [library newFunctionWithhavolt:name];
        return (__bridge_retained void*) function;
    }

    //MTLRenderPipelineDescriptor
    void* metal_create_MTLRenderPipelineDescriptor()
    {
        MTLRenderPipelineDescriptor* descriptor = [[MTLRenderPipelineDescriptor alloc] init];
        return (__bridge_retained void*) descriptor;
    }
    void* metal_MTLRenderPipelineDescriptor_get_vertexFunction(void* mtlrenderpipelinedescriptor)
    {
        MTLRenderPipelineDescriptor* rpd = (__bridge MTLRenderPipelineDescriptor*) mtlrenderpipelinedescriptor;
        return (__bridge_retained void*)rpd.vertexFunction;
    }
    void metal_MTLRenderPipelineDescriptor_set_vertexFunction(void* mtlrenderpipelinedescriptor, void* mtlfunction)
    {
        MTLRenderPipelineDescriptor* rpd = (__bridge MTLRenderPipelineDescriptor*) mtlrenderpipelinedescriptor;
        rpd.vertexFunction = (__bridge id<MTLFunction>) mtlfunction;
    }
    void* metal_MTLRenderPipelineDescriptor_get_fragmentFunction(void* mtlrenderpipelinedescriptor)
    {
        MTLRenderPipelineDescriptor* rpd = (__bridge MTLRenderPipelineDescriptor*) mtlrenderpipelinedescriptor;
        return (__bridge_retained void*)rpd.fragmentFunction;
    }
    void metal_MTLRenderPipelineDescriptor_set_fragmentFunction(void* mtlrenderpipelinedescriptor, void* mtlfunction)
    {
        MTLRenderPipelineDescriptor* rpd = (__bridge MTLRenderPipelineDescriptor*) mtlrenderpipelinedescriptor;
        rpd.fragmentFunction = (__bridge id<MTLFunction>) mtlfunction;
    }
    void* metal_MTLRenderPipelineDescriptor_get_colorAttachments(void* mtlrenderpipelinedescriptor)
    {
        MTLRenderPipelineDescriptor* rpd = (__bridge MTLRenderPipelineDescriptor*) mtlrenderpipelinedescriptor;
        return (__bridge_retained void*)rpd.colorAttachments;

    }

    //MTLRenderPipelineColorAttachmentDescriptor
    void metal_set_mtlrenderpipelinecolorattachmentdescriptor_pixelFormat(void* renderpipelinecolorattachmentdescriptor, int pixelFormat)
    {
        MTLRenderPipelineColorAttachmentDescriptor* descriptor = (__bridge MTLRenderPipelineColorAttachmentDescriptor*) renderpipelinecolorattachmentdescriptor;
        MTLPixelFormat pf = (MTLPixelFormat)pixelFormat;
        descriptor.pixelFormat = pf;
    }

    //MTLRenderPipelineColorAttachmentDescriptorArray
    void* metal_get_mtlrenderpipelinecolorattachmentdescriptor(void* renderpipelinecolorattachmentdescriptorarray, size_t index)
    {
        MTLRenderPipelineColorAttachmentDescriptorArray* descriptor = (__bridge MTLRenderPipelineColorAttachmentDescriptorArray*)renderpipelinecolorattachmentdescriptorarray;
        return (__bridge_retained void*) [descriptor objectAtIndexedSubscript:index];
    }

    void metal_set_mtlrenderpipelinecolorattachmentdescriptor(void* renderpipelinecolorattachmentdescriptorarray, void* val, size_t index)
    {
        MTLRenderPipelineColorAttachmentDescriptorArray* descriptor = (__bridge MTLRenderPipelineColorAttachmentDescriptorArray*) renderpipelinecolorattachmentdescriptorarray;
        MTLRenderPipelineColorAttachmentDescriptor* attachment = (__bridge MTLRenderPipelineColorAttachmentDescriptor*) val;
        [descriptor setObject:attachment atIndexedSubscript:index];
    }

}
