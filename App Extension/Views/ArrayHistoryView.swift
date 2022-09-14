import SwiftUI

struct ArrayHistoryView: View {
    @EnvironmentObject var suffixModel: SuffixModel

    var body: some View {
        VStack {
            List{
                ForEach(self.suffixModel.history, id:\.self){ text in
                    Text(text)
                }
            }
        }
    }
}

struct SuffixHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ArrayHistoryView()
    }
}
