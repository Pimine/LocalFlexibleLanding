import Foundation

public struct FlexibleLandingScreen: Codable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case template
        case products
    }
    
    // MARK: Properties
    
    public let id: String
    public let template: Int
    public let products: [String]
    
    // MARK: Initialization
    
    public init(
        id: String,
        template: Int,
        products: [String]
    ) {
        self.id = id
        self.template = template
        self.products = products
    }
    
    // MARK: Codable
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.template = try container.decode(Int.self, forKey: .template)
        self.products = try container.decodeIfPresent([String].self, forKey: .products) ?? []
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(template, forKey: .template)
        try container.encodeIfPresent(products, forKey: .products)
    }
}

// MARK: - Equatable

extension FlexibleLandingScreen: Equatable {
    
    public static func == (lhs: FlexibleLandingScreen, rhs: FlexibleLandingScreen) -> Bool {
        lhs.id == rhs.id
    }
}
