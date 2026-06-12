
//metalrendering/source/metalrendering/metal_shim.h
#pragma once
#include <stddef.h>

#import <Metal/Metal.h>
#import <Cocoa/Cocoa.h>

#ifdef __cplusplus
extern "C" {
#endif
//non-specific
void* metal_MTLCreateSystemDefaultDevice();
void  metal_release_object(void* obj);
void metal_retain_object(void* obj);
//MTLDevice
void* metal_makeCommandQueue(void* device);
void* metal_makeLibrary(void* device, void* source);
void* metal_makeBuffer(void* device, void* bytes, size_t length);
void* metal_MTLDevice_makeRenderPipelineState(
    void* device, void* mtlrenderpipelinedescriptor);

//MTKView
void* metal_create_MTKView(void* device, CGRect frame);
void metal_set_MTKView_clear_color(void* view, MTLClearColor color);
void* metal_get_drawable(void* view);
int metal_get_colorPixelFormat(void* view);
//MTLCommandQueue
void* metal_make_command_buffer(void* commandQueue);
//MTLCommandBuffer
void* metal_make_render_command_encoder(void* buffer, void* descriptor);
void metal_present(void* commandBuffer, void* mtldrawable);
void metal_commit(void* commandBuffer);
//MTLRenderPassDescriptor
void* metal_get_render_pass_descriptor(void* view);
void metal_set_mtlrenderpasscolorattachmentdescriptor_load_action(void* ptr, int loadAction);
void metal_set_mtlrenderpasscolorattachmentdescriptor_clear_color(void* ptr, MTLClearColor color);
void* metal_get_mtlrenderpasscolorattachment(void* descriptor, size_t index);
void metal_set_mtlrenderpasscolorattachment(void* descriptor, void* val, size_t index);
//MTLRenderCommandEncoder
void metal_MTLRenderCommandEncoder_setRenderPipelineState(void* rendercommandencoder, void* renderpipelinestate);
void metal_MTLRenderCommandEncoder_setVertexBuffer(void* rendercommandencoder, void* buffer, int offset, int index);
void metal_MTLRenderCommandEncoder_drawPrimitives(void* rendercommandencoder,int primitivetype, int vertexstart, int vertexcount);
void metal_end_encoding(void* encoder);

#define MTLLoadActionDontCare 0
#define MTLLoadActionLoad     1
#define MTLLoadActionClear    2

#define MTLStoreActionDontCare 0
#define MTLStoreActionStore     1
#define MTLStoreActionMultisampleResolve 2

//MTLLibrary
void* metal_makeFunction(void* inLibrary, void* inhavolt);

//MTLRenderPipelineDescriptor
void* metal_create_MTLRenderPipelineDescriptor();
void* metal_MTLRenderPipelineDescriptor_get_vertexFunction(void* mtlrenderpipelinedescriptor);
void metal_MTLRenderPipelineDescriptor_set_vertexFunction(void* mtlrenderpipelinedescriptor, void* mtlfunction);
void* metal_MTLRenderPipelineDescriptor_get_fragmentFunction(void* mtlrenderpipelinedescriptor);
void metal_MTLRenderPipelineDescriptor_set_fragmentFunction(void* mtlrenderpipelinedescriptor, void* mtlfunction);
void* metal_MTLRenderPipelineDescriptor_get_colorAttachments(void* mtlrenderpipelinedescriptor);

//MTLRenderPipelineColorAttachmentDescriptor
void metal_set_mtlrenderpipelinecolorattachmentdescriptor_pixelFormat(void* renderPipelineColorAttachmentDescriptor, int pixelFormat);

//MTLRenderPipelineColorAttachmentDescriptorArray
void* metal_get_mtlrenderpipelinecolorattachmentdescriptor(void* renderpipelinecolorattachmentdescriptorarray, size_t index);
void metal_set_mtlrenderpipelinecolorattachmentdescriptor(void* renderpipelinecolorattachmentdescriptorarray, void* val, size_t index);

#ifdef __cplusplus
}
#endif
