
import Foundation

public struct QueryItem {
    let name: String
    let value: String?
    public init(_ name: String, value: String? = nil) {
        self.name = name
        self.value = value
    }
}

extension URLQueryItem {

    init(_ item: QueryItem) {
        self.init(name: item.name, value: item.value)
    }
}
