import SwiftUI

struct HomeHeaderView: View {
    var storeName: String = "Cá Cảnh Xinh"
    var subtitle: String = "Thế giới thủy sinh trong tầm tay ♡"
    
    var body: some View {
        HStack(alignment: .top) {
            HStack(spacing: 12) {
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(storeName)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.9))
                }
            }
            Spacer()
            HStack(spacing: 16) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell")
                        .font(.title3)
                        .foregroundColor(.white)
                    Circle().fill(Color.red).frame(width: 16, height: 16)
                        .overlay(Text("3").font(.caption2).foregroundColor(.white))
                        .offset(x: 8, y: -8)
                }
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "cart")
                        .font(.title3)
                        .foregroundColor(.white)
                    Circle().fill(Color.red).frame(width: 16, height: 16)
                        .overlay(Text("2").font(.caption2).foregroundColor(.white))
                        .offset(x: 8, y: -8)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 7)
                .fill(
                    LinearGradient(
                        colors: [.cyan, .blue],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        )
    }
}

#Preview {
    HomeHeaderView()
        .padding()
        .background(Color(.systemGroupedBackground))
}
