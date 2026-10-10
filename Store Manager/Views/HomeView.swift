import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var showingAddressSheet = false
    @State private var currentAddress = "Phường Trấn Biên, Thành phố Đồng Nai"
    
    // Lọc sản phẩm theo từ khoá tìm kiếm
    var searchResults: [Product] {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            return []
        } else {
            return SampleData.products.filter { product in
                product.name.localizedCaseInsensitiveContains(trimmed) ||
                product.description.localizedCaseInsensitiveContains(trimmed)
            }
        }
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Ảnh nền "background" được làm mờ nhẹ
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.3)
                    .blur(radius: 3)
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        HomeHeaderView()
                        
                        // Nút chọn địa chỉ giao hàng
                        Button(action: { showingAddressSheet = true }) {
                            HStack(spacing: 8) {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.blue)
                                    .font(.subheadline)
                                
                                Text("Giao đến: \(currentAddress)")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.blue)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 10)
                            .background(Color.white.opacity(0.85))
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                        
                        // Ô tìm kiếm có nút xoá nhanh (xmark)
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            TextField("Tìm cá, cây thủy sinh, phụ kiện...", text: $searchText)
                                .font(.system(size: 14))
                                .autocorrectionDisabled()
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16))
                                }
                            } else {
                                Button(action: {}) {
                                    Image(systemName: "viewfinder")
                                        .foregroundColor(.blue)
                                        .font(.system(size: 18))
                                }
                            }
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 11)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(14)
                        .padding(.horizontal)
                        
                        // Nếu đang gõ tìm kiếm -> Hiển thị kết quả tìm kiếm
                        if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text("Kết quả tìm kiếm (\(searchResults.count))")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                                if searchResults.isEmpty {
                                    ContentUnavailableView(
                                        "Không tìm thấy sản phẩm",
                                        systemImage: "magnifyingglass",
                                        description: Text("Không có sản phẩm nào khớp với từ khoá \"\(searchText)\".")
                                    )
                                    .padding(.top, 20)
                                } else {
                                    LazyVGrid(columns: columns, spacing: 14) {
                                        ForEach(searchResults) { product in
                                            ProductCardView(product: product)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .padding(.bottom, 70)
                        } else {
                            // Khi không tìm kiếm -> Hiển thị giao diện Trang chủ bình thường
                            BannerView()
                            
                            CategoryRowView()
                            
                            ProductSectionView(title: "Sản phẩm nổi bật")
                                .padding(.bottom, 70)
                        }
                    }
                    .padding(.top, 6)
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showingAddressSheet) {
                NavigationStack {
                    List {
                        Button("Phường Trấn Biên, TP. Đồng Nai") {
                            currentAddress = "Phường Trấn Biên, Thành phố Đồng Nai"
                            showingAddressSheet = false
                        }
                        Button("Phường Linh Trung, TP. Thủ Đức") {
                            currentAddress = "Phường Linh Trung, TP. Thủ Đức"
                            showingAddressSheet = false
                        }
                        Button("Quận 1, TP. Hồ Chí Minh") {
                            currentAddress = "Quận 1, TP. Hồ Chí Minh"
                            showingAddressSheet = false
                        }
                    }
                    .navigationTitle("Chọn địa chỉ giao hàng")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .presentationDetents([.fraction(0.35)])
            }
        }
    }
}

#Preview {
    HomeView()
}
