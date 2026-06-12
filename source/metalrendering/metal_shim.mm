

//metalrendering/source/metalrendering/metal_shim.mm
#include <Foundation/Foundation.h>
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Cocoa/Cocoa.h>



extern "C" {

    //non-specific
    void* metal_create_system_default_device() {
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
    void* metal_create_command_queue(void* device) {
        id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;
        id<MTLCommandQueue> commandQueue = [metalDevice newCommandQueue];
        return (__bridge_retained void*)commandQueue;
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
    void metal_set_mtlrenderpasscolorattachmentdescriptor_load_action(void* ptr, MTLLoadAction loadAction)
    {
        MTLRenderPassColorAttachmentDescriptor* descriptor = (__bridge MTLRenderPassColorAttachmentDescriptor*)ptr;
        descriptor.loadAction = loadAction;
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


    void metal_end_encoding(void* encoder)
    {
        id<MTLRenderCommandEncoder> renderCommandEncoder = (__bridge id<MTLRenderCommandEncoder>) encoder;
        [renderCommandEncoder endEncoding];
    }
}
