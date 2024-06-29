import SwiftUI
import simd
import SIMDTools

struct ContentView: View {
    private let imageSize: Float32 = 200

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
        }
        .padding()
    }
}
