//
//  JudgeViewController.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/16/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class JudgeViewController: UIViewController {

    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var judgePositionText: UILabel!
    
    //this will be used for determining position
    var judge: Judge?
    //possibly use this to derive title and maybe some way to connect other judges
    var meet : Meet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adds nav bar heading
        //self.navigationItem.title = meet?.location
        self.navigationItem.hidesBackButton = true;
        //gives the position text
        if judge?.position == Judge.Position.Left{
            judgePositionText.text = "L"
        }else if judge?.position == Judge.Position.Head{
            judgePositionText.text = "H"
        }else{
            judgePositionText.text = "R"
        }
        
        self.navigationItem.title = "Judge Mode"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    //calls the leave fucntion
    @IBAction func leaveSession(_ sender: UIBarButtonItem) {
        alert(message: "Do you want to leave", title: "Leave Meet")
    }
    //changes the images these functions will need to do more in the future
    @IBAction func gooLift(_ sender: UIButton) {
        if judge?.position == Judge.Position.Left{
            leftImage.image = UIImage(named: "goodLift")
        }else if judge?.position == Judge.Position.Head{
            headImage.image = UIImage(named: "goodLift")
        }else{
            rightImage.image = UIImage(named: "goodLift")
        }
    }
    
    @IBAction func badLift(_ sender: UIButton) {
        if judge?.position == Judge.Position.Left{
            leftImage.image = UIImage(named: "badLift")
        }else if judge?.position == Judge.Position.Head{
            headImage.image = UIImage(named: "badLift")
        }else{
            rightImage.image = UIImage(named: "badLift")
        }
    }
    
    @IBAction func resetJudging(_ sender: UIButton) {
        leftImage.image = UIImage(named: "nuetralLift")
        headImage.image = UIImage(named: "nuetralLift")
        rightImage.image = UIImage(named:"nuetralLift")
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
