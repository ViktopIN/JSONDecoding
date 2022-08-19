import Foundation

public struct Card: Decodable {
    public var name: String?
    public var names: [String]?
    public var manaCost: String?
    public var cmc: Int?
    public var colors: [String]?
    public var colorIdentity: [String]?
    public var type: String?
    public var supertypes: [String]?
    public var types: [String]?
    public var subtypes: [String]?
    public var rarity: String?
    public var set: String?
    public var text: String?
    public var artist: String?
    public var number: String?
    public var power: String?
    public var toughness: String?
    public var layout: String?
    public var multiverseid: Int?
    public var imageURL: String?
    public var rulings: [[String:String]]?
    public var foreignNames: [[String:String]]?
    public var printings: [String]?
    public var originalText: String?
    public var originalType: String?
    public var id: String?
    public var flavor: String?

    public static func ==(lhs: Card, rhs: Card) -> Bool {
            return lhs.id == rhs.id
        }
}