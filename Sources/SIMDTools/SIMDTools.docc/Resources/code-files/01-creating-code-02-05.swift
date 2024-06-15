import SwiftUI
import SIMDTools

struct ContentView: View {
    private let imageSize: Float32 = 300
    
    var body: some View {
        VStack {
            Image(systemName: "gear.circle")
                .resizable()
                .frame(
                    width: CGFloat(imageSize),
                    height: CGFloat(imageSize)
                )
        }
        .padding()
    }
}
