module metalrendering.mtlclearcolor;

import std.stdio;

class MTLClearColor
{
    double red, green, blue, alpha;

    this(double r, double g, double b, double a)
    {
        this.red = r;
        this.green = g;
        this.blue = b;
        this.alpha = a;
    }
}
