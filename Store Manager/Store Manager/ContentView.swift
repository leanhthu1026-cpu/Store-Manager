import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Trang chủ", systemImage: "house.fill")
                }
            
            CartView()
                .tabItem {
                    Label("Giỏ hàng", systemImage: "cart.fill")
                }
            
            MapView()
                .tabItem {
                    Label("Bản đồ", systemImage: "map.fill")
                }
            
            Text("Tài khoản")
                .tabItem {
                    Label("Tài khoản", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
