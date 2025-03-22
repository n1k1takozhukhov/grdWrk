import SwiftUI

struct StockPreview: View {
    
    @State private var price = ""
    enum Event {
        case close
    }
    weak var coordinator: StockPreviewEventHandling?
    
    var body: some View {
        NavigationView {
            
            VStack {
                Rectangle()
                    .frame(width: 370, height: 250)
                    .foregroundStyle(Color.gray)
                    .padding()
                
                Section {
                    HStack {
                        Text("APPL")
                            .font(.title)
                        
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("180$")
                            Text("+ 3.2%")
                        }
                    }
                    .padding().background(Color.yellow)
                    .cornerRadius(16)
                }
            }
            
            Section {
                VStack {
                    HStack {
                        Text("Volume")
                            .font(.headline)
                        
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("180$")
                        }
                    }
                    .padding(10)
                    
                    HStack {
                        Text("Price to book")
                            .font(.headline)
                        
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("1.2")
                        }
                    }
                    .padding(10)
                    
                    HStack {
                        Text("average 30d")
                            .font(.headline)
                        
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("180$")
                        }
                    }
                    .padding(10)
                    
                    HStack {
                        Text("average 60d")
                            .font(.headline)
                        
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("180$")
                        }
                    }
                    .padding(10)
                }
                .padding()
                .background(Color.yellow)
                .cornerRadius(16)
            }
            
            
            HStack {
                Text("Price")
                    .font(.headline)
                
                Spacer()
            }
            
            Section {
                
                TextField("Enter price", text: $price)
                    .keyboardType(.decimalPad)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemGray6))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.green, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 2, y: 2)
                
                Button(action: {
                    //todo
                }) {
                    Text("Buy")
                        .frame(width: 370, height: 50, alignment: .center)
                }
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(25)
            }
            .padding()
            
        }
        .navigationTitle("APPL")
        .toolbar() {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {}) {
                    Text("Cancel")
                        .foregroundStyle(Color.green)
                }
            }
               
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}) {
                    Text("Watch")
                        .foregroundColor(Color.green)
                }
            }
        }
    }
    
}
