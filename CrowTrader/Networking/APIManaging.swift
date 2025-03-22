import Foundation

protocol APIManaging {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

class APIManager: APIManaging {
    
    func request<T>(_ endpoint: any Endpoint) async throws -> T where T : Decodable {
        
        let request = try endpoint.asURLRequest()
        let (data, respones) = try await URLSession.shared.data(for: request)
        debugPrint(String(data: data, encoding: .utf8) ?? "No Data")
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
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
