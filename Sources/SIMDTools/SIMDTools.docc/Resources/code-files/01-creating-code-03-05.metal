#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] half4 applyTransform(
    float2 position,
    SwiftUI::Layer layer,
    device const float *data,
    int count
) {
    float3x3 transform = {
        {data[0], data[1], data[2]},
        {data[3], data[4], data[5]},
        {data[6], data[7], data[8]}
    };
    
    half4 result = layer.sample(position);

    return result;
}
