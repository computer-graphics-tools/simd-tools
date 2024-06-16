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
                .foregroundStyle(
                    .linearGradient(
                        colors: [.red, .orange],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            Text(String(format: "Angle: %.2f", angleInDegrees))
            Slider(value: $angleInDegrees, in: -180...180)
        }
        .padding()
    }

    func calculateTransform() -> [Float] {
        let angle = Angle(degrees: angleInDegrees)
        return []
    }
}
