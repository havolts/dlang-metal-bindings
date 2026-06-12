module metalrendering.mtlcommandqueue;

import metalrendering.mtldevice;

class MTLCommandQueue
{
    void* ptr;

    this(void* queue)
    {
        ptr = queue;
    }

    void* makeCommandBuffer()
    {
        return makeOBJCCommandBuffer(ptr);
    }
}

extern (C)
{
    void* makeOBJCCommandBuffer(void* queue);
}
