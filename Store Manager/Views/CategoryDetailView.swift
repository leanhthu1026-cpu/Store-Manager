import SwiftUI

struct CategoryDetailView: View {
    let category: ProductCategory
    
    // Lọc sản phẩm theo categoryId
    var filteredProducts: [Product] {
        SampleData.products.filter { $0.categoryId == category.id }
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
    var body: some View {
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
                        VStack(alignment: .leading, spacing: 8) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.orange.opacity(0.12))
                                .frame(height: 110)
                                .overlay(
                                    Image(systemName: item.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .foregroundColor(.orange)
                                )
                            
                            Text(item.name)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .lineLimit(1)
                            
                            Text(item.description)
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                            
                            Text(item.formattedPrice)
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.red)
                        }
                        .padding(10)
                        .background(Color(.systemBackground))
                        .cornerRadius(14)
                        .shadow(color: Color.black.opacity(0.05), radius: 3)
                    }
                }
                .padding(16)
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
