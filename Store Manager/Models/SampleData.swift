import Foundation

struct SampleData {
    // 1. Tạo sẵn các ID cố định để liên kết giữa Category và Product
    static let caCanhID = UUID()
    static let cayThuySinhID = UUID()
    static let phuKienBeID = UUID()
    static let beCaID = UUID()
    static let thietBiLocID = UUID()
    static let thucAnID = UUID()
    static let thuocID = UUID()
    static let tepCanhID = UUID()
    static let khuyenMaiID = UUID()
    static let tuVanID = UUID()

    // 2. Danh sách 10 danh mục chuẩn
    static let fullCategories: [ProductCategory] = [
        ProductCategory(id: caCanhID, name: "Cá cảnh", subtitle: "Cá nước ngọt\nCá biển", iconName: "fish.fill"),
        ProductCategory(id: cayThuySinhID, name: "Cây thủy sinh", subtitle: "Cây tiền cảnh\nCây trung cảnh", iconName: "leaf.fill"),
        ProductCategory(id: phuKienBeID, name: "Phụ kiện bể", subtitle: "Đá, lũa, nền\n ", iconName: "cube.fill"),
        ProductCategory(id: beCaID, name: "Bể cá", subtitle: "Bể thủy sinh\nBể kính", iconName: "square.fill"),
        ProductCategory(id: thietBiLocID, name: "Thiết bị lọc", subtitle: "Máy lọc, sủi khí\nĐèn LED", iconName: "drop.fill"),
        ProductCategory(id: thucAnID, name: "Thức ăn", subtitle: "Thức ăn cá\nThức ăn tép", iconName: "takeoutbag.and.cup.and.straw.fill"),
        ProductCategory(id: thuocID, name: "Thuốc & Chăm sóc", subtitle: "Thuốc trị bệnh\nDinh dưỡng", iconName: "cross.case.fill"),
        ProductCategory(id: tepCanhID, name: "Tép cảnh", subtitle: "Tép kiểng\nTép màu", iconName: "ant.fill"),
        ProductCategory(id: khuyenMaiID, name: "Khuyến mãi", subtitle: "Ưu đãi hôm nay\n ", iconName: "tag.fill"),
        ProductCategory(id: tuVanID, name: "Tư vấn", subtitle: "Hỏi đáp\nKinh nghiệm", iconName: "bubble.left.and.bubble.right.fill")
    ]
    
    // 3. Danh sách sản phẩm chi tiết cho từng nhóm
    static let products: [Product] = [
        // Cá cảnh
        Product(name: "Cá Vàng Ranchu", categoryId: caCanhID, price: 65000, imageName: "fish.fill", description: "Cá Ranchu thân tròn, vảy sáng bóng khỏe mạnh", stock: 15),
        Product(name: "Cá Betta Halfmoon", categoryId: caCanhID, price: 120000, imageName: "fish.fill", description: "Đuôi xòe 180 độ, màu sắc sặc sỡ", stock: 8),
        Product(name: "Cá Neon Vua", categoryId: caCanhID, price: 15000, imageName: "fish.fill", description: "Cá bơi theo đàn, dạ quang ánh xanh đỏ", stock: 100),
        Product(name: "Cá Bảy Màu Guppy", categoryId: caCanhID, price: 25000, imageName: "fish.fill", description: "Dòng thuần chủng Dumbo Red Tail", stock: 40),

        // Cây thủy sinh
        Product(name: "Cây Ráy Nana", categoryId: cayThuySinhID, price: 45000, imageName: "leaf.fill", description: "Cây dễ trồng, thích hợp cột đá lũa", stock: 25),
        Product(name: "Cây Bucep Ghost", categoryId: cayThuySinhID, price: 90000, imageName: "leaf.fill", description: "Cây bucep màu tím ánh kim sang trọng", stock: 12),
        Product(name: "Cỏ Thìa Tiền Cảnh", categoryId: cayThuySinhID, price: 20000, imageName: "leaf.fill", description: "Trải nền hồ cá cực nhanh và mượt", stock: 30),

        // Phụ kiện bể
        Product(name: "Lũa Cholla Mini", categoryId: phuKienBeID, price: 35000, imageName: "cube.fill", description: "Tạo nơi trú ẩn tuyệt vời cho tép con", stock: 50),
        Product(name: "Phân Nền GEX Xanh", categoryId: phuKienBeID, price: 180000, imageName: "cube.fill", description: "Cung cấp dinh dưỡng ổn định cho cây thủy sinh", stock: 20),
        Product(name: "Đá Da Voi Setup", categoryId: phuKienBeID, price: 50000, imageName: "cube.fill", description: "Đá tự nhiên góc cạnh hiểm trở", stock: 35),

        // Bể cá
        Product(name: "Bể Kính Siêu Trong 30x30", categoryId: beCaID, price: 220000, imageName: "square.fill", description: "Kính siêu trong 5mm mài vi tính góc", stock: 10),
        Product(name: "Bể Đúc Uốn Góc Mini", categoryId: beCaID, price: 150000, imageName: "square.fill", description: "Thích hợp bàn làm việc, góc học tập", stock: 14),

        // Thiết bị lọc & Đèn
        Product(name: "Lọc Thác Sobo 303H", categoryId: thietBiLocID, price: 75000, imageName: "drop.fill", description: "Có tích hợp lọc váng mặt nước tiện lợi", stock: 18),
        Product(name: "Đèn LED Thủy Sinh WRGB", categoryId: thietBiLocID, price: 280000, imageName: "drop.fill", description: "Giúp cây quang hợp và cá lên màu cực chuẩn", stock: 9),
        Product(name: "Máy Sủi Oxy Siêu Êm", categoryId: thietBiLocID, price: 60000, imageName: "drop.fill", description: "Tạo dòng oxy liên tục không gây ồn", stock: 22),

        // Thức ăn
        Product(name: "Cám Cá Vàng Hikari", categoryId: thucAnID, price: 85000, imageName: "takeoutbag.and.cup.and.straw.fill", description: "Không đục nước, giàu đạm và vitamin", stock: 45),
        Product(name: "Artemia Ấp Nở Dinh Dưỡng", categoryId: thucAnID, price: 65000, imageName: "takeoutbag.and.cup.and.straw.fill", description: "Thức ăn vàng cho cá con mau lớn", stock: 30),

        // Thuốc & Chăm sóc
        Product(name: "Vi Sinh Sống Seachem", categoryId: thuocID, price: 160000, imageName: "cross.case.fill", description: "Khởi tạo hệ vi sinh nhanh, làm trong nước tức thì", stock: 16),
        Product(name: "Thuốc Trị Nấm Xanh Bio Knock 2", categoryId: thuocID, price: 30000, imageName: "cross.case.fill", description: "Đặc trị túm vây, thối mang, nấm trắng", stock: 60),

        // Tép cảnh
        Product(name: "Tép Đỏ Fire Red", categoryId: tepCanhID, price: 12000, imageName: "ant.fill", description: "Màu đỏ đậm toàn thân, ăn rêu tảo", stock: 80),
        Product(name: "Tép Vàng Sọc Neon", categoryId: tepCanhID, price: 18000, imageName: "ant.fill", description: "Sọc vàng dạ quang nổi bật trong hồ rêu", stock: 50),

        // Khuyến mãi
        Product(name: "Combo 10 Cá Neon + Ráy", categoryId: khuyenMaiID, price: 150000, imageName: "tag.fill", description: "Gói combo tiết kiệm cho người mới bắt đầu", stock: 10)
    ]
    
    // Giỏ hàng mẫu
    static let cartItems: [CartItem] = [
        CartItem(product: products[0], quantity: 2),
        CartItem(product: products[4], quantity: 1)
    ]
    
    // Đơn hàng mẫu
    static var orders: [Order] = [
        Order(customerName: "Văn A", items: cartItems, orderDate: Date(), status: .shipping, shippingFee: 15000)
    ]
    
}
