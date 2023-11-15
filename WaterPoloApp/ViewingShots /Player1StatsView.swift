//
//  Player1StatsView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/29/21.
//

import SwiftUI

struct Player1StatsView: View {
    
    var team: String
    var num: Int
    var criteria1: KeyValue
    var shotSelection: [Shot]
    @State var phase: Int
    
    @State private var criteria2 = "None"
    
    @State private var one = [Shot]()
    @State private var two = [Shot]()
    @State private var three = [Shot]()
    @State private var four = [Shot]()
    @State private var five = [Shot]()
    @State private var six = [Shot]()
    
    
    @State private var oneUP = [Shot]()
    @State private var twoUP = [Shot]()
    @State private var threeUP = [Shot]()
    @State private var fourUP = [Shot]()
    @State private var fiveUP = [Shot]()
    @State private var sixUP = [Shot]()
    
    
    @State private var direct = [Shot]()
    @State private var cas = [Shot]()
    @State private var fake = [Shot]()
    @State private var drive = [Shot]()
    @State private var pickup = [Shot]()
    @State private var backhand = [Shot]()
    @State private var quick6v5 = [Shot]()
    @State private var overpass = [Shot]()
    @State private var skip = [Shot]()
    @State private var lob = [Shot]()
    @State private var transition = [Shot]()
    
    
    @State private var oneLoc = [Shot]()
    @State private var twoLoc = [Shot]()
    @State private var threeLoc = [Shot]()
    @State private var fourLoc = [Shot]()
    @State private var fiveLoc = [Shot]()
    
    var title: String {
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
    
    var totalTitle: String {
        return criteria1.key+": "+title
    }
    
var body: some View {
        
GeometryReader { geometry in
VStack {
    Form {
        
        if(criteria1.key == "Position") {
        Picker(selection: $criteria2, label: Text("Sort By"), content: {
            Text("None").tag("None")
            Text("Type").tag("Type")
            Text("Location").tag("Location")
        })
        }
        
        else if(criteria1.key == "Type") {
            Picker(selection: $criteria2, label: Text("Sort By"), content: {
                Text("None").tag("None")
                Text("Position").tag("Position")
                Text("Location").tag("Location")
            })
        }
        
        else {
            Picker(selection: $criteria2, label: Text("Sort By"), content: {
                Text("None").tag("None")
                Text("Position").tag("Position")
                Text("Type").tag("Type")
            })
        }
        
        if(criteria2 == "Position") {
            Picker(selection: $phase, label: Text("Select Phase of Game"), content: {
                Text("6v6").tag(1)
                Text("6v5").tag(2)
            }).pickerStyle(SegmentedPickerStyle())
        }
            
        Button {
            loadData()
        } label: {
            Text("Load Data")
        }

    }.frame(width: geometry.size.width, height: geometry.size.height/4, alignment: .center)
    
    ScrollView {
    if(criteria2 == "Position" && phase == 1) {
    VStack(spacing: 10) {
                
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 1), shotSelection: one, phase: 1),
            label: {
                PositionStatView(num: 1, shotsTaken: one.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 2), shotSelection: two, phase: 1),
            label: {
                PositionStatView(num: 2, shotsTaken: two.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 3), shotSelection: three, phase: 1),
            label: {
                PositionStatView(num: 3, shotsTaken: three.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 4), shotSelection: four, phase: 1),
            label: {
                PositionStatView(num: 4, shotsTaken: four.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 5), shotSelection: five, phase: 1),
            label: {
                PositionStatView(num: 5, shotsTaken: five.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 6), shotSelection: six, phase: 1),
            label: {
                PositionStatView(num: 6, shotsTaken: six.count)
            })
    }//criteria vstack
    }//if criteria1
    else if(criteria2 == "Position" && phase == 2)
    {
    VStack(spacing: 10) {
                    
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 1), shotSelection: oneUP, phase: 2),
            label: {
                PositionStatView(num: 1, shotsTaken: oneUP.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 2), shotSelection: twoUP, phase: 2),
            label: {
                PositionStatView(num: 2, shotsTaken: twoUP.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 3), shotSelection: threeUP, phase: 2),
            label: {
                PositionStatView(num: 3, shotsTaken: threeUP.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 4), shotSelection: fourUP, phase: 2),
            label: {
                PositionStatView(num: 4, shotsTaken: fourUP.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 5), shotSelection: fiveUP, phase: 2),
            label: {
                PositionStatView(num: 5, shotsTaken: fiveUP.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 6), shotSelection: sixUP, phase: 2),
            label: {
                PositionStatView(num: 6, shotsTaken: sixUP.count)
            })
    }//criteria vstack
    }//else phase 2
        
    else if(criteria2 == "Type") {
    VStack(spacing: 10) {
        
        Group {
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 1), shotSelection: direct, phase: 1),
            label: {
                TypeStatView(num: 1, shotsTaken: direct.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 2), shotSelection: cas, phase: 1),
            label: {
                TypeStatView(num: 2, shotsTaken: cas.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 3), shotSelection: fake, phase: 1),
            label: {
                TypeStatView(num: 3, shotsTaken: fake.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 4), shotSelection: drive, phase: 1),
            label: {
                TypeStatView(num: 4, shotsTaken: drive.count)
            })
        }
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 5), shotSelection: pickup, phase: 1),
            label: {
                TypeStatView(num: 5, shotsTaken: pickup.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 6), shotSelection: backhand, phase: 1),
            label: {
                TypeStatView(num: 6, shotsTaken: backhand.count)
            })
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 7), shotSelection: quick6v5, phase: 1),
            label: {
                TypeStatView(num: 7, shotsTaken: quick6v5.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 8), shotSelection: overpass, phase: 1),
            label: {
                TypeStatView(num: 8, shotsTaken: overpass.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 9), shotSelection: skip, phase: 1),
            label: {
                TypeStatView(num: 9, shotsTaken: skip.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 10), shotSelection: lob, phase: 1),
            label: {
                TypeStatView(num: 10, shotsTaken: lob.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 11), shotSelection: transition, phase: 1),
            label: {
                TypeStatView(num: 11, shotsTaken: transition.count)
            })
    }//criteria vstack
    }//if criteria1
    if(criteria2 == "Location") {
    VStack(spacing: 10) {
                    
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 1), shotSelection: oneLoc, phase: 1),
            label: {
                LocationStatView(num: 1, shotsTaken: oneLoc.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 2), shotSelection: twoLoc, phase: 1),
            label: {
                LocationStatView(num: 2, shotsTaken: twoLoc.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 3), shotSelection: threeLoc, phase: 1),
            label: {
                LocationStatView(num: 3, shotsTaken: threeLoc.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 4), shotSelection: fourLoc, phase: 1),
            label: {
                LocationStatView(num: 4, shotsTaken: fourLoc.count)
            })
        
        NavigationLink(
            destination: Player2StatsView(team: team, num: num, criteria1: criteria1, criteria2: KeyValue(key: criteria2, value: 5), shotSelection: fiveLoc, phase: 1),
            label: {
                LocationStatView(num: 5, shotsTaken: fiveLoc.count)
            })
    }//criteria vstack
    }//if criteria2
        PlayerResultsTable(team: team, num: num, criteria1: criteria1, criteria2: nil, criteria3: nil, phase: phase)
    }//scrollview*/
        
}.navigationBarTitle(criteria1.key+": "+title)
//vstack
}//geometry
}//body
    
func loadData() -> Void {
    
    if(criteria2 == "Position" && phase == 1)
    {
        for shot in shotSelection
        {
            if(shot.source == 1 && shot.phase == 1 && !self.one.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { one.append(shot) }
            if(shot.source == 2 && shot.phase == 1 && !self.two.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { two.append(shot) }
            if(shot.source == 3 && shot.phase == 1 && !self.three.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { three.append(shot) }
            if(shot.source == 4 && shot.phase == 1 && !self.four.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { four.append(shot) }
            if(shot.source == 5 && shot.phase == 1 && !self.five.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { five.append(shot) }
            if(shot.source == 6 && shot.phase == 1 && !self.six.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { six.append(shot) }
        }
    }//if end
    else if(criteria2 == "Position" && phase == 2)
    {
        for shot in shotSelection
        {
            if(shot.source == 1 && shot.phase == 2 && !self.oneUP.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { oneUP.append(shot) }
            if(shot.source == 2 && shot.phase == 2 && !self.twoUP.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { twoUP.append(shot) }
            if(shot.source == 3 && shot.phase == 2 && !self.threeUP.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { threeUP.append(shot) }
            if(shot.source == 4 && shot.phase == 2 && !self.fourUP.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { fourUP.append(shot) }
            if(shot.source == 5 && shot.phase == 2 && !self.fiveUP.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { fiveUP.append(shot) }
            if(shot.source == 6 && shot.phase == 2 && !self.sixUP.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { sixUP.append(shot) }
        }
    }//else if end
    else if(criteria2 == "Type")
    {
        for shot in shotSelection
        {
            if(shot.type.contains(1) && !self.direct.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { direct.append(shot) }
            if(shot.type.contains(2) && !self.cas.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { cas.append(shot) }
            if(shot.type.contains(3) && !self.fake.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { fake.append(shot) }
            if(shot.type.contains(4) && !self.drive.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { drive.append(shot) }
            if(shot.type.contains(5) && !self.pickup.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { pickup.append(shot) }
            if(shot.type.contains(6) && !self.backhand.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { backhand.append(shot) }
            if(shot.type.contains(7) && !self.quick6v5.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { quick6v5.append(shot) }
            if(shot.type.contains(8) && !self.overpass.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { overpass.append(shot) }
            if(shot.type.contains(9) && !self.skip.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { skip.append(shot) }
            if(shot.type.contains(10) && !self.lob.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { lob.append(shot) }
            if(shot.type.contains(11) && !self.transition.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { transition.append(shot) }
        }
    }//else if end
    else if(criteria2 == "Location")
    {
        for shot in shotSelection
        {
            if(shot.location == 1 && !self.oneLoc.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { oneLoc.append(shot) }
            if(shot.location == 2 && !self.twoLoc.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { twoLoc.append(shot) }
            if(shot.location == 3 && !self.threeLoc.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { threeLoc.append(shot) }
            if(shot.location == 4 && !self.fourLoc.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { fourLoc.append(shot) }
            if(shot.location == 5 && !self.fiveLoc.contains(where: { temp in
                if(shot.equals(temp: temp)) { return true }
                return false }))
            { fiveLoc.append(shot) }
        }
    }//else if end
}//func end
    
}//struct
