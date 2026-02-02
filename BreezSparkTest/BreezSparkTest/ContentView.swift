import SwiftUI
import Gobind

struct ContentView: View {
    @State private var result: String = "Testing..."

    var body: some View {
        VStack(spacing: 20) {
            Text("Breez SDK Spark - iOS Test")
                .font(.headline)

            Text(result)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
        }
        .onAppear {
            result = GobindTestLibraryLoaded()
        }
    }
}
