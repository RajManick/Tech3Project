//
//  ViewController.swift
//  Tech3Project
//
//  Created by manickam thangaraj on 13/05/21.
//

import UIKit

let keyIndent = "level"
let keyChildren = "Objects"

class ExpandViewController: UIViewController {
    
    var data : [ExpandModel] = []
    var SelectedIndex : [Int] = []
    
    @IBOutlet weak var sampleTreeView: CITreeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupModel()
        LoadModel()
    }
    
    func setupUI()  {
        sampleTreeView.collapseNoneSelectedRows = false
        sampleTreeView.register(UINib(nibName: "CITreeViewCell", bundle: nil), forCellReuseIdentifier: "CITreeViewCell")
    }
    
    func setupModel()  {
        data = ExpandModel.getDefaultExpandData()
    }
    
    func LoadModel() {
        self.sampleTreeView.reloadData()
    }
    
}

extension ExpandViewController : CITreeViewDelegate {
    func treeViewNode(_ treeViewNode: CITreeViewNode, willExpandAt indexPath: IndexPath) {
    }
    
    func treeViewNode(_ treeViewNode: CITreeViewNode, didExpandAt indexPath: IndexPath) {
        
    }
    
    func treeViewNode(_ treeViewNode: CITreeViewNode, willCollapseAt indexPath: IndexPath) {
        
    }
    
    func treeViewNode(_ treeViewNode: CITreeViewNode, didCollapseAt indexPath: IndexPath) {
        
    }
    
    func willExpandTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    func didExpandTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    func willCollapseTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    func didCollapseTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    func treeView(_ treeView: CITreeView, heightForRowAt indexPath: IndexPath, with treeViewNode: CITreeViewNode) -> CGFloat {
        return 60
    }
    
    func treeView(_ treeView: CITreeView, didSelectRowAt treeViewNode: CITreeViewNode, at indexPath: IndexPath) {
        let model : ExpandModel = treeViewNode.item as! ExpandModel
        if model.children.count != 0{
        if SelectedIndex.contains(indexPath.row) {
            SelectedIndex.removeAll(where: {$0 == indexPath.row})
        }else{
            SelectedIndex.append(indexPath.row)
        }
        self.sampleTreeView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .none)
        }
    }
    
    func treeView(_ treeView: CITreeView, didDeselectRowAt treeViewNode: CITreeViewNode, at indexPath: IndexPath) {
        if let parentNode = treeViewNode.parentNode{
            print(parentNode.item)
        }
    }
}

extension ExpandViewController : CITreeViewDataSource {
    func treeViewSelectedNodeChildren(for treeViewNodeItem: Any) -> [Any] {
        if let dataObj = treeViewNodeItem as? ExpandModel {
                    return dataObj.children
                }
                return []
    }
    
    func treeViewDataArray() -> [Any] {
        return data
    }
    
    func treeViewSelectedNodeChildren(for treeViewNodeItem: AnyObject) -> [AnyObject] {
        if let dataObj = treeViewNodeItem as? ExpandModel {
            return dataObj.children
        }
        return []
    }
    
    func treeViewDataArray() -> [AnyObject] {
        return data
    }
    
    func treeView(_ treeView: CITreeView, cellForRowAt indexPath: IndexPath, with treeViewNode: CITreeViewNode) -> UITableViewCell {
        let cell = treeView.dequeueReusableCell(withIdentifier: "CITreeViewCell") as! CITreeViewCell
        cell.viewModel = ExpandViewModel(expandData: treeViewNode.item as! ExpandModel, ViewNode: treeViewNode,selectedIndex: SelectedIndex,index : indexPath.row)
        return cell;
    }

}
