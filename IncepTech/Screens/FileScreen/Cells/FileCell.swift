import UIKit

class FileCell: UITableViewCell
{
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var fileDescriptionLabel: UILabel!
    @IBOutlet weak var coloredLeftTopView: UIView!
    @IBOutlet weak var coloredLeftBottomView: UIView!
    @IBOutlet weak var folderRightView: UIView!
    
    var fileModel: FileModel! {
        didSet {
            setupIconImage()
            setupFileName()
            setupFileDescription()
            setupLeftView()
            setupRightView()
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func setupIconImage()
    {
        if let fileType = fileModel.fileType
        {
            if let img = UIImage(named: fileType.icon)
            {
                iconImageView.image = img
            }
        }
        else
        {
            if let img = UIImage(named: "folder")
            {
                iconImageView.image = img
            }
        }
        
    }
    
    func setupFileName()
    {
        if let name = fileModel.filename
        {
            fileNameLabel.text = name
        }
    }
    
    func setupFileDescription()
    {
        if let modDate = fileModel.modDate
        {
            let df = DateFormatterUtils.singleton
            df.dateFormat = "MMM dd, yyyy"
            let dateString = df.string(from: modDate)
            fileDescriptionLabel.text = "modified at \(dateString)"
        }
    }
    
    func setupLeftView()
    {
        let isOrange : Bool = fileModel.isOrange!
        let isBlue : Bool = fileModel.isBlue!
        var topLeftBackgroundColor: UIColor
        var bottomLeftBackgroundColor: UIColor
        
        switch (isOrange, isBlue)
        {
        case (true, true):
            topLeftBackgroundColor = UIColor.orange
            bottomLeftBackgroundColor = UIColor.blue
            break
        case (false, true):
            topLeftBackgroundColor = UIColor.blue
            bottomLeftBackgroundColor = UIColor.blue
            break
        case (true, false):
            topLeftBackgroundColor = UIColor.orange
            bottomLeftBackgroundColor = UIColor.orange
            break
        default:
            topLeftBackgroundColor = UIColor.clear
            bottomLeftBackgroundColor = UIColor.clear
        }
        coloredLeftTopView.backgroundColor = topLeftBackgroundColor
        coloredLeftBottomView.backgroundColor = bottomLeftBackgroundColor
    }
    
    func setupRightView()
    {
        if let isFolder = fileModel.isFolder {
            folderRightView.isHidden = !isFolder
        }
    }
    
}
