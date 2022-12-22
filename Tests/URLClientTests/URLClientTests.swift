import XCTest
import Foundation
@testable import URLClient

final class URLClientTests: XCTestCase {
  @URLClient(\.urlRequest) var requestMock

  func testURLRequestDecodeToData() async throws {
    let urlRequestStub = URLRequest(url: URL(string: "https://api.success.com")!)

    let decodeStub = try await self.requestMock.fetch(urlRequestStub).decode(Test.self)

    if let decodeStub = decodeStub {
      XCTAssertEqual(Test(name: "testName", age: 12), decodeStub)
    }
  }

  func testThrowErrorViaURLRequestFailure() async {
    let urlRequestStub = URLRequest(url: URL(string: "https://api.failure.com")!)
    do {
      let _ = try await self.requestMock.fetch(urlRequestStub).decode(Test.self)
    } catch {
      if let error = error as? URLError {
        XCTAssertEqual(error, URLError(.badURL))
      }
    }
  }
}

struct Test: Codable, Equatable {
  let name: String
  let age: Int
}
