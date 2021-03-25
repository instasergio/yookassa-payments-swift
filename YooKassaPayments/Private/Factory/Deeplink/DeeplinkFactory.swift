import Foundation

enum DeepLinkFactory {
    
    enum YooMoney {
        static let host = "yoomoney"
        static let app2App = "app2app"
    }

    // swiftlint:disable:next cyclomatic_complexity
    static func makeDeepLink(url: URL) -> DeepLink? {
        guard
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let host = components.host
        else { return nil }

        let firstPathComponent = components.path
            .split(separator: "/")
            .filter { !$0.isEmpty }
            .map(String.init)
            .first

        let query = components
            .queryItems?
            .map { ($0.name, $0.value) }
            .reduce(into: [:]) { $0[$1.0] = $1.1 }
            ?? [:]

        let action = components.fragment

        let deepLink: DeepLink?

        switch (host, firstPathComponent, query, action) {
        case (YooMoney.host, YooMoney.app2App, _, _):
            deepLink = .yooMoneyApp2App
        
        default:
            deepLink = nil
        }

        return deepLink
    }
}
