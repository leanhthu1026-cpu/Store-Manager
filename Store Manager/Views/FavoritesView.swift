import SwiftUI

struct FavoritesView: View {
    var cartManager = CartManager.shared
    
    let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
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
                    if cartManager.favoriteProducts.isEmpty {
                        ContentUnavailableView(
                            "Chưa có sản phẩm yêu thích",
                            systemImage: "heart.slash",
                            description: Text("Hãy bấm vào biểu tượng trái tim trên các sản phẩm bạn yêu thích nhé!")
                        )
                    } else {
                        ScrollView(showsIndicators: false) {
                            LazyVGrid(columns: columns, spacing: 14) {
                                ForEach(cartManager.favoriteProducts) { product in
                                    ProductCardView(product: product)
                                        .frame(maxWidth: .infinity)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                            .padding(.bottom, 70)
                        }
                    }
                }
            }
            .navigationTitle("Yêu thích")
            .navigationBarTitleDisplayMode(.inline) // Đưa tiêu đề lên thanh bar trên cùng
        }
    }
}

#Preview {
    FavoritesView()
}
