//Anh Thư

import Foundation

extension Double {
    var toVND: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        let formatted = formatter.string(from: NSNumber(value: self)) ?? "\(Int(self))"
        return "\(formatted)đ"
    }
}
