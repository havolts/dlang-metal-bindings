module metalrendering.mtldevice;
import metalrendering;
import std.stdio : writeln;
import std.string;

class MTLDevice
{
    void* ptr;

    this(void* mtldevice)
    {
        this.ptr = mtldevice;
        if (this.ptr is null)
        {
            writeln("Error: Unable to create Metal device.");
            return;
        }
    }

    ~this()
    {
        writeln("MTLDevice destructor called");
    }

    void* makeCommandQueue()
    {
        return makeOBJCCommandQueue(ptr);
    }

    /*func makeLibrary(source: String,options: MTLCompileOptions?) throws -> any MTLLibrary
      MTLCompileOptions not yet available
    */
    void* makeLibrary(string source)
    {
        const char* sourceString = toStringz(source);
        return makeOBJCLibrary(ptr, sourceString);
    }

    /*func makeRenderPipelineState(descriptor: MTLRenderPipelineDescriptor) throws -> any MTLRenderPipelineState */
    MTLRenderPipelineState makeRenderPipelineState(MTLRenderPipelineDescriptor descriptor)
    {
        MTLRenderPipelineState rps = new MTLRenderPipelineState();
        rps.ptr = makeOBJCRenderPipelineState(ptr, descriptor.ptr);
        return rps;
    }

}

extern (C)
{
    void* makeOBJCCommandQueue(void* device);
    void* makeOBJCLibrary(void* device, const char* source);
    void* makeOBJCRenderPipelineState(void* device, void* pipelineDescriptor);
}
