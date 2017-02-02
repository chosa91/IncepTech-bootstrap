import UIKit

extension FileTableViewController
{
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return files.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: FileCell = tableView.dequeueReusableCell(withIdentifier: "FileCellIdentifier", for: indexPath) as! FileCell
        let fileModel = files[indexPath.row]
        
        cell.fileModel = fileModel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let fileModel = files[indexPath.row]
        
        if let isFolder = fileModel.isFolder
        {
            if isFolder
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "FileScreen")
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else
            {
                NSLog("it's a file")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let actionStar = UITableViewRowAction(style: .normal, title: "\u{2605}") {action in
            NSLog("actionStar")
        }
        actionStar.backgroundColor = UIColor.lightGray
        
        let actionAnchor = UITableViewRowAction(style: .normal, title: "\u{2606}") {action in
            NSLog("actionAnchor")
        }
        actionAnchor.backgroundColor = UIColor.lightGray
        
        let actionDelete = UITableViewRowAction(style: .default, title: "\u{267A}") {action in
            NSLog("actionDelete")
        }
        actionDelete.backgroundColor = UIColor.lightGray
        
        let actions = [actionStar, actionAnchor, actionDelete]

        return actions
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
//    {
//        if editingStyle == UITableViewCellEditingStyle.delete
//        {
//            files.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
//        }
//    }
    
}
