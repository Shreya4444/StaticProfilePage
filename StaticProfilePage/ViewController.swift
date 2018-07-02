//
//  ViewController.swift
//  StaticProfilePage
//
//  Created by Shreya Jain on 6/26/18.
//  Copyright © 2018 example. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

let winnings=["INSTANT REWARDS","ORDER HISTORY","FREE TOKENS"]
let invite=["INVITE","SHARE","ENTER CODE"]
let account=["NOTIFICATIONS","HELP","SETTINGS","LOGOUT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Profile Picture
        let image:UIImage=UIImage(named: "profilepic.jpg")!
        let imageView=UIImageView(image: image)
        self.view.addSubview(imageView)
        imageView.frame = CGRect(x:0,y:0,width:120,height:150)
        imageView.center.x=self.view.center.x
        imageView.frame.origin.y=50
        
        //Label for Name
        let label_name:UILabel=UILabel(frame: CGRect(x:0,y:0,width:50,height:25))
        label_name.font = UIFont(name:"Oswald-Light", size: 20)
        label_name.text="NAME"
        self.view.addSubview(label_name)
        label_name.center.x=self.view.center.x
        label_name.frame.origin.y=imageView.frame.origin.y+160
 
        //Add space between characters
        let attributedString = NSMutableAttributedString(string: label_name.text!)
        attributedString.addAttribute(NSAttributedStringKey.kern, value: 1.0, range: NSMakeRange(0, 4))
        label_name.attributedText = attributedString
        
        
        //Line between Name & Coins
        let linehorizontal:UIView=UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 1))
        linehorizontal.backgroundColor=UIColor.black
        linehorizontal.center.x=self.view.center.x
        linehorizontal.frame.origin.y=label_name.frame.origin.y+30
        self.view.addSubview(linehorizontal)
        
        
        //Label for Coins
        let label_coins:UILabel=UILabel(frame: CGRect(x:0,y:0,width:70,height:25))
        label_coins.text="438,000"
        label_coins.textColor=UIColor(red: 154/255, green: 205/255, blue: 50/255, alpha: 1.0)
        label_coins.font = UIFont(name:"Oswald-Light", size: 18.0)
        self.view.addSubview(label_coins)
        label_coins.center.x=self.view.center.x
        label_coins.frame.origin.y=label_name.frame.origin.y+50
        
        //Calculate height
        let h_val=self.view.frame.height
        let hforTableView=h_val-label_coins.frame.origin.y
        
        //Table View
        let tableView:UITableView=UITableView()
        tableView.frame=CGRect(x:0,y:Int(label_coins.frame.origin.y+30),width:Int(self.view.frame.width),height:Int(hforTableView))
        tableView.dataSource=self
        tableView.delegate=self
        self.view.addSubview(tableView)
        
       //To know all the fonts
     /*   for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    */
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("You clicked \(indexPath.row) in section \(indexPath.section) ")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return winnings.count
        case 1:
            return invite.count
        case 2:
            return account.count
        default:
            return 0
        }
    }
    
  /*  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview=UIView()
        /*headerview.backgroundColor = UIColor.white
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: "Oswald-Light", size: 12)
        headerLabel.textColor = UIColor.black
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerview.addSubview(headerLabel)
 */
        return headerview
    }
 */
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "WINNINGS"
        case 1:
            return "SOCIAL"
            
        case 2:
            return "GENERAL"
        
        default:
            return nil
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell=UITableViewCell()
        cell.textLabel?.font=UIFont(name: "Oswald-Light", size: 12)
            
        cell.accessoryType = .disclosureIndicator;
        switch indexPath.section{
        case 0:
            cell.textLabel?.text=winnings[indexPath.row]
        case 1:
            cell.textLabel?.text=invite[indexPath.row]
        case 2:
            cell.textLabel?.text=account[indexPath.row]
        default:
            cell.textLabel?.text="Default"
            
        }
        let attributedString1 = NSMutableAttributedString(string: (cell.textLabel?.text!)!)
        attributedString1.addAttribute(NSAttributedStringKey.kern, value: 1.0, range: NSMakeRange(0, 2))
        cell.textLabel?.attributedText=attributedString1
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

