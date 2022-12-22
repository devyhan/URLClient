import Foundation

@propertyWrapper
public struct URLClient<T> {
  
  private let keyPath: KeyPath<Client, T>
  
  public var wrappedValue: T {
    Client.assembly[keyPath: keyPath]
  }
  
  init(_ keyPath: KeyPath<Client, T>) {
    self.keyPath = keyPath
  }
}

extension Client {
  static var assembly: Client = {
    if !ProcessInfo.processInfo.isRunningForTests {
      return Client(
        urlRequest: URLRequestActor()
      )
    } else {
      return Client(
        urlRequest: URLRequestActorMock()
      )
    }
  }()
}

struct Client {
  let urlRequest: URLRequestActorProtocol
}

protocol URLRequestActorProtocol: Actor {
  var data: Data? { get }
  func fetch(_ request: URLRequest) async throws -> Self
  func decode<T>(_ type: T.Type) throws -> T? where T: Decodable
}

actor URLRequestActor: URLRequestActorProtocol {
  var data: Data?

  func fetch(_ request: URLRequest) async throws -> Self {
    self.data = try await URLSession.shared.data(for: request).0
    return self
  }
  
  func decode<T>(_ type: T.Type) throws -> T? where T: Decodable {
    var result: T?
    if let data = self.data {
      result = try JSONDecoder().decode(type, from: data)
    }
    return result
  }
}

actor URLRequestActorMock: URLRequestActorProtocol {
  var data: Data?

  func fetch(_ request: URLRequest) async throws -> Self {
    if request.url == URL(string: "https://api.success.com") {
      data = """
        {
          "name": "testName",
          "age": 12
        }
      """.data(using: .utf8)
    } else {
      throw URLError(.badURL)
    }

    return self
  }

  func decode<T>(_ type: T.Type) throws -> T? where T : Decodable {
    var result: T?
    if let data = self.data {
      result = try JSONDecoder().decode(type, from: data)
    }
    return result
  }
}
