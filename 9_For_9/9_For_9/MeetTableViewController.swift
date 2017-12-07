//
//  MeetTableViewController.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/4/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class MeetTableViewController: UITableViewController {
    
    var data: [Meet]?
    
    //these will set up the things needed for the search bar
    var filteredData =  [Meet]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Meets"
        
        
        data = Data.meetData
        
        setUpSearchController()
        
        self.hideKeyboardWhenTappedAround()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 1
        //var nav = self.navigationController?.navigationBar
        // 2
        //nav?.barStyle = UIBarStyle.Black
        //nav?.tintColor = UIColor.yellowColor()
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        imageView.contentMode = .scaleAspectFit
        // 4
        let image = UIImage(named: "Nav_Logo")
        imageView.image = image
        // 5
        navigationItem.titleView = imageView
        
        
    }
    
    //this will be used to reload the data
    override func viewWillAppear(_ animated: Bool) {
        
        data = Data.meetData
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpSearchController(){
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search Meets"
        searchController.obscuresBackgroundDuringPresentation  = false
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering(){
            return filteredData.count
        }
        return data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meetCell", for: indexPath)
        
        // Configure the cell...
        if let meetCell = cell as? MeetTableViewCell{
            
            if let unwrappedData = data{
                let meet: Meet
                if isFiltering(){
                    meet = filteredData[indexPath.row]
                }else{
                    meet = unwrappedData[indexPath.row]
                }
                
                meetCell.meetCellName.text = meet.name
                meetCell.meetCellLocation.text = meet.location
                meetCell.meetDate.text = meet.date
                if let imageName = meet.imgName{
                    meetCell.meetCellImage.image = UIImage(named: imageName)
                }else{
                    meetCell.meetCellImage.image = nil
                }
            
            //sets up the use for imgURLs
            //sets up image urls in the home page
            if let imageURL = meet.imgURL{
                let session = URLSession(configuration: .default)
                if let url = URL(string: imageURL){
                    let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                        if let data = data{
                            DispatchQueue.main.async {
                                meetCell.meetCellImage.image = UIImage(data: data)
                            }                           
                            
                        }
                    })
                    task.resume()
                }
                }
                
            }
            
        }
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            if identifier == "meetSegue" {
                if let svc = segue.destination as? MeetJoinViewController,
                    let button = sender as? UIButton,
                    let view = button.superview,
                    let cell = view.superview as? MeetTableViewCell,
                    let data = data {
                    if let indexPath = tableView.indexPath(for: cell) {
                        if isFiltering(){
                            svc.meet = filteredData[indexPath.row]
                        }else{
                            svc.meet = data[indexPath.row]
                        }
                        
                    }
                }
                
            }
        }
        
        if let identifier = segue.identifier {
            if identifier == "meetCellSegue" {
                if let svc = segue.destination as? MeetJoinViewController,
                    let cell = sender as? UITableViewCell,
                    let data = data {
                    if let indexPath = tableView.indexPath(for: cell) {
                        if isFiltering(){
                            svc.meet = filteredData[indexPath.row]
                        }else{
                            svc.meet = data[indexPath.row]
                        }
                        
                    }
                }
                
            }
        }
        
        
        
    }
    
    
    func filterContentForSearchText(_ searchText: String){
        guard let data = data else{return}
        filteredData = data.filter({ (meet) -> Bool in
            if let name = meet.name{
                return name.lowercased().contains(searchText.lowercased())
            }
            return false
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool{
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    

}

extension MeetTableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text{
            filterContentForSearchText(text)
        }
        
    }
}
