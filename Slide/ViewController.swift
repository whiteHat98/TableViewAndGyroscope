//
//  ViewController.swift
//  Slide
//
//  Created by Randy Noel on 13/06/19.
//  Copyright © 2019 whiteHat. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var contacts = [ContactModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadContact()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? ContactTableViewCell else{
            fatalError("error")
        }
        
        let contact = contacts[indexPath.row]
        
        cell.imageProfile.image = contact.imageProfile
        cell.lblName.text = contact.name
        cell.lblNumber.text = contact.num
        
        tableView.rowHeight = 100
        print("test")
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    
    func loadContact(){
        
        let image: UIImage = #imageLiteral(resourceName: "Image")
        
        let contact = ContactModel(conImageProfile: image, conName: "Randy", conNum: "098765421")
        
        contacts.append(contact)
        
    }

}

