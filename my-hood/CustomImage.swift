//
//  CustomImage.swift
//  my-hood
//
//  Created by Ziga Strgar on 08/07/16.
//  Copyright © 2016 Ziga Strgar. All rights reserved.
//

import UIKit

class CustomImage: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }

}
