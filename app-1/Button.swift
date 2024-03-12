import SwiftUI

struct ButtonView: View {
    @Binding var action: () -> Void
    // @Binding var width: Int
    var body: some View {
        Button(action: action) {
            Text("How to play?").frame(width: 300,height: 60)
        }
        .background(Color.cyan)
        .foregroundColor(.black)
        .font(.system(size: 30))
        .cornerRadius(15)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
