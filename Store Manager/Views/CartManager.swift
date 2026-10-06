import SwiftUI

@Observable
class CartManager {
    static let shared = CartManager()
    
    // Giỏ hàng mẫu ban đầu
    var cartItems: [CartItem] = SampleData.cartItems
    
    // Danh sách đơn hàng được quản lý tập trung
    var orders: [Order] = SampleData.orders
    
    // Tổng số lượng món hiển thị trên chấm đỏ
    var totalCount: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
    
    // Thêm sản phẩm vào giỏ
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    // Giảm số lượng hoặc xóa khỏi giỏ
    func decreaseQuantity(item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
    }
    
    // Xử lý thanh toán: Đẩy đơn mới lên đầu danh sách và làm trống giỏ
    func checkout(customerName: String = "Anh Thư") {
        guard !cartItems.isEmpty else { return }
        
        let newOrder = Order(
            customerName: customerName,
            items: cartItems,
            orderDate: Date(),
            status: .preparing,
            shippingFee: 15000
        )
        
        // Thêm đơn hàng mới vào đầu danh sách
        orders.insert(newOrder, at: 0)
        
        // Xóa giỏ hàng
        cartItems.removeAll()
    }
}
