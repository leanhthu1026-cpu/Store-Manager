//Châu Anh

import SwiftUI

struct HomeHeaderView: View {
    var storeName: String = "CÁ CẢNH XINH"
    var subtitle: String = "Thế giới thủy sinh trong tầm tay ♡"
    
    var cartManager = CartManager.shared
    @State private var showCartSheet = false
    @State private var showNotificationSheet = false
    
    var body: some View {
        HStack(alignment: .center) {
            HStack(spacing: 12) {
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(storeName)
                        .font(.system(size: 22, weight: .heavy, design: .monospaced))
                        .foregroundColor(.black)
                    
                    Text(subtitle)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            HStack(spacing: 14) {
                Button(action: { showNotificationSheet = true }) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "bell")
                            .font(.title3)
                            .foregroundColor(.primary)
                        Circle()
                            .fill(Color.red)
                            .frame(width: 16, height: 16)
                            .overlay(Text("3").font(.caption2).foregroundColor(.white))
                            .offset(x: 8, y: -8)
                    }
                }
                
                Button(action: { showCartSheet = true }) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "cart")
                            .font(.title3)
                            .foregroundColor(.primary)
                        
                        if cartManager.totalCount > 0 {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 16, height: 16)
                                .overlay(Text("\(cartManager.totalCount)").font(.caption2).foregroundColor(.white))
                                .offset(x: 8, y: -8)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: $showCartSheet) {
            CartView()
        }
        .sheet(isPresented: $showNotificationSheet) {
            NavigationStack {
                List {
                    Text("Không có thông báo mới.")
                }
                .navigationTitle("Thông báo")
            }
        }
    }
}

#Preview {
    HomeHeaderView()
}
