import Foundation
import SwiftUI

struct StockItem: Identifiable {
    var id = UUID()
    var title: String
    var price: Double
    var percentChange: Double?
    var ammount: Double

    var color: Color {
        guard let percentChange = percentChange else {
            return Color.black //default
        }
        return percentChange > 0 ? Color.green : Color.red
    }
}
