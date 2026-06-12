//metalrendering/source/metalrendering/metal_shim.d
module metalrendering.metal_shim;
import std.stdio;

//Non-specific
MTLDevice MTLCreateSystemDefaultDevice()
{
    printf("Device created\n");
    return new MTLDevice(metal_create_system_default_device());
}

extern (C)
{
    void* metal_create_system_default_device();
    void metal_release_object(void* obj);
    void metal_retain_object(void* obj);

}

//MTLDevice
class MTLDevice
{
    void* ptr;

    this(void* device)
    {
        this.ptr = device;
    }

    void release()
    {
        printf("Device released\n");
        metal_release_object(ptr);
    }

    MTLCommandQueue makeCommandQueue()
    {
        MTLCommandQueue queue = new MTLCommandQueue(metal_create_command_queue(ptr));
        return queue;
    }

    ~this()
    {
        release();
    }
}

extern (C)
{
    void* metal_create_command_queue(void* ptr);
}
//CGRect
extern (C) struct CGPoint
{
    double x;
    double y;
}

extern (C) struct CGSize
{
    double width;
    double height;
}

extern (C) struct CGRect
{
    CGPoint origin;
    CGSize size;

    this(double x, double y, double width, double height)
    {
        origin = CGPoint(x, y);
        size = CGSize(width, height);
    }
}

//MTLClearColor
struct MTLClearColor
{
    double red;
    double green;
    double blue;
    double alpha;

    this(double r, double g, double b, double a)
    {
        red = r;
        green = g;
        blue = b;
        alpha = a;
    }
}

extern (C)
{
    void* metal_create_MTLColor(double red, double green, double blue, double alpha);
}

//MTKView
class MTKView
{
    void* ptr;
    private MTLClearColor _clearColour;
    @property void clearColor(MTLClearColor color)
    {
        _clearColour = color;
        metal_set_MTKView_clear_color(ptr, _clearColour);
    }

    @property MTLClearColor clearColor()
    {
        return _clearColour;
    }

    @property MTLRenderPassDescriptor currentRenderPassDescriptor()
    {
        return new MTLRenderPassDescriptor(metal_get_render_pass_descriptor(ptr));
    }

    @property MTLDrawable currentDrawable()
    {
        return MTLDrawable(metal_get_drawable(ptr));
    }

    this(MTLDevice device, CGRect frame)
    {
        this.ptr = metal_create_MTKView(device.ptr, frame);
        metal_retain_object(this.ptr);
        writeln("View made: ", ptr);
    }

    ~this()
    {
        writeln("View released: ", ptr);
        metal_release_object(ptr);
    }
}

extern (C)
{
    void* metal_create_MTKView(void* device, CGRect frame);
    void metal_set_MTKView_clear_color(void* view, MTLClearColor color);
    void* metal_get_drawable(void* view);
}

//MTLCommandQueue
class MTLCommandQueue
{
    void* ptr;

    this(void* queue)
    {
        ptr = queue;
    }

    MTLCommandBuffer makeCommandBuffer()
    {
        return new MTLCommandBuffer(metal_make_command_buffer(ptr));
    }

    ~this()
    {
        metal_release_object(ptr);
    }
}

extern (C)
{
    void* metal_make_command_buffer(void* queue);
}

//MTLCommandBuffer
class MTLCommandBuffer
{
    void* ptr;

    this(void* buffer)
    {
        ptr = buffer;
    }

    MTLRenderCommandEncoder makeRenderCommandEncoder(MTLRenderPassDescriptor descriptor)
    {
        return new MTLRenderCommandEncoder(metal_make_render_command_encoder(ptr, descriptor.ptr));
    }

    void present(MTLDrawable drawable)
    {
        metal_present(ptr, drawable.ptr);
    }

    void commit()
    {
        metal_commit(ptr);
    }

    ~this()
    {
        metal_release_object(ptr);
    }
}

extern (C)
{
    void* metal_make_render_command_encoder(void* commandBuffer, void* renderPassDescriptor);
    void metal_present(void* commandBuffer, void* mtldrawable);
    void metal_commit(void* commandBuffer);
}

//MTLRenderPassDescriptor
class MTLRenderPassDescriptor
{
    void* ptr;
    MTLRenderPassColorAttachmentDescriptorArray colorAttachments;

    this(void* descriptor)
    {
        ptr = descriptor;
        colorAttachments = new MTLRenderPassColorAttachmentDescriptorArray(descriptor);
    }
}

extern (C)
{
    void* metal_get_render_pass_descriptor(void* view);
}

enum MTLLoadAction
{
    MTLLoadActionDontCare = 0,
    MTLLoadActionLoad = 1,
    MTLLoadActionClear = 2,
}

//MTLRenderPassColorAttachmentDescriptor
struct MTLRenderPassColorAttachmentDescriptor
{
    void* ptr;
    private MTLLoadAction _loadAction;
    @property void loadAction(MTLLoadAction action)
    {
        _loadAction = action;
        metal_set_mtlrenderpasscolorattachmentdescriptor_load_action(ptr, cast(int) _loadAction);
    }

    @property MTLLoadAction loadAction()
    {
        return _loadAction;
    }

    private MTLClearColor _clearColour;
    @property void clearColor(MTLClearColor color)
    {
        _clearColour = color;
        metal_set_mtlrenderpasscolorattachmentdescriptor_clear_color(ptr, color);
    }

    @property MTLClearColor clearColor()
    {
        return _clearColour;
    }

    this(void* descriptor)
    {
        ptr = descriptor;
    }

    ~this()
    {
        metal_release_object(ptr);
    }
}

extern (C)
{
    void metal_set_mtlrenderpasscolorattachmentdescriptor_load_action(void* ptr, int loadAction);
    void metal_set_mtlrenderpasscolorattachmentdescriptor_clear_color(void* ptr, MTLClearColor color);
}

//MTLRenderPassColorAttachmentDescriptorArray
class MTLRenderPassColorAttachmentDescriptorArray
{
    void* descriptor;
    MTLRenderPassColorAttachmentDescriptor[] array;

    this(void* descriptor)
    {
        this.descriptor = descriptor;
    }

    MTLRenderPassColorAttachmentDescriptor opIndex(size_t index)
    {
        return MTLRenderPassColorAttachmentDescriptor(
            metal_get_mtlrenderpasscolorattachment(descriptor, index));
    }

    void opIndexAssign(void* val, size_t index)
    {
        array[index] = MTLRenderPassColorAttachmentDescriptor(val);
        metal_set_mtlrenderpasscolorattachment(descriptor, val, index);
    }
}

extern (C)
{
    void* metal_get_mtlrenderpasscolorattachment(void* descriptor, size_t index);
    void metal_set_mtlrenderpasscolorattachment(void* descriptor, void* val, size_t index);
}

//MTLRenderCommandEncoder
class MTLRenderCommandEncoder
{
    void* ptr;

    this(void* commandEncoder)
    {
        this.ptr = commandEncoder;
    }

    void endEncoding()
    {
        metal_end_encoding(ptr);
    }

    ~this()
    {
        metal_release_object(ptr);
    }
}

extern (C)
{
    void metal_end_encoding(void* encoder);
}

struct MTLDrawable
{
    void* ptr;

    this(void* drawable)
    {
        this.ptr = drawable;
    }
}
