
import Foundation

extension URL {

    public init(@URLBuilder _ build: () throws -> URL) rethrows {
        self = try build()
    }
}

@resultBuilder
public enum URLBuilder {

    public static func buildPartialBlock(first: Scheme) -> URLComponents {
        buildPartialBlock(accumulated: URLComponents(), next: first)
    }

    public static func buildPartialBlock(accumulated components: URLComponents, next scheme: Scheme) -> URLComponents {
        components.modify { $0.scheme = scheme.value }
    }

    public static func buildPartialBlock(accumulated components: URLComponents, next user: User) -> URLComponents {
        components.modify {
            $0.user = user.value
            $0.password = user.password
        }
    }

    public static func buildPartialBlock(accumulated components: URLComponents, next host: Host) -> URLComponents {
        components.modify { $0.host = host.value }
    }

    public static func buildPartialBlock(accumulated components: URLComponents, next port: Port) -> URLComponents {
        components.modify { $0.port = port.value }
    }

    public static func buildPartialBlock(accumulated components: URLComponents, next path: Path) -> URLComponents {
        components.modify { $0.path = path.value }
    }

    public static func buildPartialBlock(accumulated components: URLComponents, next item: QueryItem) -> URLComponents {
        components.modify { $0.addQueryItem(URLQueryItem(item)) }
    }

    public static func buildPartialBlock(accumulated components: URLComponents, next fragment: Fragment) -> URLComponents {
        components.modify { $0.fragment = fragment.value }
    }

    public static func buildFinalResult(_ components: URLComponents) -> URL { print(components); return components.url(relativeTo: nil)! }
}

extension URLComponents {

    fileprivate func modify(
        _ modifier: (inout URLComponents) -> Void
    ) -> URLComponents {
        var component = self
        modifier(&component)
        return component
    }

    fileprivate mutating func addQueryItem(_ item: URLQueryItem) {
        var items = queryItems ?? []
        items.append(item)
        queryItems = items
    }
}
