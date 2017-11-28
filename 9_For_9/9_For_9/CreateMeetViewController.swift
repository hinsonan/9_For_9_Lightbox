//
//  CreateMeetViewController.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/24/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class CreateMeetViewController: UIViewController {

    
    var newMeet: Meet?
    @IBOutlet weak var meetName: UITextField!
    @IBOutlet weak var imgText: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var creator: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //set the nav title
        self.navigationItem.title = "Create Meet"
        
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this function will get the new meet model
    @IBAction func previewNewMeet(_ sender: UIButton) {
        if meetName.text! == "" || location.text! == "" || date.text! == "" || passwordText.text! == "" || creator.text! == ""{
            print("items were nil")
        }else{
            if let meetName = meetName.text,
                let imageName = imgText.text,
                let locationName = location.text,
                let dateName = date.text,
                let passwordName = passwordText.text,
                let creatorName = creator.text{
                newMeet = Meet(name: meetName, location: locationName, date: dateName, password: passwordName, creator: creatorName, imgURL: imageName)
                performSegue(withIdentifier: "createMeetSegue", sender: nil)
            }
            
        }
        
            
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            if identifier == "createMeetSegue" {
                if let pvc = segue.destination as? PreviewViewController,
                    let cvc = segue.source as? CreateMeetViewController
                    //let button = sender as? UIButton,
                    //let createView = button.superview,
                    //let content = createView as? CreateMeetViewController
                    
                     {
                        pvc.previewMeet = cvc.newMeet
                    
                    }
                }
                
            }
        }
        
        
    
    

}
