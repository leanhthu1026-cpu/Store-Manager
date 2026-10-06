import SwiftUI

struct ProductCardView: View {
    let product: Product
    var cartManager = CartManager.shared
    @State private var showAddedAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orange.opacity(0.12))
                    .frame(height: 100)
                    .overlay(
                        Image(systemName: product.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                            .foregroundColor(.orange)
                    )
                
                Image(systemName: "heart")
                    .font(.caption)
                    .padding(6)
                    .background(Color.white)
                    .clipShape(Circle())
                    .padding(6)
            }
            
            Text(product.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(1)
            
            HStack {
                Text(product.formattedPrice)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.red)
                
                Spacer()
                
                // Nút bấm thêm vào giỏ hàng
                Button(action: {
                    cartManager.addToCart(product: product)
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title3)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.plain)
            }
        }
        .frame(width: 120)
        .padding(8)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    ProductCardView(product: SampleData.products[0])
}
