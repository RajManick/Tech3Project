//
//  CITreeViewCell.swift
//  CITreeView
//
//  Created by Apple on 24.01.2018.
//  Copyright © 2018 Cenk Işık. All rights reserved.
//

import UIKit

class CITreeViewCell: UITableViewCell {
    
    @IBOutlet weak var dropDownImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var bgView: UIView!{
        didSet{
            bgView.layer.cornerRadius = 5.0
            bgView.clipsToBounds = true
        }
    }
    
    let leadingValueForChildrenCell:CGFloat = 30
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var viewModel : ExpandViewModel! {
        didSet{
            self.bgView.layer.cornerRadius = self.bgView.frame.size.height / 2
            self.nameLabel.text = viewModel.name
            self.bgView.backgroundColor = viewModel.viewBGColor
            self.dropDownImgView.image = UIImage.init(named: viewModel.arrowDirectionImgName!)
            self.layoutIfNeeded()
        }
    }
    
    func getRandomColor() -> UIColor{
        
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
