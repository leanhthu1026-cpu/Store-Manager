import SwiftUI

struct BannerView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                // Ảnh banner chính
                Image("banner1")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .clipped()
                
                // Thanh 3 cam kết nhỏ đè ở góc dưới banner
                HStack(spacing: 8) {
                    FeaturePill(icon: "shippingbox.fill", title: "Giao hàng", subtitle: "nhanh")
                    FeaturePill(icon: "checkmark.shield.fill", title: "Đóng gói", subtitle: "an toàn")
                    FeaturePill(icon: "leaf.fill", title: "Tư vấn", subtitle: "miễn phí")
                }
                .padding(.bottom, 10)
            }
            .cornerRadius(18)
            .padding(.horizontal)
            
            // Dấu chấm chỉ số slide trang
            HStack(spacing: 6) {
                Circle().fill(Color.blue).frame(width: 7, height: 7)
                Circle().fill(Color.blue.opacity(0.3)).frame(width: 7, height: 7)
                Circle().fill(Color.blue.opacity(0.3)).frame(width: 7, height: 7)
                Circle().fill(Color.blue.opacity(0.3)).frame(width: 7, height: 7)
                Circle().fill(Color.blue.opacity(0.3)).frame(width: 7, height: 7)
            }
            .padding(.top, 8)
        }
    }
}

// Subview 1 pill tiện ích
struct FeaturePill: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 1) {
                Text(title)
                    .font(.system(size: 10, weight: .bold))
                Text(subtitle)
                    .font(.system(size: 9))
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color.white.opacity(0.92))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.08), radius: 3, x: 0, y: 1)
    }
}

#Preview {
    BannerView()
}
