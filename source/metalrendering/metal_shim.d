//metalrendering/source/metalrendering/metal_shim.d
module metalrendering.metal_shim;

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
