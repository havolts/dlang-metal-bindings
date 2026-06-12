//source/metalrendering/mtlrenderpipelinedescriptor
module metalrendering.mtlrenderpipelinedescriptor;

import metalrendering;
import std.stdio;

class MTLRenderPipelineDescriptor
{
    void* ptr;

    private void* _vertexFunction;
    @property void vertexFunction(void* vf)
    {
        _vertexFunction = vf;
        setVertexFunction(ptr, vf);
    }

    @property void* vertexFunction()
    {
        return _vertexFunction;
    }

    private void* _fragmentFunction;
    @property void fragmentFunction(void* ff)
    {
        _fragmentFunction = ff;
        setFragmentFunction(ptr, ff);
    }

    @property void* fragmentFunction()
    {
        return _fragmentFunction;
    }

    this()
    {
        writeln("Before:");
        ptr = initMTLRenderPipelineDescriptor();
        writeln("After: Descriptor ptr: ", ptr);

    }

    ~this()
    {
        writeln("Pipeline descriptor destructor.");
        releaseDescriptor(ptr);
    }

}

extern (C)
{
    void* initMTLRenderPipelineDescriptor();
    void setVertexFunction(void* descriptor, void* vertexFunction);
    void setFragmentFunction(void* descriptor, void* fragmentFunction);
    void releaseDescriptor(void* descriptor);
}
