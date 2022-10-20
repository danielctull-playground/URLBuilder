
import Foundation
import URLBuilder
import XCTest

final class RequestBuilderTests: XCTestCase {

    func test() {
        let url = URL {
            Scheme.https
            Host("example.com")
            Port(123)
            Path("path", "to", "resource")
            QueryItem("query", value: "value")
            Fragment("fragment")
        }
        XCTAssertEqual(url.absoluteString, "https://example.com:123/path/to/resource?query=value#fragment")
    }

    func testFragment() {
        let url = URL {
            Scheme.https
            Host("example.com")
            Fragment("foo")
        }
        XCTAssertEqual(url.absoluteString, "https://example.com#foo")
    }

    func testHost() {
        let url = URL {
            Scheme.https
            Host("example.com")
        }
        XCTAssertEqual(url.absoluteString, "https://example.com")
    }

    func testPathSingle() {
        let url = URL {
            Scheme.https
            Host("example.com")
            Path("foo")
        }
        XCTAssertEqual(url.absoluteString, "https://example.com/foo")
    }

    func testPathMultiple() {
        let url = URL {
            Scheme.https
            Host("example.com")
            Path("foo", "bar", "baz")
        }
        XCTAssertEqual(url.absoluteString, "https://example.com/foo/bar/baz")
    }

    func testPort() {
        let url = URL {
            Scheme.https
            Host("example.com")
            Port(123)
        }
        XCTAssertEqual(url.absoluteString, "https://example.com:123")
    }

    func testQuerySingleName() {
        let url = URL {
            Scheme.https
            Host("example.com")
            QueryItem("foo")
        }
        XCTAssertEqual(url.absoluteString, "https://example.com?foo")
    }

    func testQuerySingleNameValue() {
        let url = URL {
            Scheme.https
            Host("example.com")
            QueryItem("foo", value: "bar")
        }
        XCTAssertEqual(url.absoluteString, "https://example.com?foo=bar")
    }

    func testQueryMultipleNameValue() {
        let url = URL {
            Scheme.https
            Host("example.com")
            QueryItem("foo", value: "bar")
            QueryItem("baz", value: "qux")
        }
        XCTAssertEqual(url.absoluteString, "https://example.com?foo=bar&baz=qux")
    }

    func testQueryMixed() {
        let url = URL {
            Scheme.https
            Host("example.com")
            QueryItem("foo", value: "bar")
            QueryItem("baz")
        }
        XCTAssertEqual(url.absoluteString, "https://example.com?foo=bar&baz")
    }

    func testScheme() {
        let url = URL {
            Scheme.https
        }
        XCTAssertEqual(url.absoluteString, "https:")
    }

    func testUser() {
        let url = URL {
            Scheme.https
            Host("example.com")
            User("daniel")
        }
        XCTAssertEqual(url.absoluteString, "https://daniel@example.com")
    }

    func testUserWithPassword() {
        let url = URL {
            Scheme.https
            Host("example.com")
            User("daniel", password: "password")
        }
        XCTAssertEqual(url.absoluteString, "https://daniel:password@example.com")
    }
}
