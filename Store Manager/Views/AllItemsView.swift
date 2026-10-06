import SwiftUI

// Enum định nghĩa loại dữ liệu cần hiển thị
enum AllItemsType {
    case categories([ProductCategory])
    case products([Product])
}

struct AllItemsView: View {
    let title: String
    let type: AllItemsType
    
    // Lưới 2 cột
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                switch type {
                case .categories(let categories):
                    ForEach(categories) { category in
                        CategoryGridItem(category: category)
                    }
                    
                case .products(let products):
                    ForEach(products) { product in
                        ProductGridItem(product: product)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Grid Item cho Category
struct CategoryGridItem: View {
    let category: ProductCategory
    
    var body: some View {
        VStack(spacing: 12) {
            Circle()
                .fill(Color.blue.opacity(0.1))
                .frame(width: 70, height: 70)
                .overlay(
                    Image(systemName: category.iconName)
                        .font(.title)
                        .foregroundColor(.blue)
                )
            Text(category.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Grid Item cho Product
struct ProductGridItem: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange.opacity(0.2))
                .frame(height: 120)
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
        .padding(8)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Previews
#Preview("Danh mục") {
    NavigationStack {
        AllItemsView(
            title: "Tất cả danh mục",
            type: .categories(SampleData.categories)
        )
    }
}

#Preview("Sản phẩm") {
    NavigationStack {
        AllItemsView(
            title: "Tất cả sản phẩm",
            type: .products(SampleData.products)
        )
    }
}
