//Anh Thư

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
                LinearGradient(
                    colors: [
                        Color.blue.opacity(0.35),
                        Color.mint.opacity(0.25),
                        Color.yellow.opacity(0.15)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("YÊU THÍCH")
                        .font(.system(size: 22, weight: .heavy, design: .monospaced))
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
}
