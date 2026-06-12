//metalrendering/source/metalrendering/metal_shim.d
module metalrendering.metal_shim;

import metalrendering.device;
import metalrendering.types;
import std.stdio;
import core.memory;

class MTLFunction
{
    void* ptr;
    this(void* mtlfunction)
    {
        this.ptr = mtlfunction;
    }

    ~this()
    {
        metal_release_object(this.ptr);
    }
}
//TO BE COMPLETED
struct MTLCompileOptions
{

}

import core.stdc.stdlib : malloc, free;

class MTLBuffer
{
    void* ptr;
    this(void* buffer)
    {
        this.ptr = buffer;
    }

    ~this()
    {
        metal_release_object(this.ptr);
    }
}

class MTLRenderPipelineDescriptor
{
    void* ptr;
    MTLRenderPipelineColorAttachmentDescriptorArray colorAttachments;
    @property MTLFunction vertexFunction()
    {
        return new MTLFunction(metal_MTLRenderPipelineDescriptor_get_vertexFunction(
                ptr));
    }

    @property vertexFunction(
        MTLFunction func)
    {
        metal_MTLRenderPipelineDescriptor_set_vertexFunction(
            ptr, func.ptr);
    }

    @property MTLFunction fragmentFunction()
    {
        return new MTLFunction(metal_MTLRenderPipelineDescriptor_get_fragmentFunction(
                ptr));
    }

    @property fragmentFunction(
        MTLFunction func)
    {
        metal_MTLRenderPipelineDescriptor_set_fragmentFunction(
            ptr, func.ptr);
    }

    this()
    {
        ptr = metal_create_MTLRenderPipelineDescriptor();
        colorAttachments = new MTLRenderPipelineColorAttachmentDescriptorArray(
            metal_MTLRenderPipelineDescriptor_get_colorAttachments(this.ptr));
    }

    this(void* descriptor)
    {
        ptr = descriptor;
        colorAttachments = new MTLRenderPipelineColorAttachmentDescriptorArray(
            metal_MTLRenderPipelineDescriptor_get_colorAttachments(this.ptr));
    }

    ~this()
    {
        metal_release_object(this.ptr);
    }
}

extern (C)
{
    void* metal_create_MTLRenderPipelineDescriptor();
    void* metal_MTLRenderPipelineDescriptor_get_vertexFunction(
        void* mtlrenderpipelinedescriptor);
    void metal_MTLRenderPipelineDescriptor_set_vertexFunction(
        void* mtlrenderpipelinedescriptor, void* mtlfunction);
    void* metal_MTLRenderPipelineDescriptor_get_fragmentFunction(
        void* mtlrenderpipelinedescriptor);
    void metal_MTLRenderPipelineDescriptor_set_fragmentFunction(
        void* mtlrenderpipelinedescriptor, void* mtlfunction);
    void* metal_MTLRenderPipelineDescriptor_get_colorAttachments(void* mtlrenderpipelinedescriptor);
}

//MTLRenderPassColorAttachmentDescriptor
struct MTLRenderPipelineColorAttachmentDescriptor
{
    void* ptr;
    private MTLPixelFormat _pixelFormat;
    @property void pixelFormat(
        MTLPixelFormat pixelFormat)
    {
        _pixelFormat = pixelFormat;
        metal_set_mtlrenderpipelinecolorattachmentdescriptor_pixelFormat(ptr, cast(int) pixelFormat);
    }

    @property MTLPixelFormat pixelFormat()
    {
        return _pixelFormat;
    }

    this(void* inPtr)
    {
        ptr = inPtr;
    }

    ~this()
    {
        metal_release_object(ptr);
    }
}

extern (C)
{
    void metal_set_mtlrenderpipelinecolorattachmentdescriptor_pixelFormat(
        void* renderPipelineColorAttachmentDescriptor, int pixelFormat);
}

class MTLRenderPipelineColorAttachmentDescriptorArray
{
    void* ptr;

    this(void* inPtr)
    {
        this.ptr = inPtr;
    }

    MTLRenderPipelineColorAttachmentDescriptor opIndex(
        size_t index)
    {
        return MTLRenderPipelineColorAttachmentDescriptor(
            metal_get_mtlrenderpipelinecolorattachmentdescriptor(
                this.ptr, index));
    }

    void opIndexAssign(void* val, size_t index)
    {
        metal_set_mtlrenderpipelinecolorattachmentdescriptor(
            this.ptr, val, index);
    }

    ~this()
    {
        metal_release_object(this.ptr);
    }
}

extern (C)
{
    void* metal_get_mtlrenderpipelinecolorattachmentdescriptor(
        void* renderpipelinecolorattachmentdescriptorarray, size_t index);
    void metal_set_mtlrenderpipelinecolorattachmentdescriptor(
        void* renderpipelinecolorattachmentdescriptorarray, void* val, size_t index);
}

//MTLRenderPipelineState
class MTLRenderPipelineState
{
    void* ptr;

    this(
        void* renderpipelinestate)
    {
        this.ptr = renderpipelinestate;
    }

    ~this()
    {
        metal_release_object(this.ptr);
    }
}
