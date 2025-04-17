import SwiftUI
import CoreIME
import CommonExtensions

struct Options {

        nonisolated(unsafe) private(set) static var characterStandard: CharacterStandard = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.CharacterStandard)
                return CharacterStandard.standard(of: savedValue)
        }()
        static func updateCharacterStandard(to standard: CharacterStandard) {
                characterStandard = standard
                let value: Int = standard.rawValue
                UserDefaults.standard.set(value, forKey: OptionsKey.CharacterStandard)
        }

        nonisolated(unsafe) private(set) static var isAudioFeedbackOn: Bool = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.AudioFeedback)
                return savedValue == 1
        }()
        static func updateAudioFeedbackStatus(isOn: Bool) {
                isAudioFeedbackOn = isOn
                let value: Int = isOn ? 1 : 0
                UserDefaults.standard.set(value, forKey: OptionsKey.AudioFeedback)
        }

        nonisolated(unsafe) private(set) static var showLowercaseKeys: Bool = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.KeyCase)
                switch savedValue {
                case 0, 1:
                        return true
                case 2:
                        return false
                default:
                        return true
                }
        }()
        static func updateShowLowercaseKeys(to state: Bool) {
                showLowercaseKeys = state
                let value: Int = state ? 1 : 2
                UserDefaults.standard.set(value, forKey: OptionsKey.KeyCase)
        }
        nonisolated(unsafe) private(set) static var keyTextPreview: Bool = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.KeyTextPreview)
                switch savedValue {
                case 0, 1:
                        return true
                case 2:
                        return false
                default:
                        return true
                }
        }()
        static func updateKeyTextPreview(to state: Bool) {
                keyTextPreview = state
                let value: Int = state ? 1 : 2
                UserDefaults.standard.set(value, forKey: OptionsKey.KeyTextPreview)
        }

        nonisolated(unsafe) private(set) static var commentStyle: CommentStyle = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.CommentStyle)
                switch savedValue {
                case CommentStyle.aboveCandidates.rawValue:
                        return .aboveCandidates
                case CommentStyle.belowCandidates.rawValue:
                        return .belowCandidates
                case CommentStyle.noComments.rawValue:
                        return .noComments
                default:
                        return .aboveCandidates
                }
        }()
        static func updateCommentStyle(to style: CommentStyle) {
                commentStyle = style
                let value: Int = style.rawValue
                UserDefaults.standard.set(value, forKey: OptionsKey.CommentStyle)
        }

        nonisolated(unsafe) private(set) static var commentToneStyle: CommentToneStyle = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.CommentToneStyle)
                return CommentToneStyle.style(of: savedValue)
        }()
        static func updateCommentToneStyle(to style: CommentToneStyle) {
                commentToneStyle = style
                let value: Int = style.rawValue
                UserDefaults.standard.set(value, forKey: OptionsKey.CommentToneStyle)
        }

        nonisolated(unsafe) private(set) static var isEmojiSuggestionsOn: Bool = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.EmojiSuggestions)
                switch savedValue {
                case 0, 1:
                        return true
                case 2:
                        return false
                default:
                        return true
                }
        }()
        static func updateEmojiSuggestions(to isOn: Bool) {
                isEmojiSuggestionsOn = isOn
                let value: Int = isOn ? 1 : 2
                UserDefaults.standard.set(value, forKey: OptionsKey.EmojiSuggestions)
        }

        nonisolated(unsafe) private(set) static var cangjieVariant: CangjieVariant = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.CangjieVariant)
                return CangjieVariant.variant(of: savedValue)
        }()
        static func updateCangjieVariant(to variant: CangjieVariant) {
                cangjieVariant = variant
                let value: Int = variant.rawValue
                UserDefaults.standard.set(value, forKey: OptionsKey.CangjieVariant)
        }

        nonisolated(unsafe) private(set) static var isCompatibleModeOn: Bool = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.SchemeRules)
                return savedValue == 1
        }()
        static func updateCompatibleMode(to isOn: Bool) {
                isCompatibleModeOn = isOn
                let value: Int = isOn ? 1 : 0
                UserDefaults.standard.set(value, forKey: OptionsKey.SchemeRules)
        }

        nonisolated(unsafe) private(set) static var preferredLanguage: KeyboardDisplayLanguage = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.KeyboardDisplayLanguage)
                return KeyboardDisplayLanguage.language(of: savedValue)
        }()
        static func updatePreferredLanguage(to language: KeyboardDisplayLanguage) {
                preferredLanguage = language
                UserDefaults.standard.set(language.rawValue, forKey: OptionsKey.KeyboardDisplayLanguage)
                guard let languageCode = language.languageCode else {
                        UserDefaults.standard.removeObject(forKey: OptionsKey.AppleLanguages)
                        return
                }
                let oldCodes: [String] = Locale.preferredLanguages
                let newCodes: [String] = ([languageCode] + oldCodes).uniqued()
                UserDefaults.standard.set(newCodes, forKey: OptionsKey.AppleLanguages)
        }

        nonisolated(unsafe) private(set) static var isInputMemoryOn: Bool = {
                let savedValue: Int = UserDefaults.standard.integer(forKey: OptionsKey.UserLexiconInputMemory)
                switch savedValue {
                case 0, 1:
                        return true
                case 2:
                        return false
                default:
                        return true
                }
        }()
        static func updateInputMemory(to isOn: Bool) {
                isInputMemoryOn = isOn
                let value: Int = isOn ? 1 : 2
                UserDefaults.standard.set(value, forKey: OptionsKey.UserLexiconInputMemory)
        }
}

struct OptionsKey {

        static let AppleLanguages: String = "AppleLanguages"
        static let KeyboardDisplayLanguage: String = "KeyboardDisplayLanguage"

        static let CharacterStandard: String = "logogram"
        static let AudioFeedback: String = "audio_feedback"
        static let HapticFeedback: String = "haptic_feedback"
        static let KeyboardLayout: String = "keyboard_layout"
        static let NumericLayout: String = "NumericLayout"
        static let StrokeLayout: String = "StrokeLayout"
        static let KeyCase: String = "KeyCase"
        static let KeyTextPreview: String = "KeyPreview"
        static let CommentStyle: String = "jyutping_display"
        static let CommentToneStyle: String = "tone_style"
        static let CangjieVariant: String = "CangjieVariant"
        static let EmojiSuggestions: String = "emoji"
        static let SchemeRules: String = "SchemeRules"
        static let UserLexiconInputMemory: String = "UserLexiconInputMemory"

        // @available(*, deprecated)
        // static let DoubleSpaceShortcut: String = "double_space_shortcut"

        // @available(*, deprecated)
        // static let PasteButtonStyle: String = "PasteButtonStyle"
}

enum CommentStyle: Int {
        case aboveCandidates = 1
        case belowCandidates = 2
        case noComments = 3
        var isAbove: Bool { self == .aboveCandidates }
        var isBelow: Bool { self == .belowCandidates }
        var isHidden: Bool { self == .noComments }
}
enum CommentToneStyle: Int, CaseIterable {
        case normal = 1
        case superscript = 2
        case `subscript` = 3
        case noTones = 4
        static func style(of value: Int) -> CommentToneStyle {
                return Self.allCases.first(where: { $0.rawValue == value }) ?? Self.normal
        }
}

/// Preferred Keyboard UI Display Language
enum KeyboardDisplayLanguage: Int, CaseIterable {

        case auto = 1
        case cantonese = 2
        case chineseHongKong = 3
        case english = 4
        case french = 5

        static func language(of value: Int) -> KeyboardDisplayLanguage {
                return self.allCases.first(where: { $0.rawValue == value }) ?? Self.auto
        }

        var languageCode: String? {
                switch self {
                case .auto:
                        nil
                case .cantonese:
                        "yue"
                case .chineseHongKong:
                        "zh-Hant-HK"
                case .english:
                        "en"
                case .french:
                        "fr"
                }
        }
}

/*
@available(*, deprecated)
enum DoubleSpaceShortcut: Int {
        case insertPeriod = 1
        case doNothing = 2
        case insertIdeographicComma = 3
        case insertFullWidthSpace = 4
}

@available(*, deprecated)
enum PasteButtonStyle: Int {
        case `default` = 1
        case system = 2
        var isSystem: Bool {
                return self == .system
        }
}
*/
