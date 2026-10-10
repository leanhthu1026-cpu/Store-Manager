//Anh Thư

import Foundation

struct Product: Identifiable {
    var id: UUID = UUID()
    var name: String
    var categoryId: UUID
    var price: Double
    var imageName: String
    var description: String
    var stock: Int
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        let str = formatter.string(from: NSNumber(value: price)) ?? "\(Int(price))"
        return "\(str)đ"
    }
}
