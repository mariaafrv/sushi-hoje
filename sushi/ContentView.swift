import SwiftUI

struct ContentView: View {
  
  @State private var simScale: CGFloat = 1.0
  @State private var naoScale: CGFloat = 1.0
  @State private var gifName: String = "togepi"
  
  var body: some View {
    VStack {
      Text("sushi hoje????????")
        .font(.title)
        .bold()
        .foregroundStyle(.black)
      
      GIFView(gifName: gifName)
        .frame(width: 300, height: 300)
      
      HStack {
        Button {
          withAnimation(.easeInOut) {
              simScale *= 1.1
              naoScale *= 0.95
              gifName = "happy-togepi"
          }
        } label: {
          Text("sim")
            .foregroundStyle(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(.green)
            .cornerRadius(10)
            .scaleEffect(simScale)
            .animation(.easeInOut, value: simScale)
        }
        
        Button {
          withAnimation(.easeInOut) {
            naoScale *= 0.95
            simScale *= 1.05
            gifName = "sad-togepi"
          }
        } label: {
            Text("não")
              .foregroundStyle(.white)
              .padding(.horizontal, 24)
              .padding(.vertical, 12)
              .background(.red)
              .cornerRadius(10)
              .scaleEffect(naoScale)
              .animation(.easeInOut, value: naoScale)
          }
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
