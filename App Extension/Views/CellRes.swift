import SwiftUI

struct CellResultView: View {
    var firstValue: Substring
    var secondValue: Int
    var body: some View {
        HStack {
            Text(firstValue)
            Spacer()
            Text("\(secondValue)")
        }
    }
}

struct CellRes_Previews: PreviewProvider {
    static var previews: some View {
        CellResultView(firstValue: "text", secondValue: 1)
    }
}