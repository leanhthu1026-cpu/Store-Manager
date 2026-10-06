import SwiftUI

struct CartView: View {
    // Dữ liệu giả lập (sau này sẽ lấy từ ViewModel hoặc Database)
    @State private var cartItems: [CartItem] = SampleData.cartItems
    
    var body: some View {
        NavigationStack {
            VStack {
                if cartItems.isEmpty {
                    // Trường hợp giỏ hàng trống
                    VStack(spacing: 16) {
                        Image(systemName: "cart.badge.minus")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("Giỏ hàng của bạn đang trống")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxHeight: .infinity)
                } else {
                    // Danh sách sản phẩm trong giỏ
                    List {
                        ForEach(cartItems) { item in
                            HStack(spacing: 12) {
                                // Ảnh sản phẩm
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.orange.opacity(0.2))
                                    .frame(width: 60, height: 60)
                                    .overlay(
                                        Image(systemName: item.product.imageName)
                                            .foregroundColor(.orange)
                                    )
                                
                                // Tên & Giá
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.product.name)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text("\(item.product.price, specifier: "%.0f")đ")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                                
                                Spacer()
                                
                                // Số lượng
                                Text("x\(item.quantity)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete { indexSet in
                            cartItems.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(.plain)
                    
                    // Thanh toán
                    VStack(spacing: 12) {
                        Divider()
                        HStack {
                            Text("Tổng cộng:")
                                .font(.headline)
                            Spacer()
                            let total = cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
                            Text("\(total, specifier: "%.0f")đ")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            print("Tiến hành thanh toán")
                        }) {
                            Text("Thanh toán")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 10)
                }
            }
            .navigationTitle("Giỏ hàng")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CartView()
}
