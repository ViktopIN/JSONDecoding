import Foundation

public struct CardURL {

    private let scheme = "https"
    private let host = "api.magicthegathering.io"
    private let path = "/v1/cards/"
    private var requestQuery: URLQueryItem

    public func getURL() -> URL? {
        var components = URLComponents()
        
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        
        components.queryItems = [requestQuery]
        
        return components.url
    }
    
    public init(_ name: String) {
        self.requestQuery = URLQueryItem(name: "name", value: name)
    }
}
