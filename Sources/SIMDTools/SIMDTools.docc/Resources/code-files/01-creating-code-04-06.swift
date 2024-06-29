import SwiftUI
import simd
import SIMDTools

struct ContentView: View {
    private let imageSize: Float32 = 300
    @State private var angleInDegrees: Float32 = 0

    var body: some View {
        VStack {
            Image(systemName: "gear.circle")
                .resizable()
                .frame(
                    width: CGFloat(imageSize),
                    height: CGFloat(imageSize)
                )
                .foregroundStyle(Color.secondary)
                .layerEffect(
                    ShaderLibrary.applyTransform(.floatArray(calculateTransform())),
                    maxSampleOffset: .zero
                )
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)
            Text(String(format: "Angle: %.2f", angleInDegrees))
                .padding()
            Slider(value: $angleInDegrees, in: 0...360)
                .frame(width: CGFloat(imageSize))
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)
        }
        .padding()
    }

    func calculateTransform() -> [Float] {
        let angle = Angle(degrees: angleInDegrees)
        let offset = SIMD2(repeating: imageSize / 2)
        let transform: float3x3 = .translate(value: offset) * .rotate(angle: angle) * .translate(value: -offset)
        return [
            transform[0][0], transform[0][1], transform[0][2],
            transform[1][0], transform[1][1], transform[1][2],
            transform[2][0], transform[2][1], transform[2][2]
        ]
    }
}
