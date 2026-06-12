//source/metalrendering/package.d
module metalrendering;

public import metalrendering.mtkview;
public import metalrendering.cgrect;
public import metalrendering.mtldevice;
public import metalrendering.mtlcommandbuffer;
public import metalrendering.mtlcommandqueue;
public import metalrendering.mtlrendercommandencoder;
public import metalrendering.mtlrenderpassdescriptor;
public import metalrendering.mtlrenderpipelinedescriptor;
public import metalrendering.mtlrenderpipelinestate;
public import metalrendering.mtllibrary;
public import metalrendering.cfrelease;
public import metalrendering.mtlclearcolor;

enum MTLPrimitiveType
{
    point = 0,
    line = 1,
    triangle = 2,
    lineStrip = 3,
    triangleStrip = 4,
    patch = 5
}

MTLDevice MTLCreateSystemDefaultDevice()
{
    return new MTLDevice(createSystemDefaultDevice());
}

extern (C)
{
    void* createSystemDefaultDevice();
}
