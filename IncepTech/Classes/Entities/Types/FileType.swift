import Foundation
import UIKit

enum FileType : String
{
    case image  = "image"
    case pdf    = "pdf"
    case movie  = "movie"
    case music  = "music"
    case text   = "text"
    case doc    = "doc"
    
    var icon : String
    {
        switch self {
        case .image:
            return self.rawValue
        default:
            return "file"
        }
    }
}
