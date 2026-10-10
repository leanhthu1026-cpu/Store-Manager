//Châu Anh

import SwiftUI

struct AllProductsView: View {
    var title: String = "Tất cả sản phẩm"
    var products: [Product]
    
    let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
    var body: some View {
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
            
            ScrollView(showsIndicators: false) {
                if products.isEmpty {
                    ContentUnavailableView(
                        "Đang cập nhật sản phẩm",
                        systemImage: "tray.fill",
                        description: Text("Các sản phẩm sẽ sớm có mặt!")
                    )
                    .padding(.top, 50)
                } else {
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(products) { product in
                            ProductCardView(product: product)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(16)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("TẤT CẢ SẢN PHẨM")
                    .font(.system(size: 22, weight: .heavy, design: .monospaced))
                    .foregroundColor(.primary)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AllProductsView(products: SampleData.products)
    }
}
