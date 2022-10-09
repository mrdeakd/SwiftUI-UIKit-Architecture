import Foundation

public struct PreferredAppLanguage {
    @SettingsBundleStorage(key: "APP_LANGUAGE")
    private static var settingsCurrent: String?
    
    public static var current: [String] {
        switch settingsCurrent {
        case "English":
            return ["en"]
        case "Hungarian":
            return ["hu"]
        default:
            return ["en"]
        }
    }
}
