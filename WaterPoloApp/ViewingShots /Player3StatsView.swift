//
//  Player3StatsView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/31/21.
//

import SwiftUI

struct Player3StatsView: View {
    
    var team: String
    var num: Int
    var criteria1: KeyValue
    var criteria2: KeyValue
    var criteria3: KeyValue
    var shotSelection: [Shot]
    @State var phase: Int
        
    var title1: String {
        if(criteria1.key == "Type" && criteria1.value == 1)
        {
            return "Direct"
        }
        if(criteria1.key == "Type" && criteria1.value == 2)
        {
            return "Catch & Shoot"
        }
        if(criteria1.key == "Type" && criteria1.value == 3)
        {
            return "Fake"
        }
        if(criteria1.key == "Type" && criteria1.value == 4)
        {
            return "Drive"
        }
        if(criteria1.key == "Type" && criteria1.value == 5)
        {
            return "Pick Up"
        }
        if(criteria1.key == "Type" && criteria1.value == 6)
        {
            return "Backhand"
        }
        if(criteria1.key == "Type" && criteria1.value == 7)
        {
            return "Quick 6v5"
        }
        if(criteria1.key == "Type" && criteria1.value == 8)
        {
            return "Overpass"
        }
        if(criteria1.key == "Type" && criteria1.value == 9)
        {
            return "Skip"
        }
        if(criteria1.key == "Type" && criteria1.value == 10)
        {
            return "Lob"
        }
        if(criteria1.key == "Type" && criteria1.value == 11)
        {
            return "Transition"
        }
        return String(criteria1.value)
    }
    var title2: String {
        if(criteria2.key == "Type" && criteria2.value == 1)
        {
            return "Direct"
        }
        if(criteria2.key == "Type" && criteria2.value == 2)
        {
            return "Catch & Shoot"
        }
        if(criteria2.key == "Type" && criteria2.value == 3)
        {
            return "Fake"
        }
        if(criteria2.key == "Type" && criteria2.value == 4)
        {
            return "Drive"
        }
        if(criteria2.key == "Type" && criteria2.value == 5)
        {
            return "Pick Up"
        }
        if(criteria2.key == "Type" && criteria2.value == 6)
        {
            return "Backhand"
        }
        if(criteria2.key == "Type" && criteria2.value == 7)
        {
            return "Quick 6v5"
        }
        if(criteria2.key == "Type" && criteria2.value == 8)
        {
            return "Overpass"
        }
        if(criteria2.key == "Type" && criteria2.value == 9)
        {
            return "Skip"
        }
        if(criteria2.key == "Type" && criteria2.value == 10)
        {
            return "Lob"
        }
        if(criteria2.key == "Type" && criteria2.value == 11)
        {
            return "Transition"
        }
        return String(criteria2.value)
    }
    var title3: String {
        if(criteria3.key == "Type" && criteria3.value == 1)
        {
            return "Direct"
        }
        if(criteria3.key == "Type" && criteria3.value == 2)
        {
            return "Catch & Shoot"
        }
        if(criteria3.key == "Type" && criteria3.value == 3)
        {
            return "Fake"
        }
        if(criteria3.key == "Type" && criteria3.value == 4)
        {
            return "Drive"
        }
        if(criteria3.key == "Type" && criteria3.value == 5)
        {
            return "Pick Up"
        }
        if(criteria3.key == "Type" && criteria3.value == 6)
        {
            return "Backhand"
        }
        if(criteria3.key == "Type" && criteria3.value == 7)
        {
            return "Quick 6v5"
        }
        if(criteria3.key == "Type" && criteria3.value == 8)
        {
            return "Overpass"
        }
        if(criteria3.key == "Type" && criteria3.value == 9)
        {
            return "Skip"
        }
        if(criteria3.key == "Type" && criteria3.value == 10)
        {
            return "Lob"
        }
        if(criteria3.key == "Type" && criteria3.value == 11)
        {
            return "Transition"
        }
        return String(criteria3.value)
    }
    
    var totalTitle: String {
        let first = criteria1.key+": "+title1
        let second = criteria2.key+": "+title2
        let third = criteria3.key+": "+title3
        
        return first+" | "+second+" | "+third
    }
    
var body: some View {
        
GeometryReader { geometry in
    ScrollView {
        PlayerResultsTable(team: team, num: num, criteria1: criteria1, criteria2: criteria2, criteria3: criteria3, phase: phase)
    }.navigationBarTitle(totalTitle, displayMode: .inline)
//vstack
}//geometry
}//body
    
}//struct
