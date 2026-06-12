
//metalrendering/source/metalrendering/metal_shim.h
#pragma once
#include <stddef.h>

#import <Cocoa/Cocoa.h>

#ifdef __cplusplus
extern "C" {
#endif
//non-specific
void* metal_create_system_default_device();
void  metal_release_object(void* obj);
void metal_retain_object(void* obj);
//MTLDevice
void* metal_create_command_queue(void* device);

//MTLClearColor
typedef struct {
    double red;
    double green;
    double blue;
    double alpha;
} MTLClearColor;
//MTKView
void* metal_create_MTKView(void* device, CGRect frame);
void metal_set_MTKView_clear_color(void* view, MTLClearColor color);
void* metal_get_drawable(void* view);
//MTLCommandQueue
void* metal_make_command_buffer(void* queue);
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
void metal_end_encoding(void* encoder);

#define MTLLoadActionDontCare 0
#define MTLLoadActionLoad     1
#define MTLLoadActionClear    2

#define MTLStoreActionDontCare 0
#define MTLStoreActionStore     1
#define MTLStoreActionMultisampleResolve 2


#ifdef __cplusplus
}
#endif
