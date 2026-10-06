import Foundation

struct SampleData {
    // MARK: - Categories
    static let categories: [ProductCategory] = [
        ProductCategory(name: "Cá cảnh", iconName: "fish.fill"),
        ProductCategory(name: "Cây thủy sinh", iconName: "leaf.fill"),
        ProductCategory(name: "Phụ kiện bể", iconName: "cube.fill"),
        ProductCategory(name: "Thiết bị lọc", iconName: "drop.fill")
    ]
    
    // MARK: - Products
    static let products: [Product] = [
        Product(name: "Cá Vàng", categoryId: UUID(), price: 50000, imageName: "fish.fill", description: "Cá vàng khỏe mạnh", stock: 10),
        Product(name: "Cá Betta", categoryId: UUID(), price: 120000, imageName: "fish.fill", description: "Cá betta đẹp", stock: 5),
        Product(name: "Cây Ráy", categoryId: UUID(), price: 35000, imageName: "leaf.fill", description: "Cây thủy sinh dễ trồng", stock: 20),
        Product(name: "Lọc nước", categoryId: UUID(), price: 150000, imageName: "drop.fill", description: "Lọc nước mini", stock: 8)
    ]
    
    // MARK: - Cart Items
    static let cartItems: [CartItem] = [
        CartItem(product: products[0], quantity: 2),
        CartItem(product: products[2], quantity: 1)
    ]
    
    // MARK: - Single Product (dùng cho ProductCardView)
    static let singleProduct = products[0]
}
