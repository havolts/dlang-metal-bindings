#import <Foundation/Foundation.h>

void CFReleaseOBJC(void* cf)
{
    if (cf)
        CFRelease(cf);
}
