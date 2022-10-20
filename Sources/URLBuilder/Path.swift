
public struct Path {

    public struct Component {
        let value: String
    }

    private let components: [Component]

    public init(_ value: Component) {
        components = [value]
    }

    public init(_ value: Component...) {
        components = value
    }

    var value: String {
        "/" + components.map(\.value).joined(separator: "/")
    }
}

extension Path.Component: ExpressibleByStringLiteral {

    public init(stringLiteral: String) {
        value = stringLiteral
    }
}
