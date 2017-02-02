import Foundation

struct FileModel
{
    var filename : String?
    var isFolder : Bool? // I guess it's not String so I've used Bool
    var modDate : Date?
    var fileType : FileType?
    var isOrange : Bool?
    var isBlue : Bool?
    
    init(_ filename : String?,
         isFolder: Bool?,
         modDate: Date?,
         fileType: FileType?,
         isOrange: Bool?,
         isBlue: Bool?)
    {
        self.filename = filename
        self.isFolder = isFolder
        self.modDate = modDate
        self.fileType = fileType
        self.isOrange = isOrange
        self.isBlue = isBlue
    }
}
