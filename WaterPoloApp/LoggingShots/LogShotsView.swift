//
//  LogShotsView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/13/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct LogShotsView: View {
    
    @State private var teamname = ""
    @State private var strCapNum = ""
    @State private var shotType = [Int]()
    @State private var shotResult = 0
    @State private var phase = 0
    @State private var isActive = false
    @State private var backButton = false
    @State private var errorMes = ""
    
    @State private var shotTypeListArr: [String] = [ "Direct", "Catch & Shoot", "Fake", "Drive", "Pick Up", "Backhand", "Quick 6v5", "Over Pass", "Skip", "Lob", "Transition" ]
    @State private var selections: [String] = [];
    
    var body: some View {

Group {
VStack {
    Form {
        Section(header: Text("Team/Player")) {
            TextField("Cap Number", text: $strCapNum).keyboardType(.numbersAndPunctuation)
            Picker(selection: $teamname, label: Text("Select Team"), content: {
                Text("Harvard Westlake").tag("Harvard Westlake")
                Text("Mater Dei").tag("Mater Dei")
                Text("Huntington Beach").tag("Huntington Beach")
                Text("Loyola").tag("Loyola")
                Text("Newport").tag("Newport")
                Text("JSerra").tag("JSerra")
                Text("Oaks Christian").tag("Oaks Christian")
            })
        }
        
        Section(header: Text("Shot Attributes")) {
            List {
                ForEach(self.shotTypeListArr, id: \.self) { type in
                    MultipleSelectionRow(title: type, isSelected: self.selections.contains(type)) {
                        if self.selections.contains(type) {
                            self.selections.removeAll(where: { $0 == type })
                        }
                        else {
                            self.selections.append(type)
                        }
                    }
                }
            }
            
            Picker(selection: $shotResult, label: Text("Select Shot Result"), content: {
                Text("Goal").tag(1)
                Text("Field Block").tag(2)
                Text("Miss Goal").tag(3)
                Text("Tip Out").tag(4)
                Text("Goalie Block").tag(5)
                Text("Beat Field Blocker").tag(6)
            })
        }
        
        Section(header: Text("Phase of Game")) {
            Picker(selection: $phase, label: Text("Select Phase of Game"), content: {
                Text("6v6").tag(1)
                Text("6v5").tag(2)
            }).pickerStyle(SegmentedPickerStyle())
        }
        
        Button(action: {
            
        for item in selections {
            shotType.append(shotTypeListArr.firstIndex(of: item)!+1)
        }
        if(self.validateFields() == nil)
        {
            self.isActive = true
        }
        else{
            errorMes = self.validateFields()!
        }
            
        }, label: {
            Text("Next")
        })
    }
    
    Text(errorMes).foregroundColor(.red).offset(y: 0)
    
    NavigationLink(destination: GoalView(teamname: self.teamname, strCapNum: self.strCapNum, shotType: self.shotType, shotResult: self.shotResult, phase: self.phase)
        .navigationBarTitle("")
        .navigationBarHidden(true), isActive: $isActive) {
        Text("")}
    
}//vstack end
    
}.navigationTitle("Shot Form")
    //group end
}//body end
    
    func validateFields() -> String? {
        if(teamname == "")
        {
            return "Please fill in all fields"
        }
        if(strCapNum == "")
        {
            return "Please fill in all fields"
        }
        if(Int(strCapNum) == nil)
        {
            return "Enter valid cap number"
        }
        if(shotType == [])
        {
            return "Please fill in all fields"
        }
        if(shotResult == 0)
        {
            return "Please fill in all fields"
        }
        return nil
    }
    
}//struct end

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }.foregroundColor(.black)
    }
}
