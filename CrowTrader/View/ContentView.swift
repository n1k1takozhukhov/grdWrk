import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        VStack {
            TextField("message text", text: $viewModel.messageText)
            DatePicker("Datw", selection: $viewModel.datePicker)
            
            Button("Send") {
                viewModel.fetchData()
            }
            
            Text(viewModel.temperature)
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
