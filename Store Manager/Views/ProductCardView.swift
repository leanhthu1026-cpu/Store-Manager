import SwiftUI

struct ProductCardView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange.opacity(0.2))
                .frame(width: 120, height: 120)
                .overlay(
                    Image(systemName: product.imageName)
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                )
            
            Text(product.name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(1)
            
            Text("\(product.price, specifier: "%.0f")đ")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
        .frame(width: 120)
    }
}

#Preview {
    ProductCardView(product: SampleData.singleProduct)
}
