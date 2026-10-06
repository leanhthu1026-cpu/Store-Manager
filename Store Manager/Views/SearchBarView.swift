import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
            Text("Tìm cá, cây thủy sinh, phụ kiện...").foregroundColor(.gray).font(.subheadline)
            Spacer()
            Image(systemName: "barcode.viewfinder").foregroundColor(.blue)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
