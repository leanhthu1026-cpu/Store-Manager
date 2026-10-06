import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var showingAddressSheet = false
    @State private var currentAddress = "Phường Trấn Biên, Thành phố Đồng Nai"
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 16) {
                    HomeHeaderView()
                    
                    // Nút chọn địa chỉ giao hàng
                    Button(action: { showingAddressSheet = true }) {
                        HStack(spacing: 8) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.blue)
                                .font(.subheadline)
                            
                            Text("Giao đến: ")
                                .font(.system(size: 13))
                                .foregroundColor(.gray) +
                            Text(currentAddress)
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.blue)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 10)
                        .background(Color.blue.opacity(0.06))
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                    
                    // Ô tìm kiếm
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Tìm cá, cây thủy sinh, phụ kiện...", text: $searchText)
                            .font(.system(size: 14))
                        
                        Button(action: {}) {
                            Image(systemName: "viewfinder")
                                .foregroundColor(.blue)
                                .font(.system(size: 18))
                        }
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 11)
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                    .padding(.horizontal)
                    
                    BannerView()
                    
                    CategoryRowView()
                    
                    ProductSectionView(title: "Sản phẩm nổi bật")
                        .padding(.bottom, 70)
                }
                .padding(.top, 6)
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
