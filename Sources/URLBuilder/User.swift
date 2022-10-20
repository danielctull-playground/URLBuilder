
public struct User {
    let value: String
    let password: String?
    public init(_ value: String, password: String? = nil) {
        self.value = value
        self.password = password
    }
}
