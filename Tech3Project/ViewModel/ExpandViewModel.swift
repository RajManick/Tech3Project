//
//  ExpandViewModelClass.swift
//  Tech3Project
//
//  Created by manickam thangaraj on 13/05/21.
//

import Foundation
import UIKit

struct ExpandViewModel {
     var level: Int? = 0
     var name: String? = ""
     var viewBGColor : UIColor? = .clear
     var arrowDirectionImgName : String?
    
    init(expandData : ExpandModel, ViewNode : CITreeViewNode, selectedIndex : [Int], index : Int) {
        
        name = expandData.name
        level = ViewNode.level
        
        let model : ExpandModel = ViewNode.item as! ExpandModel
        if model.children.count != 0 {
        if selectedIndex.contains(index)  {
            arrowDirectionImgName = "down_arrow"
        }else{
            arrowDirectionImgName = "right_arrow"
        }}
        else{
            arrowDirectionImgName = ""
        }
        switch level {
        case 0:
            viewBGColor = UIColor.orange
        case 1:
            viewBGColor = UIColor.green
        case 2:
            viewBGColor = UIColor.blue
        default:
            viewBGColor = UIColor.black
        }
    }
    
}
