import SwiftUI

struct CategoryRowView: View {
    let categories: [ProductCategory] = SampleData.fullCategories
    
    // Đặt chiều cao mỗi hàng là 140 để thoải mái chứa ảnh to và chữ
    let gridRows = [
        GridItem(.fixed(140), spacing: 14),
        GridItem(.fixed(140), spacing: 14)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridRows, spacing: 14) {
                ForEach(categories) { cat in
                    NavigationLink(destination: CategoryDetailView(category: cat)) {
                        VStack(spacing: 8) {
                            // Ảnh tràn viền 100% không chừa khoảng xám
                            Image(cat.iconName)
                                .resizable()
                                .scaledToFill() // Kéo giãn để lấp đầy toàn bộ kích thước
                                .frame(width: 72, height: 72)
                                .cornerRadius(18) // Bo tròn mượt mà ở các góc ảnh
                                .clipped() // Cắt bỏ các phần thừa ra ngoài bo góc
                                .shadow(color: Color.black.opacity(0.24), radius: 2, x: 0, y: 1)
                            
                            // Tên danh mục
                            Text(cat.name)
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.primary)
                                .lineLimit(1)
                            
                            // Phụ đề 2 dòng bên dưới
                            Text(cat.subtitle)
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .frame(height: 26)
                        }
                        .frame(width: 82)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    NavigationStack {
        CategoryRowView()
    }
}
