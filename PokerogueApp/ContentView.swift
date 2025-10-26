import SwiftUI

struct ContentView: View {
    @StateObject private var controllerManager = ControllerManager()
    @State private var reloadTrigger = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            WebView(url: URL(string: "https://pokerogue.net")!,
                    reloadTrigger: $reloadTrigger)
                .ignoresSafeArea()

            // 🎮 컨트롤러 없을 때만 UI 표시
            if !controllerManager.controllerConnected {
                Button(action: { reloadTrigger = true }) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding()
                }
            }
        }
        .background(Color.black)
        .preferredColorScheme(.dark)
        .onAppear {
            controllerManager.reloadAction = {
                reloadTrigger = true
            }
        }
    }
}
