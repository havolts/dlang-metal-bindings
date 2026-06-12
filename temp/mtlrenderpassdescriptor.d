//source/metalrendering/mtlrenderpassdescriptor
module metalrendering.mtlrenderpassdescriptor;

import metalrendering;
import std.stdio;

class MTLRenderPassDescriptor
{
    void* ptr;
    MTLRenderPassColorAttachmentDescriptor[8] colorAttachments = new MTLRenderPassColorAttachmentDescriptor[8];
    this(MTLRenderPassDescriptor descriptor)
    {
        this.ptr = descriptor.ptr;
        this.colorAttachments = descriptor.colorAttachments;
    }

    this(void* descriptor)
    {
        this.ptr = descriptor;
    }

}

class MTLRenderPassColorAttachmentDescriptor
{
    void* ptr;
    this()
    {
        this.ptr = initMTLRenderPassColorAttachmentDescriptor();
    }
}

extern (C)
{
    void* initMTLRenderPassColorAttachmentDescriptor();
}
