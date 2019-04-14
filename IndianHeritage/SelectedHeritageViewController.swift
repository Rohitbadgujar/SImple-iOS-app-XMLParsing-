//
//  SelectedHeritageViewController.swift
//  IndianHeritage
//
//  Created by Rohit on 12/17/1397 AP.
//  Copyright © 1397 Rohit. All rights reserved.
//

import UIKit
import WebKit
class SelectedHeritageViewController: UIViewController ,WKNavigationDelegate	{
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBAction func moreInformationButton(_ sender: Any) {
    }
    @IBOutlet weak var imageView1: UIImageView!
    // @IBOutlet weak var mywebView: UIWebView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var selectedHeritageLabel: UILabel!
    @IBOutlet weak var mywebView: UIWebView!
    var heritageData : HeritageDetails!
    override func viewDidLoad() {
       
       
        super.viewDidLoad()
        self.title = "Indian Heritage Information"
         selectedHeritageLabel.text = heritageData.getName()
selectedImageView.image = UIImage(named: heritageData.getImage())
        imageView1.image = UIImage(named: "Images/tajmahal1.jpg")
        imageView2.image = UIImage(named: "Images/suntemple3.jpg")
        imageView3.image = UIImage(named: "Images/redfort4.jpg")
        let bgImg = UIImageView(frame: UIScreen.main.bounds);
        bgImg.image = UIImage(named: heritageData.getImage());
        //sbgImg.contentMode = UIView.ContentMode.scaleToFill;
        bgImg.alpha = 0.2;
        self.view.insertSubview(bgImg, at: 0);
        getVideo(videoCode: "be1xfHR-euI")

        // Do any additional setup after loading the view.
    }
    
    func getVideo(videoCode:String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        mywebView.loadRequest(URLRequest(url: url!))
    }

    override func prepare(for seguee: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let destination = seguee.destination as! MoreInformationViewController //typecasting because segue.destination returns UIViewController
        // Pass the selected object to the new view controller.
        
        destination.heritageData = self.heritageData
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
