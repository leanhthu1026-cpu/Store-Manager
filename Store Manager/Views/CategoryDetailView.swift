//Châu Anh

import SwiftUI

struct CategoryDetailView: View {
    let category: ProductCategory
    
    //Filter Products in Categories
    var filteredProducts: [Product] {
        SampleData.products.filter { $0.categoryId == category.id }
    }
    
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
                if filteredProducts.isEmpty {
                    ContentUnavailableView(
                        "Đang cập nhật sản phẩm",
                        systemImage: "tray.fill",
                        description: Text("Các mặt hàng cho mục \(category.name) sẽ sớm có mặt!")
                    )
                    .padding(.top, 50)
                } else {
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(filteredProducts) { item in
                            ProductCardView(product: item)
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
                Text(category.name)
                    .font(.system(size: 22, weight: .heavy, design: .rounded))
            }
        }
    }
}

#Preview {
    NavigationStack {
        CategoryDetailView(category: SampleData.fullCategories[0])
    }
}
