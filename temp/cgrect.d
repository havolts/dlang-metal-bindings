module metalrendering.cgrect;

class CGRect
{
    void* ptr;

    this(int x, int y, int width, int height)
    {
        ptr = initCGRect(x, y, width, height);
    }
}

extern (C)
{
    void* initCGRect(int x, int y, int width, int height);
}
