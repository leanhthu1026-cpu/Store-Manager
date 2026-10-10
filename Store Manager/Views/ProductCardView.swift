//Anh Thư

import SwiftUI

struct ProductCardView: View {
    let product: Product
    var cartManager = CartManager.shared
    
    var isFavorite: Bool {
        cartManager.isFavorite(product: product)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orange.opacity(0.12))
                    .frame(height: 100)
                    .overlay(
                        Image(product.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 115, height: 100)
                            .cornerRadius(10)
                            .clipped()
                            .shadow(color: Color.black.opacity(0.24), radius: 2, x: 0, y: 1)
                    )
                
                //Favorite button
                Button(action: {
                    cartManager.toggleFavorite(product: product)
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.caption)
                        .foregroundColor(isFavorite ? .red : .gray)
                        .padding(6)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.12), radius: 2)
                }
                .buttonStyle(.plain)
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
                
                //Add to cart button
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
