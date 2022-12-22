import Foundation

protocol URLSessionProtocol {
  /// Convenience method to load data using an URLRequest, creates and resumes an URLSessionDataTask internally.
  ///
  /// - Parameter request: The URLRequest for which to load data.
  /// - Returns: Data and response.
  func data(for request: URLRequest) async throws -> (Data, URLResponse)
  
  /// Convenience method to load data using an URL, creates and resumes an URLSessionDataTask internally.
  ///
  /// - Parameter url: The URL for which to load data.
  /// - Returns: Data and response.
  //  func data(from url: URL) async throws -> (Data, URLResponse)
  
  /// Convenience method to upload data using an URLRequest, creates and resumes an URLSessionUploadTask internally.
  ///
  /// - Parameter request: The URLRequest for which to upload data.
  /// - Parameter fileURL: File to upload.
  /// - Returns: Data and response.
  //  func upload(for request: URLRequest, fromFile fileURL: URL) async throws -> (Data, URLResponse)
  
  /// Convenience method to upload data using an URLRequest, creates and resumes an URLSessionUploadTask internally.
  ///
  /// - Parameter request: The URLRequest for which to upload data.
  /// - Parameter bodyData: Data to upload.
  /// - Returns: Data and response.
  //  func upload(for request: URLRequest, from bodyData: Data) async throws -> (Data, URLResponse)
}

//class MockURLSession: URLSessionProtocol {
//  static let shared = MockURLSession()
//  
//  private enum Status: String {
//    case passed, faillure
//  }
//  
//  func data(for request: URLRequest) async throws -> (Data, URLResponse) {
//    var response = URLResponse()
//    let path = request.url?.relativePath.dropFirst().description
//    
//    if path == Status.passed.rawValue {
//      response = URLResponse(
//        url: request.url!,
//        mimeType: "minType",
//        expectedContentLength: 0,
//        textEncodingName: "textEncodingName"
//      )
//    }
//    
//    if path == Status.faillure.rawValue {
//      if let urlResponse =  HTTPURLResponse(
//        url: request.url!,
//        statusCode: 402,
//        httpVersion: "2",
//        headerFields: nil
//      ) {
//        response = urlResponse
//      }
//    }
    
    
//    let sucessResponse = HTTPURLResponse(
//      url: request.url!,
//      statusCode: 200,
//      httpVersion: "2",
//      headerFields: nil
//    )
//    let failureResponse = HTTPURLResponse(
//      url: request.url!,
//      statusCode: 402,
//      httpVersion: "2",
//      headerFields: nil
//    )
    
//    guard let data = """
//    {
//        "name" : "Sodeul",
//        "age"  : 26
//    }
//    """.data(using: .utf8) else {
//      return (Data(), response)
//    }
//
//    
//    return (data, response)
//  }
//}
