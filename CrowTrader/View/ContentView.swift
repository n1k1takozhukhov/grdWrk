import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: 
    
    var body: some View {
        VStack {
            Text("Message text")

        }
        .padding()
        .ignoresSafeArea()
    }
}

/*
#Preview {
    ContentView()
}
*/
