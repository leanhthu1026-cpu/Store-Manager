import SwiftUI

struct CategoryDetailView: View {
    let category: ProductCategory
    
    // Lọc sản phẩm theo danh mục
    var filteredProducts: [Product] {
        SampleData.products.filter { $0.categoryId == category.id }
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
    var body: some View {
        ZStack {
            // Background chung làm mờ
            Image("background")
                .resizable()
                .scaledToFill()
                .opacity(0.35)
                .blur(radius: 3)
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
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CategoryDetailView(category: SampleData.fullCategories[0])
    }
}
