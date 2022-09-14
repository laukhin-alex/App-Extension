import SwiftUI
import UIKit

struct TextView: View {
    @State private var text: String = ""
    @State var showsAlert = false
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
                if text == "" {
                    showsAlert = true
                } else {
                    UIApplication.shared.endEditing()
                    self.suffixModel.addNewValues(text)
                    text = ""
                    showsAlert = false
                }

            }

            .alert(isPresented: $showsAlert) {
                Alert(title: Text("Empty text!"))
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(20)
            .foregroundColor(.white)
            .padding(10)
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
