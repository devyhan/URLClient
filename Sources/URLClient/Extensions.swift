import Foundation

extension Sequence {
  func asyncForEach(
    _ operation: (Element) async throws -> Void
  ) async rethrows {
    for element in self {
      try await operation(element)
    }
  }
}

public extension ProcessInfo {
  var isRunningForTests: Bool {
    return ProcessInfo.processInfo.environment["IS_UNIT_TESTING"] == "YES"
  }
}
