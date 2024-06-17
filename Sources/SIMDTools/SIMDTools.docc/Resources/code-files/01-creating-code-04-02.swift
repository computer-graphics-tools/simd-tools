import SwiftUI
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
        return []
    }
}
