import SwiftUI

@main
struct PokerogueApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    AppUtility.lockOrientation(.landscapeRight)
                }
        }
    }
}

struct AppUtility {
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            scene.requestGeometryUpdate(.iOS(interfaceOrientations: orientation))
        }
    }
}
