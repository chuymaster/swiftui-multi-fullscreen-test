import SwiftUI

@main
struct swiftui_multi_fullscreen_testApp: App {
    var body: some Scene {
        WindowGroup {
            FullScreenCoverView {
                VStack {
                    Text("Home")
                    Spacer()
                }
            }
            .environmentObject(AppEnvironment())
        }
    }
}
