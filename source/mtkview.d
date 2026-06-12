module macoswindowing.metalview;

extern (C)
{
    void* createMTKView(float x, float y, float width, float height);
    void setMTKViewDrawableSize(void* mtkView, float width, float height);
    void* getMTLDevice(void* mtkView);
}

class MetalView
{
    private void* mtkView;

    this(float x, float y, float width, float height)
    {
        mtkView = createMTKView(x, y, width, height);
    }

    void setDrawableSize(float width, float height)
    {
        setMTKViewDrawableSize(mtkView, width, height);
    }

    void* getDevice()
    {
        return getMTLDevice(mtkView);
    }

    void* getView()
    {
        return mtkView;
    }
}
