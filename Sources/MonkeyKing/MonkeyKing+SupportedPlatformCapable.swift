
import Foundation

protocol SupportedPlatformCapable {

    var platform: MonkeyKing.SupportedPlatform { get }
}

extension MonkeyKing.Account: SupportedPlatformCapable {

    var platform: MonkeyKing.SupportedPlatform {
        switch self {
        case .weChat:
            return .weChat
        case .qq:
            return .qq
        case .weibo:
            return .weibo
        case .pocket:
            return .pocket
        case .baobao:
            return .baobao
        case .twitter:
            return .twitter
        }
    }
}

extension MonkeyKing.Message: SupportedPlatformCapable {

    var platform: MonkeyKing.SupportedPlatform {
        switch self {
        case .weChat:
            return .weChat
        case .qq:
            return .qq
        case .weibo:
            return .weibo
        case .baobao:
            return .baobao
        case .twitter:
            return .twitter
        }
    }
}

extension MonkeyKing.Order: SupportedPlatformCapable {

    var platform: MonkeyKing.SupportedPlatform {
        switch self {
        case .weChat:
            return .weChat
        case .baobao:
            return .baobao
        }
    }
}

extension MonkeyKing.Program: SupportedPlatformCapable {

    var platform: MonkeyKing.SupportedPlatform {
        switch self {
        case .weChat:
            return .weChat
        }
    }
}
