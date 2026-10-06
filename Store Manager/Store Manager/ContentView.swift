import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Trang chủ", systemImage: "house.fill")
                }
                .tag(0)
            
            AllItemsView()
                .tabItem {
                    Label("Danh mục", systemImage: "square.grid.2x2.fill")
                }
                .tag(1)
            
            FavoritesView()
                .tabItem {
                    Label("Yêu thích", systemImage: "heart.fill")
                }
                .tag(2)
            
            OrderView()
                .tabItem {
                    Label("Đơn hàng", systemImage: "doc.text.fill")
                }
                .tag(3)
            
            AccountView()
                .tabItem {
                    Label("Tài khoản", systemImage: "person.fill")
                }
                .tag(4)
        }
        .tint(.blue)
    }
}

// Màn hình Yêu thích
struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Chưa có mục yêu thích",
                systemImage: "heart.slash",
                description: Text("Hãy bấm icon trái tim trên thẻ sản phẩm để lưu lại.")
            )
            .navigationTitle("Yêu thích")
        }
    }
}

#Preview {
    ContentView()
}
