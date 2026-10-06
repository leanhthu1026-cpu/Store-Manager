import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 16) {
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Người nuôi cá cảnh")
                                .font(.headline)
                            Text("khachhang@email.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
                
                Section("Cửa hàng & Tiện ích") {
                    NavigationLink(destination: MapView()) {
                        Label("Địa chỉ & Bản đồ cửa hàng", systemImage: "map")
                    }
                    Label("Phương thức thanh toán", systemImage: "creditcard")
                    Label("Thông báo", systemImage: "bell")
                }
                
                Section("Hỗ trợ") {
                    Label("Trung tâm trợ giúp", systemImage: "questionmark.circle")
                    Label("Chính sách & Điều khoản", systemImage: "doc.text")
                }
            }
            .navigationTitle("Tài khoản")
        }
    }
}

#Preview {
    AccountView()
}
