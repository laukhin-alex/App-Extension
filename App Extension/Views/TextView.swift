import SwiftUI
import UIKit

struct TextView: View {
    @State private var text: String = ""
    @EnvironmentObject var suffixModel: SuffixModel

    var body: some View {
        VStack{
            TextEditor(text: $text)
                .multilineTextAlignment(.center)
                .lineSpacing(10.0)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                .padding()
                .onChange(of: text, perform: { value in
                    
                })
                .onAppear()
            Button("Create suffix array") {
                UIApplication.shared.endEditing()
                self.suffixModel.addNewValues(text)
                text = ""
            }
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
