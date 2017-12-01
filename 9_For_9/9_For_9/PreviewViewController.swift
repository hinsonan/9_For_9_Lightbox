//
//  PreviewViewController.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/27/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    var previewMeet: Meet?
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var creator: UILabel!
    @IBOutlet weak var date: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        self.navigationItem.title = previewMeet?.location
        titleName.text = previewMeet?.name
        creator.text = previewMeet?.creator
        date.text = previewMeet?.date
        if let imageName = previewMeet?.imgName {
            image.image = UIImage(named: imageName)
            
        } else if let imageURL = previewMeet?.imgURL{
            let session = URLSession(configuration: .default)
            if let url = URL(string: imageURL){
                let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                    if let data = data{
                        DispatchQueue.main.async {
                            self.image.image = UIImage(data: data)
                        }
                        
                        
                    }
                })
                task.resume()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func AddMeet(_ sender: UIButton) {
        //print("Please respond")
        // 1.
        var passwordTextField: UITextField?
        
        // 2.
        let alertController = UIAlertController(
            title: "Enter Password",
            message: "Please enter your credentials",
            preferredStyle: UIAlertControllerStyle.alert)
        
        // 3.
        let loginAction = UIAlertAction(
        title: "Add Meet", style: UIAlertActionStyle.default) {
            (action) -> Void in
            
            
            if let password = passwordTextField?.text {
                if let newMeetData = self.previewMeet,
                    password == self.previewMeet?.password{
                    Data.meetData.append(newMeetData)
                self.navigationController?.popToRootViewController(animated: true)
                }
                
            } else {
                print("No password entered")
            }
        }
        
       
        alertController.addTextField {
            (txtPassword) -> Void in
            passwordTextField = txtPassword
            
            passwordTextField!.placeholder = "Password"
        }
        
        // 5.
        alertController.addAction(loginAction)
        self.present(alertController, animated: true, completion: nil)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
