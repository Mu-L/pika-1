import KeyboardShortcuts
import LaunchAtLogin
import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Visualisation()
                Image("AppSplash")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 140.0)
                    .offset(x: 0.0, y: 5.0)
            }
            Divider()
            HStack(spacing: 16.0) {
                HStack {
                    Text(NSLocalizedString("splash.hotkey", comment: "Global shortcut"))
                    KeyboardShortcuts.Recorder(for: .togglePika)
                }

                Divider()

                LaunchAtLogin.Toggle {
                    Text(NSLocalizedString("splash.launch", comment: "Launch at login"))
                }

                Divider()

                Button(action: {
                    NSApp.sendAction(#selector(AppDelegate.closeSplashWindow), to: nil, from: nil)
                }, label: { Text(NSLocalizedString("splash.start", comment: "Get started")) })
                    .keyboardShortcut(.defaultAction)
                    .accentColor(.accentColor)
            }
            .frame(maxWidth: .infinity, maxHeight: 50.0)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
