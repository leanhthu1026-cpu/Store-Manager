import Foundation

struct ProductCategory: Identifiable {
    var id: UUID = UUID()
    var name: String
    var subtitle: String
    var iconName: String
    var bgColorHex: String = "EBF5FB"
}
