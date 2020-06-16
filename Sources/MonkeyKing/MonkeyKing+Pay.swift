
import Foundation

extension MonkeyKing {

    public enum Order {
        /// You can custom URL scheme. Default "ap" + String(appID)
        case baobao(url: URL)
        case weChat(url: URL)
    }

    public class func deliver(_ order: Order, completionHandler: @escaping PayCompletionHandler) {
        guard order.platform.isAppInstalled else {
            completionHandler(.failure(.noApp))
            return
        }

        shared.payCompletionHandler = completionHandler
        shared.oauthCompletionHandler = nil
        shared.deliverCompletionHandler = nil
        shared.openSchemeCompletionHandler = nil

        switch order {
        case .weChat(let url):
            shared.openURL(url) { flag in
                if flag { return }
                completionHandler(.failure(.sdk(.invalidURLScheme)))
            }
        case .baobao(let url):
            shared.openURL(url) { flag in
                if flag { return }
                completionHandler(.failure(.sdk(.invalidURLScheme)))
            }
        }
    }
}
