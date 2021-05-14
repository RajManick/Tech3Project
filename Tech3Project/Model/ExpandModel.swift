//
//  ExpandModel.swift
//  Tech3Project
//
//  Created by manickam thangaraj on 13/05/21.
//

import Foundation

class ExpandModel {
    let name : String
    var children : [ExpandModel]
    
    init(name : String, children: [ExpandModel]) {
        self.name = name
        self.children = children
    }
    
    convenience init(name : String) {
        self.init(name: name, children: [ExpandModel]())
    }
    
    func addChild(_ child : ExpandModel) {
        self.children.append(child)
    }
    
    func removeChild(_ child : ExpandModel) {
        self.children = self.children.filter( {$0 !== child})
    }
}
extension ExpandModel {
    
    static func getDefaultExpandData() -> [ExpandModel] {
        
        let subChild121 = ExpandModel(name: "T.Nagar")
        let subChild122 = ExpandModel(name: "Ranganathan Street")
        let subChild123 = ExpandModel(name: "Velacheri")
        let subChild124 = ExpandModel(name: "Tharamani")
        
        let child11 = ExpandModel(name: "Chennai", children:[subChild121, subChild122, subChild123, subChild124])
        let child12 = ExpandModel(name: "Madhurai")
        let child13 = ExpandModel(name: "Coimbatore")
        let child14 = ExpandModel(name: "ERODE")
        
        let parent1 = ExpandModel(name: "Tamil Nadu", children: [child11, child12, child13, child14])
        
        let subChild221 = ExpandModel(name: "Cheri Beach")
        let subChild222 = ExpandModel(name: "Mattancherry Palace")
        let subChild223 = ExpandModel(name: "Hill Place Musuem")
        let subChild224 = ExpandModel(name: "Willigdon Island")
        
        let child21 = ExpandModel(name: "Kochi" , children: [subChild221,subChild222,subChild223,subChild224])
        let child22 = ExpandModel(name: "Ernakulam")
        
        let parent2 = ExpandModel(name: "Kerla", children: [child21, child22])
        
        
        let child31 = ExpandModel(name: "Bangalore")
        let child32 = ExpandModel(name: "Mysore")
        let child33 = ExpandModel(name: "Gulbarga")
        
        let parent3 = ExpandModel(name: "Karnataka", children: [child31, child32,child33])
        
        
        let child41 = ExpandModel(name: "Golconda Fort")
        let child42 = ExpandModel(name: "Charminar")
        
        let subChildChild5321 = ExpandModel(name: "HyderaBad", children: [child41, child42])
        let subChildChild5322 = ExpandModel(name: "VisakahPatanm")
        let subChildChild5323 = ExpandModel(name: "Amaravathi")
        let subChildChild5324 = ExpandModel(name: "Kurnool")
        
        let parent4 = ExpandModel(name: "Andhra",children:[subChildChild5321,subChildChild5322,subChildChild5323,subChildChild5324])
        
        
        return [parent1,parent2,parent3,parent4]
    }
    
    
}
