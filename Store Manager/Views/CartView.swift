import SwiftUI

struct CartView: View {
    @Bindable var cartManager = CartManager.shared
    @Environment(\.dismiss) private var dismiss
    @State private var showSuccessAlert = false
    
    var totalPrice: Double {
        cartManager.cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
    
    func formatCurrency(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        let stringValue = formatter.string(from: NSNumber(value: price)) ?? "\(Int(price))"
        return "\(stringValue)đ"
    }
    
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
                
                VStack(spacing: 0) {
                    if cartManager.cartItems.isEmpty {
                        ContentUnavailableView(
                            "Giỏ hàng trống",
                            systemImage: "cart.badge.minus",
                            description: Text("Hãy thêm các chú cá và phụ kiện yêu thích vào đây nhé!")
                        )
                    } else {
                        List {
                            ForEach($cartManager.cartItems) { $item in
                                HStack(spacing: 14) {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.orange.opacity(0.12))
                                        .frame(width: 54, height: 54)
                                        .overlay(
                                            Image(systemName: item.product.imageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 28, height: 28)
                                                .foregroundColor(.orange)
                                        )
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(item.product.name)
                                            .font(.headline)
                                        Text(item.product.formattedPrice)
                                            .font(.subheadline)
                                            .foregroundColor(.red)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 10) {
                                        Button(action: {
                                            cartManager.decreaseQuantity(item: item)
                                        }) {
                                            Image(systemName: "minus.circle.fill")
                                                .foregroundColor(.gray.opacity(0.7))
                                        }
                                        
                                        Text("\(item.quantity)")
                                            .font(.system(size: 15, weight: .bold))
                                            .frame(minWidth: 20)
                                        
                                        Button(action: {
                                            cartManager.addToCart(product: item.product)
                                        }) {
                                            Image(systemName: "plus.circle.fill")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    .font(.title3)
                                    .buttonStyle(.borderless)
                                }
                                .padding(.vertical, 4)
                                .listRowBackground(Color.white.opacity(0.92))
                            }
                            .onDelete { indices in
                                cartManager.cartItems.remove(atOffsets: indices)
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .listStyle(.insetGrouped)
                        
                        VStack(spacing: 12) {
                            HStack {
                                Text("Tổng thanh toán:")
                                    .font(.headline)
                                Spacer()
                                Text(formatCurrency(totalPrice))
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.red)
                            }
                            
                            Button(action: {
                                cartManager.checkout()
                                showSuccessAlert = true
                            }) {
                                Text("Thanh toán (\(cartManager.totalCount))")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color.blue)
                                    .cornerRadius(12)
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.95).shadow(radius: 2))
                    }
                }
            }
            .navigationTitle("Giỏ hàng")
            .navigationBarTitleDisplayMode(.inline) // Đưa tiêu đề lên thanh trên cùng
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Đóng") {
                        dismiss()
                    }
                    .fontWeight(.medium)
                }
            }
            .alert("Đặt hàng thành công!", isPresented: $showSuccessAlert) {
                Button("OK", role: .cancel) {
                    dismiss()
                }
            } message: {
                Text("Cảm ơn bạn đã mua hàng tại Cá Cảnh Xinh. Đơn hàng đang được chuẩn bị và sẽ sớm được giao!")
            }
        }
    }
}

#Preview {
    CartView()
}
