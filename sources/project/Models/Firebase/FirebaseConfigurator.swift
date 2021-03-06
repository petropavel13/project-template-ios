import Firebase

enum FirebaseConfigurator {

    private static var resourceName: String {
        #if APPSTORE
        return "AppStore-GoogleService-Info"
        #elseif ENTERPRISE
        return "Enterprise-GoogleService-Info"
        #elseif STANDARD
        return "Standard-GoogleService-Info"
        #else
        assertionFailure("There is no right plist file")
        return .empty
        #endif
    }

    static func configure() {
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: .fileExtension),
            let options = FirebaseOptions(contentsOfFile: filePath) else {
                return
        }

        FirebaseApp.configure(options: options)
    }
}

// MARK: - Constants
private extension String {
    static let fileExtension = "plist"
}
