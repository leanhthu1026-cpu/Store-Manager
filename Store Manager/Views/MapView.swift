import SwiftUI

struct MapView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Giả lập bản đồ
                ZStack {
                    Rectangle()
                        .fill(Color.blue.opacity(0.1))
                        .frame(height: 400)
                    
                    VStack(spacing: 12) {
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.red)
                        
                        Text("Cá Cảnh Xinh")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text("123 Đường Trấn Biên, TP. Đồng Nai")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .frame(height: 400)
                
                // Thông tin chi tiết
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.blue)
                        Text("Giờ mở cửa: 8:00 - 21:00")
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(.blue)
                        Text("Hotline: 0123 456 789")
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "shippingbox")
                            .foregroundColor(.blue)
                        Text("Giao hàng trong 2h")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("Mở chỉ đường")
                    }) {
                        Text("Chỉ đường")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Bản đồ cửa hàng")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MapView()
}
