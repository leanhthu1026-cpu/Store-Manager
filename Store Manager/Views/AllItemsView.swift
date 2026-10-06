import SwiftUI

struct AllItemsView: View {
    var title: String = "Danh mục sản phẩm"
    let categories: [ProductCategory] = SampleData.fullCategories
    
    let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 14) {
                    ForEach(categories) { cat in
                        NavigationLink(destination: CategoryDetailView(category: cat)) {
                            VStack(spacing: 10) {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.blue.opacity(0.08))
                                    .frame(height: 85)
                                    .overlay(
                                        Image(systemName: cat.iconName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.blue)
                                    )
                                
                                VStack(spacing: 4) {
                                    Text(cat.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                        .lineLimit(1)
                                    
                                    Text(cat.subtitle.replacingOccurrences(of: "\n", with: " • "))
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                            }
                            .padding(12)
                            .background(Color(.systemBackground))
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .padding(.bottom, 60)
            }
            .navigationTitle(title)
        }
    }
}

#Preview {
    AllItemsView()
}
