//Châu Anh

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var cartManager = CartManager.shared
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Trang chủ")
                }
                .tag(0)
            
            AllCategoriesView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Danh mục")
                }
                .tag(1)
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Yêu thích")
                }
                .tag(2)
            
            OrderView()
                .tabItem {
                    Image(systemName: "doc.text.fill")
                    Text("Đơn hàng")
                }
                .tag(3)
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Tài khoản")
                }
                .tag(4)
        }
    }
}

#Preview {
    ContentView()
}
