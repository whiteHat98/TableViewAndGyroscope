//
//  ContactModel.swift
//  Slide
//
//  Created by Randy Noel on 13/06/19.
//  Copyright © 2019 whiteHat. All rights reserved.
//
import UIKit
import Foundation

class ContactModel{
    
    var imageProfile : UIImage? = nil
    var name : String? = nil
    var num : String? = nil
    
    init(conImageProfile: UIImage?,conName: String?, conNum: String?) {
        self.imageProfile = conImageProfile ?? UIImage(named: "")
        self.name = conName ?? ""
        self.num = conNum ?? ""

    }
    
}
