import SwiftUI

struct BannerView: View {
    var body: some View {
        ZStack {
            Image("banner1")
                .resizable()
                .scaledToFill()
                .frame(height: 140)
                .clipped()
                .cornerRadius(15)
                .overlay(Color.gray.opacity(0.3))
            
            VStack(spacing: 8) {
                Text("ƯU ĐÃI THÁNG NÀY")
                    .font(.caption).fontWeight(.bold)
                    .foregroundColor(.white.opacity(0.9))
                
                Text("Cá khỏe - Bể đẹp")
                    .font(.title2).fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Không gian thư giãn cho mọi nhà")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.9))
                
                Text("Giảm đến 30%")
                    .font(.headline)
                    .foregroundColor(.yellow)
            }
            .padding()
        }
        .frame(height: 140)
        .padding(.horizontal)
    }
}

#Preview {
    BannerView()
        .padding()
}
