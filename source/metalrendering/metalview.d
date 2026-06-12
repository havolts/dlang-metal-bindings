import metaldevice, metalframe;

class MetalView
{
    void* metalView;
    this(MetalFrame frame, MetalDevice device)
    {
        void* inFrame = cast(void*) frame;
        void* inDevice = cast(void*) device;
        metalView = initMetalView(inFrame, inDevice);
    }
}

extern (C)
{
    void* initMetalView(void* frame, void* device);
}
