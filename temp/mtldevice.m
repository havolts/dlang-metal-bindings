#import <Metal/Metal.h>
void* makeOBJCCommandQueue(void* device) {
    id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;
    id<MTLCommandQueue> commandQueue = [metalDevice newCommandQueue];
    return (__bridge_retained void*)commandQueue;  // Transfer ownership to D
}

void* makeOBJCLibrary(void* device, const char* source) {
    NSString *libraryPath = [NSString stringWithUTF8String:source];
    id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;

    NSError *error = nil;
    id<MTLLibrary> library = [metalDevice newLibraryWithFile:libraryPath error:&error];

    if (!library) {
        NSLog(@"Failed to create library from file: %@\nError: %@", libraryPath, error);
    }

    return (__bridge_retained void*)library;  // Transfer ownership to D
}


void* makeOBJCRenderPipelineState(void* device, void* pipelineDescriptor) {
    id<MTLDevice> metalDevice = (__bridge id<MTLDevice>)device;
    MTLRenderPipelineDescriptor *desc = (__bridge MTLRenderPipelineDescriptor *)pipelineDescriptor;

    NSError *error = nil;
    id<MTLRenderPipelineState> pipelineState = [metalDevice newRenderPipelineStateWithDescriptor:desc error:&error];

    if (!pipelineState) {
        NSLog(@"Error creating pipeline state: %@", error);
        return NULL;
    }

    return (__bridge_retained void *)pipelineState;
}
