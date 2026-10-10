//Anh Thư

import SwiftUI

struct AccountView: View {
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
                
                List {
                    Section {
                        HStack(spacing: 16) {
                            Image("logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("~ Yêu Cá Cảnh ~")
                                    .font(.headline)
                                Text(verbatim: "yeucacanh@email.com")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(1)
                            }
                        }
                        .padding(.vertical, 4)
                        .listRowBackground(Color.white)
                    }
                    
                    Section("Cửa hàng & Tiện ích") {
                        NavigationLink(destination: MapView()) {
                            Label("Địa chỉ & Bản đồ cửa hàng", systemImage: "map")
                        }
                        Label("Phương thức thanh toán", systemImage: "creditcard")
                        Label("Thông báo", systemImage: "bell")
                    }
                    .listRowBackground(Color.white.opacity(0.9))
                    
                    Section("Hỗ trợ") {
                        Label("Trung tâm trợ giúp", systemImage: "questionmark.circle")
                        Label("Chính sách & Điều khoản", systemImage: "doc.text")
                    }
                    .listRowBackground(Color.white.opacity(0.9))
                }
                .scrollContentBackground(.hidden) 
                .listStyle(.insetGrouped)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("TÀI KHOẢN")
                        .font(.system(size: 22, weight: .heavy, design: .monospaced))
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
