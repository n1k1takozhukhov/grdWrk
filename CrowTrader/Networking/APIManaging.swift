import Foundation

import Foundation

protocol APIManaging {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

class APIManager: APIManaging {

    func request<T>(_ endpoint: Endpoint) async throws -> T where T : Decodable {

        let request = try endpoint.asURLRequest()
        let (data, response) = try await URLSession.shared.data(for: request)
        debugPrint("Finished request: \(response)")
        return try decode(data: data)
    }
}

private extension APIManager {
    func validateResponse(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.urlSessionFailed
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw APIError.urlSessionFailed
        }
    }

    func decode<T: Decodable>(data: Data) throws -> T {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(T.self, from: data)
    }
}

