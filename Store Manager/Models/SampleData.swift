//Châu Anh

import Foundation

struct SampleData {
    // - MARK: GENERTION of IDs of Categories
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

    // - MARK: CATEGORIES
    static let fullCategories: [ProductCategory] = [
        ProductCategory(id: caCanhID, name: "Cá cảnh", subtitle: "Cá nước ngọt\nCá biển", iconName: "cacanh"),
        ProductCategory(id: cayThuySinhID, name: "Cây thủy sinh", subtitle: "Cây tiền cảnh\nCây trung cảnh", iconName: "caythuysinh"),
        ProductCategory(id: phuKienBeID, name: "Phụ kiện bể", subtitle: "Đá, lũa, nền\n ", iconName: "phukienbe"),
        ProductCategory(id: beCaID, name: "Bể cá", subtitle: "Bể thủy sinh\nBể kính", iconName: "beca"),
        ProductCategory(id: thietBiLocID, name: "Thiết bị lọc", subtitle: "Máy lọc, sủi khí\nĐèn LED", iconName: "thietbiloc"),
        ProductCategory(id: thucAnID, name: "Thức ăn", subtitle: "Thức ăn cá\nThức ăn tép", iconName: "thucan"),
        ProductCategory(id: thuocID, name: "Thuốc & Chăm sóc", subtitle: "Thuốc trị bệnh\nDinh dưỡng", iconName: "thuocvachamsoc"),
        ProductCategory(id: tepCanhID, name: "Tép cảnh", subtitle: "Tép kiểng\nTép màu", iconName: "tepcanh"),
        ProductCategory(id: khuyenMaiID, name: "Khuyến mãi", subtitle: "Ưu đãi hôm nay\n ", iconName: "khuyenmai"),
        ProductCategory(id: tuVanID, name: "Tư vấn", subtitle: "Hỏi đáp\nKinh nghiệm", iconName: "tuvan")
    ]
    
    // - MARK: PRODUCTS
    static let products: [Product] = [
        // Cá cảnh
        Product(name: "Cá Vàng Ranchu", categoryId: caCanhID, price: 65000, imageName: "Cá Vàng Ranchu", description: "Cá Ranchu thân tròn, vảy sáng bóng khỏe mạnh", stock: 15),
        Product(name: "Cá Betta Halfmoon", categoryId: caCanhID, price: 120000, imageName: "Cá Betta Halfmoon", description: "Đuôi xòe 180 độ, màu sắc sặc sỡ", stock: 8),
        Product(name: "Cá Neon Vua", categoryId: caCanhID, price: 15000, imageName: "Cá Neon Vua", description: "Cá bơi theo đàn, dạ quang ánh xanh đỏ", stock: 100),
        Product(name: "Cá Bảy Màu Guppy", categoryId: caCanhID, price: 25000, imageName: "Cá Bảy Màu Guppy", description: "Dòng thuần chủng Dumbo Red Tail", stock: 40),

        // Cây thủy sinh
        Product(name: "Cây Ráy Nana", categoryId: cayThuySinhID, price: 45000, imageName: "Cây Ráy Nana", description: "Cây dễ trồng, thích hợp cột đá lũa", stock: 25),
        Product(name: "Cây Bucep Ghost", categoryId: cayThuySinhID, price: 90000, imageName: "Cây Bucep Ghost", description: "Cây bucep màu tím ánh kim sang trọng", stock: 12),
        Product(name: "Cỏ Thìa Tiền Cảnh", categoryId: cayThuySinhID, price: 20000, imageName: "Cỏ Thìa Tiền Cảnh", description: "Trải nền hồ cá cực nhanh và mượt", stock: 30),

        // Phụ kiện bể
        Product(name: "Lũa Cholla Mini", categoryId: phuKienBeID, price: 35000, imageName: "Lũa Cholla Mini", description: "Tạo nơi trú ẩn tuyệt vời cho tép con", stock: 50),
        Product(name: "Phân Nền GEX Xanh", categoryId: phuKienBeID, price: 180000, imageName: "Phân Nền GEX Xanh", description: "Cung cấp dinh dưỡng ổn định cho cây thủy sinh", stock: 20),
        Product(name: "Đá Da Voi Setup", categoryId: phuKienBeID, price: 50000, imageName: "Đá Da Voi Setup", description: "Đá tự nhiên góc cạnh hiểm trở", stock: 35),

        // Bể cá
        Product(name: "Bể Kính Siêu Trong", categoryId: beCaID, price: 220000, imageName: "Bể Kính Siêu Trong", description: "Kính siêu trong 5mm mài vi tính góc", stock: 10),

        // Thiết bị lọc & Đèn
        Product(name: "Lọc Thác Sobo 303H", categoryId: thietBiLocID, price: 75000, imageName: "Lọc Thác Sobo 303H", description: "Có tích hợp lọc váng mặt nước tiện lợi", stock: 18),
        Product(name: "Đèn LED Thủy Sinh WRGB", categoryId: thietBiLocID, price: 280000, imageName: "Đèn LED Thủy Sinh WRGB", description: "Giúp cây quang hợp và cá lên màu cực chuẩn", stock: 9),
        Product(name: "Máy Sủi Oxy Siêu Êm", categoryId: thietBiLocID, price: 60000, imageName: "Máy Sủi Oxy Siêu Êm", description: "Tạo dòng oxy liên tục không gây ồn", stock: 22),

        // Thức ăn
        Product(name: "Cám Cá Vàng Hikari", categoryId: thucAnID, price: 85000, imageName: "Cám Cá Vàng Hikari", description: "Không đục nước, giàu đạm và vitamin", stock: 45),
        Product(name: "Artemia Ấp Nở Dinh Dưỡng", categoryId: thucAnID, price: 65000, imageName: "Artemia Ấp Nở Dinh Dưỡng", description: "Thức ăn vàng cho cá con mau lớn", stock: 30),

        // Thuốc & Chăm sóc
        Product(name: "Vi Sinh Sống Seachem", categoryId: thuocID, price: 160000, imageName: "Vi Sinh Sống Seachem", description: "Khởi tạo hệ vi sinh nhanh, làm trong nước tức thì", stock: 16),
        Product(name: "Thuốc Trị Nấm Xanh Bio Knock 2", categoryId: thuocID, price: 30000, imageName: "Thuốc Trị Nấm Xanh Bio Knock 2", description: "Đặc trị túm vây, thối mang, nấm trắng", stock: 60),

        // Tép cảnh
        Product(name: "Tép Đỏ Fire Red", categoryId: tepCanhID, price: 12000, imageName: "Tép Đỏ Fire Red", description: "Màu đỏ đậm toàn thân, ăn rêu tảo", stock: 80),
        Product(name: "Tép Vàng Sọc Neon", categoryId: tepCanhID, price: 18000, imageName: "Tép Vàng Sọc Neon", description: "Sọc vàng dạ quang nổi bật trong hồ rêu", stock: 50),

        // Khuyến mãi
        Product(name: "Combo 10 Cá Neon + Ráy", categoryId: khuyenMaiID, price: 150000, imageName: "Combo 10 Cá Neon + Ráy", description: "Gói combo tiết kiệm cho người mới bắt đầu", stock: 10)
    ]
    
    // - MARK: INITIAL CART
    static var cartItems: [CartItem] = [
        CartItem(product: products[0], quantity: 2),
        CartItem(product: products[4], quantity: 1)
    ]
    
    // - MARK: INITIAL ORDER
    static var orders: [Order] = [
        Order(customerName: "Nguyen Van A", items: cartItems, orderDate: Date(), status: .shipping, shippingFee: 15000)
    ]
}
