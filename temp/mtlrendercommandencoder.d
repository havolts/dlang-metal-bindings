module metalrendering.mtlrendercommandencoder;

import metalrendering;
import core.stdc.stdlib;
import std.stdio;
import std.conv;

class MTLRenderCommandEncoderException : Exception
{
    this(string msg)
    {
        super(msg);
    }
}

class MTLRenderCommandEncoder
{
    void* ptr;
    bool isEncoding = false;

    this(void* renderCommandEncoder)
    {
        this.ptr = renderCommandEncoder;
        isEncoding = true;
    }

    ~this()
    {
        if (isEncoding)
            endEncoding();
    }

    /*

    func setVertexBytes(UnsafeRawPointer, length: Int, attributeStride: Int, index: Int)
    Required

    func setVertexBuffer((any MTLBuffer)?, offset: Int, attributeStride: Int, index: Int)
    Required

    func setVertexBufferOffset(offset: Int, attributeStride: Int, index: Int)
    Required

    func setVertexBuffers([(any MTLBuffer)?], offsets: [Int], attributeStrides: [Int], range: Range<Int>)
    */

    void setVertexBytes(void* _, int length, int index)
    {
        if (isEncoding)
        {
            setOBJCVertexBytes(ptr, _, length, index);
            return;
        }

        string error = "setVertexBytes failed. isEncoding: " ~ to!string(isEncoding);
        throw new MTLRenderCommandEncoderException(error);
    }

    /*func setRenderPipelineState(_ pipelineState: any MTLRenderPipelineState) */
    void setRenderPipelineState(MTLRenderPipelineState _)
    {
        if (isEncoding)
        {
            setOBJCRenderPipelineState(ptr, _.ptr);
            return;
        }

        string error = "setRenderPipelineState failed. isEncoding: " ~ to!string(isEncoding);
        throw new MTLRenderCommandEncoderException(error);
    }

    /*func drawPrimitives(type primitiveType: MTLPrimitiveType, vertexStart: Int, vertexCount: Int) */
    void drawPrimitives(MTLPrimitiveType type, int vertexStart, int vertexCount)
    {
        if (isEncoding)
        {
            drawOBJCEncoderPrimitives(ptr, type, vertexStart, vertexCount);
            return;
        }

        string error = "drawPrimitives failed. isEncoding: " ~ to!string(isEncoding);
        throw new MTLRenderCommandEncoderException(error);
    }

    /*func endEncoding() */
    void endEncoding()
    {
        if (isEncoding)
        {
            endOBJCEncoding(ptr);
            isEncoding = false;
            return;
        }

        string error = "endEncoding failed. isEncoding: " ~ to!string(isEncoding);
        throw new MTLRenderCommandEncoderException(error);
    }
}

extern (C)
{
    void setOBJCRenderPipelineState(void* encoder, void* RenderPipelineState);
    void setOBJCVertexBytes(void* encoder, void* UnsafeRawPointer, int length, int index);
    void drawOBJCEncoderPrimitives(void* encoder, uint primitiveType, uint vertexStart, uint vertexCount);
    void endOBJCEncoding(void* encoder);
}
