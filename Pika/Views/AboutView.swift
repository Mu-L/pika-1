import SwiftUI

struct LinkButton: View {
    var title: String
    var link: String

    var body: some View {
        Button(title) {
            NSWorkspace.shared.open(URL(string: link)!)
        }
        .buttonStyle(LinkButtonStyle())
    }
}

struct AboutView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        VStack(spacing: 16.0) {
            ZStack(alignment: .bottom) {
                Visualisation()
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(maxWidth: .infinity, maxHeight: 100.0)
            }
            AppVersion()
                .padding(EdgeInsets(top: -50, leading: 0, bottom: 0, trailing: 0))
            VStack(spacing: 20.0) {
                HStack(spacing: 20.0) {
                    LinkButton(
                        title: NSLocalizedString("app.website", comment: "Website"),
                        link: "https://superhighfives.com/pika"
                    )
                    LinkButton(
                        title: NSLocalizedString("app.github", comment: "GitHub"),
                        link: "https://github.com/superhighfives/pika"
                    )
                }

                VStack(spacing: 0) {
                    KeyboardShortcutGrid()
                        .frame(height: 210.0)
                        .background(colorScheme == .light ? Color.black.opacity(0.05) : Color.black.opacity(0.2))
                }

                HStack(spacing: 5.0) {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(NSLocalizedString("app.designed", comment: "Designed by"))
                    LinkButton(title: "Charlie Gleason", link: "https://charliegleason.com")
                }
            }
            .padding(.bottom, 20.0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
