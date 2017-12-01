//
//  MeetJoinViewController.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/11/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class MeetJoinViewController: UIViewController {
    
    var meet: Meet?
    
    @IBOutlet weak var meetJoinName: UILabel!
    @IBOutlet weak var meetJoinImage: UIImageView!
    @IBOutlet weak var meetJoinCreator: UILabel!
    @IBOutlet weak var meetJoinDate: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var wrongPasswordText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hides the wrong password text
        wrongPasswordText.isHidden = true
        
       self.navigationItem.title = meet?.location
        meetJoinName.text = meet?.name
        meetJoinDate.text = meet?.date
        meetJoinCreator.text = meet?.creator
        if let imageName = meet?.imgName {
            meetJoinImage.image = UIImage(named: imageName)
            // Do any additional setup after loading the view.
        } else if let imageURL = meet?.imgURL{
            let session = URLSession(configuration: .default)
            if let url = URL(string: imageURL){
                let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                    if let data = data{
                        DispatchQueue.main.async {
                            self.meetJoinImage.image = UIImage(data: data)
                        }
                        
                        
                    }
                })
                task.resume()
            }
        }
        // Do any additional setup after loading the view.
        //this line calls the function to close keyboard on tap
        self.hideKeyboardWhenTappedAround()
    }
    
    //this function will check if the password matched on join btn press
    @IBAction func onJoin(_ sender: Any) {
        //conditional to check if the password matches up and then triggers the segue
        if passwordField.text == meet?.password{
            performSegue(withIdentifier: "selectJudge", sender: nil)
        }else{
            //display the wrong password text
            wrongPasswordText.isHidden = false
            //make the wrong password text dissapear after 2 secs
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.wrongPasswordText.isHidden = true
            }
        }
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//this extension will make the keyboard dissapear on touch and alert message
extension UIViewController {
    
    //this function hides the keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //this is the alert message function
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Leave", style: .default, handler: {action in
           //write function to go back to home page and delete data thats not needed
            self.navigationController?.popToRootViewController(animated: true)
            
        })
        let CancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(OKAction)
        alertController.addAction(CancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //checks if string is url or not
    func verifyUrl(urlString: String?) -> Bool {
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
                return false
        }
        
        return UIApplication.shared.canOpenURL(url)
    }
}
