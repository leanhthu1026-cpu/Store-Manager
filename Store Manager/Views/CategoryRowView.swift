import SwiftUI

struct CategoryRowView: View {
    let categories: [ProductCategory] = SampleData.fullCategories
    
    let gridRows = [
        GridItem(.fixed(125), spacing: 14),
        GridItem(.fixed(125), spacing: 14)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridRows, spacing: 12) {
                ForEach(categories) { cat in
                    // Bấm vào chuyển sang trang sản phẩm của danh mục đó
                    NavigationLink(destination: CategoryDetailView(category: cat)) {
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color(.systemGray6))
                                .frame(width: 66, height: 66)
                                .overlay(
                                    Image(systemName: cat.iconName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.blue)
                                )
                            
                            Text(cat.name)
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.primary)
                                .lineLimit(1)
                            
                            Text(cat.subtitle)
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .frame(height: 24)
                        }
                        .frame(width: 78)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    NavigationStack {
        CategoryRowView()
    }
}
