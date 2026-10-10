//Châu Anh

import SwiftUI

struct AllCategoriesView: View {
    var title: String = "DANH MỤC SẢN PHẨM"
    let categories: [ProductCategory] = SampleData.fullCategories
    
    let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color.blue.opacity(0.35),
                        Color.mint.opacity(0.25),
                        Color.yellow.opacity(0.15)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(categories) { cat in
                            NavigationLink(destination: CategoryDetailView(category: cat)) {
                                VStack(spacing: 12) {
                                    Image(cat.iconName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 100)
                                        .cornerRadius(16)
                                        .clipped()
                                    
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
                                    .padding(.horizontal, 6)
                                    .padding(.bottom, 6)
                                }
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 70)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.system(size: 22, weight: .heavy, design: .monospaced))
                }
            }
        }
    }
}

#Preview {
    AllCategoriesView()
}
