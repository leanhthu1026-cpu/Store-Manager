//Châu Anh

import SwiftUI

struct ProductSectionView: View {
    var title: String = "Sản phẩm nổi bật"
    var products: [Product] = SampleData.products
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink(destination: AllProductsView(products: products)) {
                    HStack(spacing: 4) {
                        Text("Xem tất cả")
                        Image(systemName: "chevron.right")
                    }
                    .font(.subheadline)
                    .foregroundColor(.blue)
                }
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
