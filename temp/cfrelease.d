// source/metalrendering/cfrelease.d
module metalrendering.cfrelease;

// Helper function for D
void release(void* obj)
{
    if (obj)
        CFReleaseOBJC(obj);
}

extern (C)
{
    // CoreFoundation release function
    void CFReleaseOBJC(void* cf);
}
