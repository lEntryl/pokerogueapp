import Foundation
import GameController

class ControllerManager: ObservableObject {
    @Published var controllerConnected = false
    var reloadAction: (() -> Void)?

    init() {
        NotificationCenter.default.addObserver(
            forName: .GCControllerDidConnect,
            object: nil,
            queue: .main
        ) { _ in
            self.controllerConnected = true
            self.setupControllerInput()
        }

        NotificationCenter.default.addObserver(
            forName: .GCControllerDidDisconnect,
            object: nil,
            queue: .main
        ) { _ in
            self.controllerConnected = false
        }
    }

private func setupControllerInput() {
    guard let controller = GCController.controllers().first else { return }
    if let gamepad = controller.extendedGamepad {
        // L+R 동시에 눌렀을 때 리로드 실행
        gamepad.leftShoulder.pressedChangedHandler = { _, _, _ in self.checkCombo(gamepad) }
        gamepad.rightShoulder.pressedChangedHandler = { _, _, _ in self.checkCombo(gamepad) }
    }
}

private func checkCombo(_ gamepad: GCExtendedGamepad) {
    if gamepad.leftShoulder.isPressed && gamepad.rightShoulder.isPressed {
        self.reloadAction?()
    }
}
