//
//  ViewController.swift
//  ActiveLabelDemo
//
//  Created by Johannes Schickling on 9/4/15.
//  Copyright © 2015 Optonaut. All rights reserved.
//

import UIKit
import ActiveLabel

class ViewController: UIViewController {
    
    let label = ActiveLabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        let customType = ActiveType.Custom(pattern: "\\sare\\b") //Looks for "are"
        let customType2 = ActiveType.Custom(pattern: "\\sit\\b") //Looks for "it"

        label.enabledTypes.append(customType)
        label.enabledTypes.append(customType2)
        label.enabledTypes.append(ActiveType.Mail)

        label.urlMaximumLength = 31

        label.customize { label in
            label.text = "https://google.com https://google.com https://google.com"

            label.numberOfLines = 0
            label.lineSpacing = 4
            
            label.textColor = UIColor(red: 102.0/255, green: 117.0/255, blue: 127.0/255, alpha: 1)
            label.hashtagColor = UIColor(red: 85.0/255, green: 172.0/255, blue: 238.0/255, alpha: 1)
            label.mentionColor = UIColor(red: 238.0/255, green: 85.0/255, blue: 96.0/255, alpha: 1)
            label.URLColor = UIColor(red: 85.0/255, green: 238.0/255, blue: 151.0/255, alpha: 1)
            label.URLSelectedColor = UIColor(red: 82.0/255, green: 190.0/255, blue: 41.0/255, alpha: 1)
            label.mailColor = UIColor(red: 200.0/255, green: 50.0/255, blue: 60/255, alpha: 1)
            label.mailSelectedColor = UIColor(red: 200.0/255, green: 50.0/255, blue: 60/255, alpha: 0.75)


            label.handleMentionTap { self.alert("Mention", message: $0) }
            label.handleHashtagTap { self.alert("Hashtag", message: $0) }
            label.handleURLTap { self.alert("URL", message: $0.absoluteString!) }
            label.handleMailTap { self.alert("Mail", message: $0) }

            //Custom types
            label.customColor[customType] = UIColor.purpleColor()
            label.customSelectedColor[customType] = UIColor.greenColor()
            label.customColor[customType2] = UIColor.magentaColor()
            label.customSelectedColor[customType2] = UIColor.greenColor()

            label.handleCustomTap(for: customType) { self.alert("Custom type", message: $0) }
            label.handleCustomTap(for: customType2) { self.alert("Custom type", message: $0) }
        }

        label.frame = CGRect(x: 20, y: 40, width: view.frame.width - 40, height: 300)
        view.addSubview(label)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert(title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
        presentViewController(vc, animated: true, completion: nil)
    }

}

