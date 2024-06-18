#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] half4 applyTransform(
    float2 position,
    SwiftUI::Layer layer
) {
    half4 result = layer.sample(position);

    return result;
}
