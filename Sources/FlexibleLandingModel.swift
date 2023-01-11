import Foundation

public struct FlexibleLandingModel: Codable {
    
    // MARK: Properties
    
    public let id: String
    public let template: Int
    public let screens: [FlexibleLandingScreen]
    
    // MARK: Initialization
    
    public init(id: String, template: Int, screens: [FlexibleLandingScreen]) {
        self.id = id
        self.template = template
        self.screens = screens
    }
}
