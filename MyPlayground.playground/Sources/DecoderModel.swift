import Foundation
public struct Cards: Decodable {
    public var card: Card
}

public struct Card: Decodable {
    public var name: String?
    public var cmc: Int?
    public var colors: [String]?
    public var type: String?
    public var rarity: String?
    public var setName: String?
    
}
