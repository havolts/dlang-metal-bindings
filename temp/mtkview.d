module metalrendering.mtkview;

import metalrendering;
import std.stdio;

class MTKView
{
    void* ptr;
    private MTLClearColor _clearColour;
    @property void clearColour(MTLClearColor color)
    {
        _clearColour = color;
        setMTKViewClearColor(ptr, _clearColour.red, _clearColour.green, _clearColour.blue, _clearColour
                .alpha); // Use the stored color
    }

    @property MTLClearColor clearColour()
    {
        return _clearColour;
    }

    private MTLRenderPassDescriptor _currentRenderPassDescriptor;
    @property MTLRenderPassDescriptor currentRenderPassDescriptor()
    {
        if (_currentRenderPassDescriptor is null)
        {
            _currentRenderPassDescriptor = new
            MTLRenderPassDescriptor(getCurrentRenderPassDescriptor(ptr));
        }
        return _currentRenderPassDescriptor;
    }

    @property void currentRenderPassDescriptor(void* descriptor)
    {
        _currentRenderPassDescriptor = new MTLRenderPassDescriptor(descriptor);
    }

    this(CGRect frame, MTLDevice device)
    {
        ptr = initMTKView(frame.ptr, device.ptr);
        currentRenderPassDescriptor = getCurrentRenderPassDescriptor(ptr);
    }

    ~this()
    {
        writeln("MTKView destructor called");
        if (ptr !is null)
        {
            release(ptr);
        }
    }

    void* currentDrawable()
    {
        return getCurrentDrawable(ptr);
    }
}

extern (C)
{
    void* initMTKView(void* frame, void* device);
    void* getCurrentDrawable(
        void* metalView);
    void* getCurrentRenderPassDescriptor(
        void* metalView);
    void setMTKViewClearColor(void* view, double red, double green, double blue, double alpha);
}
