//
//  PostCell.swift
//  my-hood
//
//  Created by Ziga Strgar on 08/07/16.
//  Copyright © 2016 Ziga Strgar. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(post: Post) {
        titleLbl.text = post.title
        contentLbl.text = post.content
        img.image = DataService.instance.imageForPath(post.imagePath)
    }

}
