import SwiftUI

struct ProductSectionView: View {
    var title: String = "Sản phẩm nổi bật"
    var products: [Product] = SampleData.products
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Text("Xem tất cả >")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(products) { item in
                        ProductCardView(product: item)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ProductSectionView()
}
