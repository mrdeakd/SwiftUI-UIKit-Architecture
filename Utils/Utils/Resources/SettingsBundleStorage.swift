@propertyWrapper
public struct SettingsBundleStorage<T> {
    private let key: String

    public init(key: String) {
        self.key = key
    }

    public var wrappedValue: T? {
        get { UserDefaults.standard.value(forKey: key) as? T }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}

extension SettingsBundleStorage {

    enum PList {
        case root
        case child(name: String)

        var name: String {
            var file: String
            switch self {
            case .root: file = "Root"
            case .child(let name): file = name.replacingOccurrences(of: ".plist", with: "")
            }
            file.append(".plist")
            return file
        }
    }
}

extension SettingsBundleStorage {

    func setBundleDefaults(plist: PList = .root) {
        let settingsName                    = "Settings"
        let settingsExtension               = "bundle"
        let settingsPreferencesItems        = "PreferenceSpecifiers"
        let settingsPreferenceKey           = "Key"
        let settingsPreferenceDefaultValue  = "DefaultValue"

        guard let settingsBundleURL = Bundle.main.url(forResource: settingsName, withExtension: settingsExtension),
              let settingsData = try? Data(contentsOf: settingsBundleURL.appendingPathComponent(plist.name)),
              let settingsPlist = try? PropertyListSerialization.propertyList(
                from: settingsData,
                options: [],
                format: nil) as? [String: Any],
              let settingsPreferences = settingsPlist[settingsPreferencesItems] as? [[String: Any]] else {
            return assertionFailure("Can not get the \(plist.name) from the bundle: \(settingsName)")
        }

        var defaultsToRegister = [String: Any]()

        settingsPreferences.forEach { preference in
            if let key = preference[settingsPreferenceKey] as? String {
                defaultsToRegister[key] = preference[settingsPreferenceDefaultValue]
            }
        }

        UserDefaults.standard.register(defaults: defaultsToRegister)
    }
}
