import SwiftUI

struct ProductSectionView: View {
    var title: String
    var products: [Product]
    var showSeeAll: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header với nút "Xem tất cả"
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                if showSeeAll {
                    NavigationLink(destination: AllItemsView(
                        title: "Tất cả sản phẩm",
                        type: .products(products)
                    )) {
                        HStack(spacing: 4) {
                            Text("Xem tất cả")
                            Image(systemName: "chevron.right")
                        }
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    }
                }
            }
            .padding(.horizontal)
            
            // Danh sách cuộn ngang
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(products) { product in
                        ProductCardView(product: product)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProductSectionView(
            title: "Sản phẩm nổi bật",
            products: SampleData.products,
            showSeeAll: true
        )
    }
}
