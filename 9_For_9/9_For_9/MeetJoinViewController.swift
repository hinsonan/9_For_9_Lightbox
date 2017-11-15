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
