import Foundation

public struct CardURL {

    private let scheme = "https"
    private let host = "api.magicthegathering.io"
    private let path: String
    
    public func getURL() -> URL? {
        var components = URLComponents()
        
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        
        return components.url
    }
    
    public init(_ id: String) {
        self.path = "/v1/cards/\(id)"
    }
}
