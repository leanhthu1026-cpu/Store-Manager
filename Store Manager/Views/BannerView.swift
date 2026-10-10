//Châu Anh

import SwiftUI

struct BannerView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Image("banner1")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipped()
                    .overlay(Color.black.opacity(0.15))
                
                VStack(spacing: 6) {
                    Text("ƯU ĐÃI THÁNG NÀY")
                        .font(.system(size: 11, weight: .bold))
                        .italic()
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(
                            Capsule().fill(
                                LinearGradient(
                                    colors: [.blue, .cyan],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        )
                        .shadow(color: .blue.opacity(0.3), radius: 3)
                    
                    Spacer().frame(height: 15)
                    
                    Text("Cá Khỏe – Bể Đẹp")
                        .font(.system(size: 32, weight: .heavy, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.blue, .mint, .yellow],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .rotation3DEffect(
                            .degrees(8),
                            axis: (x: 1.0, y: 0.0, z: 0.0),
                            perspective: 0.5
                        )
                        .scaleEffect(x: 1.05, y: 1.0)
                        .shadow(color: .black.opacity(0.4), radius: 3, x: 0, y: 2)
                    
                    Text("Không gian thư giãn cho mọi nhà")
                        .font(.system(size: 12, weight: .heavy, design: .monospaced))
                        .foregroundColor(.white.opacity(0.95))
                        .multilineTextAlignment(.center)
                        .shadow(color: .black.opacity(0.3), radius: 2)
                }
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.gray.opacity(0.45))
                        .blur(radius: 55)
                        .padding(.horizontal, -20)
                        .padding(.vertical, -5)
                )
                .padding(.bottom, 80)
                
                HStack(spacing: 8) {
                    FeaturePill(icon: "shippingbox.fill", title: "Giao hàng", subtitle: "nhanh")
                    FeaturePill(icon: "checkmark.shield.fill", title: "Đóng gói", subtitle: "an toàn")
                    FeaturePill(icon: "leaf.fill", title: "Tư vấn", subtitle: "miễn phí")
                }
                .padding(.bottom, 8)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay(alignment: .topTrailing) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.red, .orange],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 70, height: 70)
                        .shadow(color: .red.opacity(0.4), radius: 6, x: 0, y: 3)
                    
                    VStack(spacing: -2) {
                        Text("Giảm đến")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundColor(.white)
                        Text("30%")
                            .font(.system(size: 22, weight: .heavy))
                            .foregroundColor(.white)
                    }
                }
                .offset(x: 20, y: -18)
                .padding(.trailing, 12)
                .padding(.top, 8)
            }
            .padding(.horizontal)
            
            HStack(spacing: 6) {
                Circle().fill(Color.blue).frame(width: 7, height: 7)
                ForEach(0..<4, id: \.self) { _ in
                    Circle().fill(Color.blue.opacity(0.3)).frame(width: 7, height: 7)
                }
            }
            .padding(.top, 8)
        }
    }
}

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
        .background(Color.white.opacity(0.95))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: 1)
    }
}

#Preview {
    BannerView()
}
