import UIKit
import Foundation

class FileTableViewController : UITableViewController
{
    var files = Array<FileModel>()
    let dummyData : [[String : Any]] = [ // TODO (csaszi): separate to a JSON and create a DataManager to read and parse it
        [
            "filename" : "Family Shared",
            "isFolder" : true,
            "modDate" : "2014/06/05",
            "isOrange" : false,
            "isBlue" : false
        ], [
            "filename" : "For Work",
            "isFolder" : true,
            "modDate" : "2014/07/02",
            "isOrange" : true,
            "isBlue" : false
        ], [
            "filename" : "WorkPowerpoint.pptx",
            "isFolder" : false,
            "modDate" : "2014/06/02",
            "fileType" : FileType.pdf,
            "isOrange" : false,
            "isBlue" : false
        ], [
            "filename" : "Speech.docx",
            "isFolder" : false,
            "modDate" : "2014/06/01",
            "fileType" : FileType.doc,
            "isOrange" : false,
            "isBlue" : true
        ], [
            "filename" : "Tom\'s Folder",
            "isFolder" : true,
            "modDate" : "2014/06/01",
            "isOrange" : false,
            "isBlue" : false
        ], [
            "filename" : "DSC119.jpg",
            "isFolder" : false,
            "modDate" : "2014/06/01",
            "fileType" : FileType.image,
            "isOrange" : true,
            "isBlue" : true
        ]]
    
    lazy var dateFormatter : DateFormatter = {
        var df = DateFormatterUtils.singleton
        df.dateFormat = "yyyy/MM/dd"
        return df
    }()
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        files = dummyData.map({parseToFile($0)})
        tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func parseToFile(_ obj: [String : Any]) -> FileModel
    {
        var modDate: Date?
        if let dateString = obj["modDate"]
        {
            modDate = dateFormatter.date(from: dateString as! String)
        }
        let newFileModel = FileModel.init(obj["filename"] as! String?,
                                          isFolder: obj["isFolder"] as! Bool?,
                                          modDate: modDate,
                                          fileType: obj["fileType"] as! FileType?,
                                          isOrange: obj["isOrange"] as! Bool?,
                                          isBlue: obj["isBlue"] as! Bool?)
        return newFileModel
    }
}
