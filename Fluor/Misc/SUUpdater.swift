import AppKit

@objc(SUUpdater)
final class SUUpdater: NSObject {

	private static let lastUpdateCheckDateKey = "SUUpdater.lastUpdateCheckDate"

	@objc dynamic private(set) var lastUpdateCheckDate: Date? {
		didSet {
			UserDefaults.standard.set(lastUpdateCheckDate, forKey: Self.lastUpdateCheckDateKey)
		}
	}

	override init() {
		lastUpdateCheckDate = UserDefaults.standard.object(forKey: Self.lastUpdateCheckDateKey) as? Date
		super.init()
	}

	@objc func checkForUpdates(_ sender: Any?) {
		lastUpdateCheckDate = Date()

		guard let updatesURL = URL(string: "https://github.com/Pyroh/Fluor/releases/latest") else {
			return
		}
		NSWorkspace.shared.open(updatesURL)
	}
}
