module metalrendering.mtllibrary;

import metalrendering;
import std.stdio;
import std.string;

class MTLLibrary
{
    void* ptr;

    this(void* inLibrary)
    {
        ptr = inLibrary;
    }

    ~this()
    {
        if (ptr)
        {
            release(cast(void*) ptr);
            ptr = null;
        }
    }

    void* makeFunction(string name)
    {
        void* func = makeOBJCFunction(ptr, toStringz(name));
        if (func is null)
        {
            writeln("Failed to create function: ", name);
        }
        return func;
    }
}

extern (C)
{
    void* makeOBJCFunction(void* library, const char* name);
}
