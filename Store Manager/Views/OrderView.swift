import SwiftUI

struct OrderView: View {
    var cartManager = CartManager.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background làm mờ
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.35)
                    .blur(radius: 3)
                    .ignoresSafeArea()
                
                Group {
                    if cartManager.orders.isEmpty {
                        ContentUnavailableView(
                            "Chưa có đơn hàng nào",
                            systemImage: "doc.text.magnifyingglass",
                            description: Text("Khi bạn thanh toán giỏ hàng, các đơn hàng sẽ xuất hiện tại đây.")
                        )
                    } else {
                        List(cartManager.orders) { order in
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Khách: \(order.customerName)")
                                        .font(.headline)
                                    Spacer()
                                    Text(order.status.rawValue)
                                        .font(.caption)
                                        .bold()
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.orange.opacity(0.15))
                                        .foregroundColor(.orange)
                                        .cornerRadius(6)
                                }
                                
                                Text("Thời gian: \(order.orderDate.formatted(date: .abbreviated, time: .shortened))")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Divider()
                                
                                ForEach(order.items) { item in
                                    HStack {
                                        Text("\(item.product.name) x\(item.quantity)")
                                            .font(.subheadline)
                                        Spacer()
                                        Text((item.product.price * Double(item.quantity)).formattedPrice)
                                            .font(.subheadline)
                                    }
                                }
                                
                                HStack {
                                    Text("Phí giao hàng:")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text(order.shippingFee.formattedPrice)
                                        .font(.caption)
                                }
                            }
                            .padding(.vertical, 6)
                            .listRowBackground(Color.white.opacity(0.92))
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
            }
            .navigationTitle("Đơn hàng")
            .navigationBarTitleDisplayMode(.inline) // Đẩy tiêu đề lên thanh bar trên cùng
        }
    }
}

private extension Double {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        let str = formatter.string(from: NSNumber(value: self)) ?? "\(Int(self))"
        return "\(str)đ"
    }
}

#Preview {
    OrderView()
}
