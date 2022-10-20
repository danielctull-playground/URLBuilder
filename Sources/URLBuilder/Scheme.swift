
public struct Scheme {
    let value: String
    public init(_ value: String) {
        self.value = value
    }
}

extension Scheme {
    public static let https = Self("https")
    public static let http = Self("http")
}
