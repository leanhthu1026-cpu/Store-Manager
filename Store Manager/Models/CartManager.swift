//Anh Thư

import SwiftUI

@Observable
class CartManager {
    static let shared = CartManager()
    
    // Giỏ hàng
    var cartItems: [CartItem] = SampleData.cartItems
    
    // Đơn hàng
    var orders: [Order] = SampleData.orders
    
    // Quản lý ID các sản phẩm được yêu thích
    var favoriteProductIDs: Set<UUID> = []
    
    // Tổng số lượng item hiển thị badge
    var totalCount: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
    
    // Kiểm tra trạng thái đã yêu thích
    func isFavorite(product: Product) -> Bool {
        favoriteProductIDs.contains(product.id)
    }
    
    // Bật/tắt yêu thích
    func toggleFavorite(product: Product) {
        if favoriteProductIDs.contains(product.id) {
            favoriteProductIDs.remove(product.id)
        } else {
            favoriteProductIDs.insert(product.id)
        }
    }
    
    // Lấy danh sách sản phẩm yêu thích thực tế
    var favoriteProducts: [Product] {
        SampleData.products.filter { favoriteProductIDs.contains($0.id) }
    }
    
    // Thêm vào giỏ hàng
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    // Giảm số lượng
    func decreaseQuantity(item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
    }
    
    // Xử lý thanh toán
    func checkout(customerName: String = "Nguyen Van A") {
        guard !cartItems.isEmpty else { return }
        
        let newOrder = Order(
            customerName: customerName,
            items: cartItems,
            orderDate: Date(),
            status: .preparing,
            shippingFee: 15000
        )
        orders.insert(newOrder, at: 0)
        cartItems.removeAll()
    }
}
