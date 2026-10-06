import SwiftUI

struct HomeView: View {
    @State private var categories: [ProductCategory] = []
    @State private var products: [Product] = []
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    
                    // 1. Header
                    HomeHeaderView(
                        storeName: "Cá Cảnh Xinh",
                        subtitle: "Thế giới thủy sinh trong tầm tay ♡"
                    )
                    
                    // 2. Location row + Search bar
                    VStack(spacing: 12) {
                        // LocationRowView
                        HStack {
                            Image(systemName: "mappin.and.ellipse").foregroundColor(.blue)
                            Text("Giao đến: Phường Trấn Biên, Thành phố Đồng Nai")
                                .font(.subheadline)
                                .lineLimit(1)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color(.systemBackground))
                        .cornerRadius(8)
                        
                        // SearchBarView
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            Text("Tìm cá, cây thủy sinh, phụ kiện...")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Spacer()
                            Image(systemName: "barcode.viewfinder")
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    // 3. Banner
                    BannerView()
                    
                    // 4. Danh mục
                    CategoryRowView(categories: categories, showSeeAll: true)
                        .padding(.vertical, 8)
                    
                    // 5. Sản phẩm nổi bật
                    ProductSectionView(
                        title: "Sản phẩm nổi bật",
                        products: products,
                        showSeeAll: true
                    )
                    
                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .background(Color(.systemGroupedBackground))
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                loadSampleData()
            }
        }
    }
    
    private func loadSampleData() {
        categories = SampleData.categories
        products = SampleData.products
    }
}

#Preview {
    HomeView()
}
