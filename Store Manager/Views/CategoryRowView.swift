//Anh Thư

import SwiftUI

struct CategoryRowView: View {
    let categories: [ProductCategory] = SampleData.fullCategories
    
    let gridRows = [
        GridItem(.fixed(140), spacing: 14),
        GridItem(.fixed(140), spacing: 14)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Danh mục")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridRows, spacing: 14) {
                    ForEach(categories) { cat in
                        NavigationLink(destination: CategoryDetailView(category: cat)) {
                            VStack(spacing: 8) {
                                Image(cat.iconName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 72, height: 72)
                                    .cornerRadius(18)
                                    .clipped()
                                    .shadow(color: Color.black.opacity(0.24), radius: 2, x: 0, y: 1)
                                
                                Text(cat.name)
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.primary)
                                    .lineLimit(1)
                                
                                Text(cat.subtitle)
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                    .frame(height: 26)
                            }
                            .frame(width: 82)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    NavigationStack {
        CategoryRowView()
    }
}
