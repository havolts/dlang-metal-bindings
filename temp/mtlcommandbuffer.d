module metalrendering.mtlcommandbuffer;

import metalrendering.mtldevice;
import std.stdio;

class MTLCommandBuffer
{
    void* ptr;

    this(void* buffer)
    {
        ptr = buffer;
    }

    void* makeRenderCommandEncoder(void* descriptor)
    {
        return makeOBJCRenderCommandEncoder(ptr, descriptor);
    }

    void present(void* drawable)
    {
        OBJCPresent(ptr, drawable);
    }

    void commit()
    {
        OBJCCommit(ptr);
    }
}

extern (C)
{
    void* makeOBJCRenderCommandEncoder(void* commandBuffer, void* renderPassDescriptor);
    void OBJCPresent(void* commandBuffer, void* drawable);
    void OBJCCommit(void* commandBuffer);
}
