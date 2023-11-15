//
//  ResultsView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/26/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct TeamResultsTable: View {
    
    var team: String
    var criteria1: KeyValue?
    var criteria2: KeyValue?
    var criteria3: KeyValue?
    var phase: Int
    
    //@State private var fields = ["Goals", "Field Blocks", "Missed Goal", "Tip Outs", "Goalie Blocks", "Beat Field Blocks"]
    
    var shootingPercentage: Double {
        let goals = Double(goal.count)
        let shots = Double(goal.count+fieldBlock.count+missGoal.count+tipOut.count+goalieBlock.count+beatFB.count)
        
        return (goals/shots)*100
    }
    
    
    @State private var goal = [Shot]()
    @State private var fieldBlock = [Shot]()
    @State private var missGoal = [Shot]()
    @State private var tipOut = [Shot]()
    @State private var goalieBlock = [Shot]()
    @State private var beatFB = [Shot]()
    
    var shots: Int {
        return goal.count+fieldBlock.count+missGoal.count+tipOut.count+goalieBlock.count+beatFB.count
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Text("Results")
                .font(.title)
                .padding(.top)
            
            Text("Shots Taken:" + String(shots))
            Text("Shooting Percentage: "+String(shootingPercentage.rounded())+"%")
            
            ResultStatView(num: 1, shotsTaken: goal.count)
            
            ResultStatView(num: 2, shotsTaken: fieldBlock.count)
            
            ResultStatView(num: 3, shotsTaken: missGoal.count)
            
            ResultStatView(num: 4, shotsTaken: tipOut.count)
            
            ResultStatView(num: 5, shotsTaken: goalieBlock.count)
            
            ResultStatView(num: 6, shotsTaken: beatFB.count)
        }.onAppear(perform: {
            getData()
        })
    }//body end
    
    
    func getData() -> Void {
        
        let db = Firestore.firestore()
        
        if(criteria1 != nil)
        {
            if(criteria2 != nil)
            {
                if(criteria3 != nil)
                {
                    for n in 1...6 {
                        
                    if(criteria1!.key == "Type") {
                        
                        db.collectionGroup(team+"Shots")
                            .whereField("Result", isEqualTo: n)
                            .whereField("Phase", isEqualTo: phase)
                            .whereField("Type", arrayContains: criteria1!.value)
                            .whereField(criteria2!.key, isEqualTo: criteria2!.value)
                            .whereField(criteria3!.key, isEqualTo: criteria3!.value).getDocuments { snapshot, error in
                    
                    if snapshot != nil
                    {
                        for doc in snapshot!.documents {
                            
                            let shot = Shot(doc: doc)
                            
                            if(n == 1 && !self.goal.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.goal.append(shot) }
                            if(n == 2 && !self.fieldBlock.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.fieldBlock.append(shot) }
                            if(n == 3 && !self.missGoal.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.missGoal.append(shot) }
                            if(n == 4 && !self.tipOut.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.tipOut.append(shot) }
                            if(n == 5 && !self.goalieBlock.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.goalieBlock.append(shot) }
                            if(n == 6 && !self.beatFB.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.beatFB.append(shot) }
                        }
                    }
                    else
                    {
                        print("THE ERROR WAS: "+error!.localizedDescription)
                    }
                }
                     
                }//if end
                else if(criteria2!.key == "Type") {
                    
                    db.collectionGroup(team+"Shots")
                        .whereField("Result", isEqualTo: n)
                        .whereField("Phase", isEqualTo: phase)
                        .whereField(criteria1!.key, isEqualTo: criteria1!.value)
                        .whereField(criteria2!.key, arrayContains: criteria2!.value)
                        .whereField(criteria3!.key, isEqualTo: criteria3!.value).getDocuments { snapshot, error in
                
                if snapshot != nil
                {
                    for doc in snapshot!.documents {
                        
                        let shot = Shot(doc: doc)
                        
                        if(n == 1 && !self.goal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goal.append(shot) }
                        if(n == 2 && !self.fieldBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.fieldBlock.append(shot) }
                        if(n == 3 && !self.missGoal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.missGoal.append(shot) }
                        if(n == 4 && !self.tipOut.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.tipOut.append(shot) }
                        if(n == 5 && !self.goalieBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goalieBlock.append(shot) }
                        if(n == 6 && !self.beatFB.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.beatFB.append(shot) }
                    }
                }
                else
                {
                    print("THE ERROR WAS: "+error!.localizedDescription)
                }
            }
                 
            }//else if end
                        
            else if(criteria3!.key == "Type") {
                
                db.collectionGroup(team+"Shots")
                    .whereField("Result", isEqualTo: n)
                    .whereField("Phase", isEqualTo: phase)
                    .whereField(criteria1!.key, isEqualTo: criteria1!.value)
                    .whereField(criteria2!.key, isEqualTo: criteria2!.value)
                    .whereField(criteria3!.key, arrayContains: criteria3!.value).getDocuments { snapshot, error in
            
            if snapshot != nil
            {
                for doc in snapshot!.documents {
                    
                    let shot = Shot(doc: doc)
                    
                    if(n == 1 && !self.goal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goal.append(shot) }
                    if(n == 2 && !self.fieldBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.fieldBlock.append(shot) }
                    if(n == 3 && !self.missGoal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.missGoal.append(shot) }
                    if(n == 4 && !self.tipOut.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.tipOut.append(shot) }
                    if(n == 5 && !self.goalieBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goalieBlock.append(shot) }
                    if(n == 6 && !self.beatFB.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.beatFB.append(shot) }
                }
            }
            else
            {
                print("THE ERROR WAS: "+error!.localizedDescription)
            }
        }
             
        }//else if end
                
        }//for end
                
                    
        return
        }//criteria3
                
                for n in 1...6 {
                    
                    
                    if(criteria1!.key == "Type") {
                        
                        db.collectionGroup(team+"Shots")
                            .whereField("Result", isEqualTo: n)
                            .whereField("Phase", isEqualTo: phase)
                            .whereField("Type", arrayContains: criteria1!.value)
                            .whereField(criteria2!.key, isEqualTo: criteria2!.value).getDocuments { snapshot, error in
                    
                    if snapshot != nil
                    {
                        for doc in snapshot!.documents {
                            
                            let shot = Shot(doc: doc)
                            
                            if(n == 1 && !self.goal.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.goal.append(shot) }
                            if(n == 2 && !self.fieldBlock.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.fieldBlock.append(shot) }
                            if(n == 3 && !self.missGoal.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.missGoal.append(shot) }
                            if(n == 4 && !self.tipOut.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.tipOut.append(shot) }
                            if(n == 5 && !self.goalieBlock.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.goalieBlock.append(shot) }
                            if(n == 6 && !self.beatFB.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.beatFB.append(shot) }
                        }
                    }
                    else
                    {
                        print("THE ERROR WAS: "+error!.localizedDescription)
                    }
                }
                     
                }//if end
                else if(criteria2!.key == "Type") {
                    
                    db.collectionGroup(team+"Shots")
                        .whereField("Result", isEqualTo: n)
                        .whereField("Phase", isEqualTo: phase)
                        .whereField(criteria1!.key, isEqualTo: criteria1!.value)
                        .whereField("Type", arrayContains: criteria2!.value).getDocuments { snapshot, error in
                
                if snapshot != nil
                {
                    for doc in snapshot!.documents {
                        
                        let shot = Shot(doc: doc)
                        
                        if(n == 1 && !self.goal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goal.append(shot) }
                        if(n == 2 && !self.fieldBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.fieldBlock.append(shot) }
                        if(n == 3 && !self.missGoal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.missGoal.append(shot) }
                        if(n == 4 && !self.tipOut.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.tipOut.append(shot) }
                        if(n == 5 && !self.goalieBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goalieBlock.append(shot) }
                        if(n == 6 && !self.beatFB.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.beatFB.append(shot) }
                    }
                }
                else
                {
                    print("THE ERROR WAS: "+error!.localizedDescription)
                }
            }
                 
            }//else if end
            else
            {
                db.collectionGroup(team+"Shots")
                    .whereField("Result", isEqualTo: n)
                    .whereField("Phase", isEqualTo: phase)
                    .whereField(criteria1!.key, isEqualTo: criteria1!.value)
                    .whereField(criteria2!.key, isEqualTo: criteria2!.value).getDocuments { snapshot, error in
            
            if snapshot != nil
            {
                for doc in snapshot!.documents {
                    
                    let shot = Shot(doc: doc)
                    
                    if(n == 1 && !self.goal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goal.append(shot) }
                    if(n == 2 && !self.fieldBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.fieldBlock.append(shot) }
                    if(n == 3 && !self.missGoal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.missGoal.append(shot) }
                    if(n == 4 && !self.tipOut.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.tipOut.append(shot) }
                    if(n == 5 && !self.goalieBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goalieBlock.append(shot) }
                    if(n == 6 && !self.beatFB.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.beatFB.append(shot) }
                }
            }
            else
            {
                print("THE ERROR WAS: "+error!.localizedDescription)
            }
                }//snapshot end
            }//else end
                    
            }//for end
                
            return
            }//criteria2
            
            for n in 1...6 {
                
                if(criteria1!.key == "Type") {
                
                db.collectionGroup(team+"Shots")
                    .whereField("Result", isEqualTo: n)
                    .whereField("Phase", isEqualTo: phase)
                    .whereField(criteria1!.key, arrayContains: criteria1!.value).getDocuments { snapshot, error in
                
                if snapshot != nil
                {
                    for doc in snapshot!.documents {
                        
                        let shot = Shot(doc: doc)
                        
                        if(n == 1 && !self.goal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goal.append(shot) }
                        if(n == 2 && !self.fieldBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.fieldBlock.append(shot) }
                        if(n == 3 && !self.missGoal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.missGoal.append(shot) }
                        if(n == 4 && !self.tipOut.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.tipOut.append(shot) }
                        if(n == 5 && !self.goalieBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goalieBlock.append(shot) }
                        if(n == 6 && !self.beatFB.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.beatFB.append(shot) }
                    }
                }
                else
                {
                    print("THE ERROR WAS: "+error!.localizedDescription)
                }
            }
            }
                
            else {
                db.collectionGroup(team+"Shots")
                    .whereField("Result", isEqualTo: n)
                    .whereField("Phase", isEqualTo: phase)
                    .whereField(criteria1!.key, isEqualTo: criteria1!.value).getDocuments { snapshot, error in
                
                if snapshot != nil
                {
                    for doc in snapshot!.documents {
                        
                        let shot = Shot(doc: doc)
                        
                        if(n == 1 && !self.goal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goal.append(shot) }
                        if(n == 2 && !self.fieldBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.fieldBlock.append(shot) }
                        if(n == 3 && !self.missGoal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.missGoal.append(shot) }
                        if(n == 4 && !self.tipOut.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.tipOut.append(shot) }
                        if(n == 5 && !self.goalieBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goalieBlock.append(shot) }
                        if(n == 6 && !self.beatFB.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.beatFB.append(shot) }
                    }
                }
                else
                {
                    print("THE ERROR WAS: "+error!.localizedDescription)
                }
            }
            }
            }//for end
            
            return
        }//criteria1
        
        for n in 1...6 {
        db.collectionGroup(team+"Shots")
            .whereField("Phase", isEqualTo: phase)
            .whereField("Result", isEqualTo: n).getDocuments { snapshot, error in
            
            if snapshot != nil
            {
                for doc in snapshot!.documents {
                    
                    let shot = Shot(doc: doc)
                    
                    if(n == 1 && !self.goal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goal.append(shot) }
                    if(n == 2 && !self.fieldBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.fieldBlock.append(shot) }
                    if(n == 3 && !self.missGoal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.missGoal.append(shot) }
                    if(n == 4 && !self.tipOut.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.tipOut.append(shot) }
                    if(n == 5 && !self.goalieBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goalieBlock.append(shot) }
                    if(n == 6 && !self.beatFB.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.beatFB.append(shot) }
                }
            }
            else
            {
                print("THE ERROR WAS: "+error!.localizedDescription)
            }
        }
            
        }//for end
        
    }//func end
}//struct end


struct PlayerResultsTable: View {
    
    var team: String
    var num: Int
    var criteria1: KeyValue?
    var criteria2: KeyValue?
    var criteria3: KeyValue?
    var phase: Int
    
    //@State private var fields = ["Goals", "Field Blocks", "Missed Goal", "Tip Outs", "Goalie Blocks", "Beat Field Blocks"]
    
    var shootingPercentage: Double {
        let goals = Double(goal.count)
        let shots = Double(goal.count+fieldBlock.count+missGoal.count+tipOut.count+goalieBlock.count+beatFB.count)
        
        return (goals/shots)*100
    }
    
    @State private var goal = [Shot]()
    @State private var fieldBlock = [Shot]()
    @State private var missGoal = [Shot]()
    @State private var tipOut = [Shot]()
    @State private var goalieBlock = [Shot]()
    @State private var beatFB = [Shot]()
    
    var shots: Int {
        return goal.count+fieldBlock.count+missGoal.count+tipOut.count+goalieBlock.count+beatFB.count
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Text("Results")
                .font(.title)
                .padding(.top)
            
            Text("Shots Taken: " + String(shots))
            Text("Shooting Percentage: "+String(shootingPercentage.rounded())+"%")
            
            ResultStatView(num: 1, shotsTaken: goal.count)
            
            ResultStatView(num: 2, shotsTaken: fieldBlock.count)
            
            ResultStatView(num: 3, shotsTaken: missGoal.count)
            
            ResultStatView(num: 4, shotsTaken: tipOut.count)
            
            ResultStatView(num: 5, shotsTaken: goalieBlock.count)
            
            ResultStatView(num: 6, shotsTaken: beatFB.count)
        }.onAppear(perform: {
            getData()
        })
    }//body end
    
    
    func getData() -> Void {
        
        let db = Firestore.firestore()
        
        if(criteria1 != nil)
        {
            if(criteria2 != nil)
            {
                if(criteria3 != nil)
                {
                    for n in 1...6 {
                        
                    if(criteria1!.key == "Type") {
                        
                        db.collection("teams").document(team).collection("players").document(String(num)).collection(team+"Shots")
                            .whereField("Result", isEqualTo: n)
                            .whereField("Phase", isEqualTo: phase)
                            .whereField("Type", arrayContains: criteria1!.value)
                            .whereField(criteria2!.key, isEqualTo: criteria2!.value)
                            .whereField(criteria3!.key, isEqualTo: criteria3!.value).getDocuments { snapshot, error in
                    
                    if snapshot != nil
                    {
                        for doc in snapshot!.documents {
                            
                            let shot = Shot(doc: doc)
                            
                            if(n == 1 && !self.goal.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.goal.append(shot) }
                            if(n == 2 && !self.fieldBlock.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.fieldBlock.append(shot) }
                            if(n == 3 && !self.missGoal.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.missGoal.append(shot) }
                            if(n == 4 && !self.tipOut.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.tipOut.append(shot) }
                            if(n == 5 && !self.goalieBlock.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.goalieBlock.append(shot) }
                            if(n == 6 && !self.beatFB.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.beatFB.append(shot) }
                        }
                    }
                    else
                    {
                        print("THE ERROR WAS: "+error!.localizedDescription)
                    }
                }
                     
                }//if end
                else if(criteria2!.key == "Type") {
                    
                    db.collectionGroup(team+"Shots")
                        .whereField("Result", isEqualTo: n)
                        .whereField("Phase", isEqualTo: phase)
                        .whereField(criteria1!.key, isEqualTo: criteria1!.value)
                        .whereField(criteria2!.key, arrayContains: criteria2!.value)
                        .whereField(criteria3!.key, isEqualTo: criteria3!.value).getDocuments { snapshot, error in
                
                if snapshot != nil
                {
                    for doc in snapshot!.documents {
                        
                        let shot = Shot(doc: doc)
                        
                        if(n == 1 && !self.goal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goal.append(shot) }
                        if(n == 2 && !self.fieldBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.fieldBlock.append(shot) }
                        if(n == 3 && !self.missGoal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.missGoal.append(shot) }
                        if(n == 4 && !self.tipOut.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.tipOut.append(shot) }
                        if(n == 5 && !self.goalieBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goalieBlock.append(shot) }
                        if(n == 6 && !self.beatFB.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.beatFB.append(shot) }
                    }
                }
                else
                {
                    print("THE ERROR WAS: "+error!.localizedDescription)
                }
            }
                 
            }//else if end
                        
            else if(criteria3!.key == "Type") {
                
                db.collectionGroup(team+"Shots")
                    .whereField("Result", isEqualTo: n)
                    .whereField("Phase", isEqualTo: phase)
                    .whereField(criteria1!.key, isEqualTo: criteria1!.value)
                    .whereField(criteria2!.key, isEqualTo: criteria2!.value)
                    .whereField(criteria3!.key, arrayContains: criteria3!.value).getDocuments { snapshot, error in
            
            if snapshot != nil
            {
                for doc in snapshot!.documents {
                    
                    let shot = Shot(doc: doc)
                    
                    if(n == 1 && !self.goal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goal.append(shot) }
                    if(n == 2 && !self.fieldBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.fieldBlock.append(shot) }
                    if(n == 3 && !self.missGoal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.missGoal.append(shot) }
                    if(n == 4 && !self.tipOut.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.tipOut.append(shot) }
                    if(n == 5 && !self.goalieBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goalieBlock.append(shot) }
                    if(n == 6 && !self.beatFB.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.beatFB.append(shot) }
                }
            }
            else
            {
                print("THE ERROR WAS: "+error!.localizedDescription)
            }
        }
             
        }//else if end
                
        }//for end
                
                    
        return
        }//criteria3
                
                for n in 1...6 {
                    
                    
                    if(criteria1!.key == "Type") {
                        
                        db.collectionGroup(team+"Shots")
                            .whereField("Result", isEqualTo: n)
                            .whereField("Phase", isEqualTo: phase)
                            .whereField("Type", arrayContains: criteria1!.value)
                            .whereField(criteria2!.key, isEqualTo: criteria2!.value).getDocuments { snapshot, error in
                    
                    if snapshot != nil
                    {
                        for doc in snapshot!.documents {
                            
                            let shot = Shot(doc: doc)
                            
                            if(n == 1 && !self.goal.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.goal.append(shot) }
                            if(n == 2 && !self.fieldBlock.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.fieldBlock.append(shot) }
                            if(n == 3 && !self.missGoal.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.missGoal.append(shot) }
                            if(n == 4 && !self.tipOut.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.tipOut.append(shot) }
                            if(n == 5 && !self.goalieBlock.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.goalieBlock.append(shot) }
                            if(n == 6 && !self.beatFB.contains(where: { temp in
                                if(shot.equals(temp: temp)) { return true }
                                return false }))
                            { self.beatFB.append(shot) }
                        }
                    }
                    else
                    {
                        print("THE ERROR WAS: "+error!.localizedDescription)
                    }
                }
                     
                }//if end
                else if(criteria2!.key == "Type") {
                    
                    db.collectionGroup(team+"Shots")
                        .whereField("Result", isEqualTo: n)
                        .whereField("Phase", isEqualTo: phase)
                        .whereField(criteria1!.key, isEqualTo: criteria1!.value)
                        .whereField("Type", arrayContains: criteria2!.value).getDocuments { snapshot, error in
                
                if snapshot != nil
                {
                    for doc in snapshot!.documents {
                        
                        let shot = Shot(doc: doc)
                        
                        if(n == 1 && !self.goal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goal.append(shot) }
                        if(n == 2 && !self.fieldBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.fieldBlock.append(shot) }
                        if(n == 3 && !self.missGoal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.missGoal.append(shot) }
                        if(n == 4 && !self.tipOut.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.tipOut.append(shot) }
                        if(n == 5 && !self.goalieBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goalieBlock.append(shot) }
                        if(n == 6 && !self.beatFB.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.beatFB.append(shot) }
                    }
                }
                else
                {
                    print("THE ERROR WAS: "+error!.localizedDescription)
                }
            }
                 
            }//else if end
            else
            {
                db.collectionGroup(team+"Shots")
                    .whereField("Result", isEqualTo: n)
                    .whereField("Phase", isEqualTo: phase)
                    .whereField(criteria1!.key, isEqualTo: criteria1!.value)
                    .whereField(criteria2!.key, isEqualTo: criteria2!.value).getDocuments { snapshot, error in
            
            if snapshot != nil
            {
                for doc in snapshot!.documents {
                    
                    let shot = Shot(doc: doc)
                    
                    if(n == 1 && !self.goal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goal.append(shot) }
                    if(n == 2 && !self.fieldBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.fieldBlock.append(shot) }
                    if(n == 3 && !self.missGoal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.missGoal.append(shot) }
                    if(n == 4 && !self.tipOut.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.tipOut.append(shot) }
                    if(n == 5 && !self.goalieBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goalieBlock.append(shot) }
                    if(n == 6 && !self.beatFB.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.beatFB.append(shot) }
                }
            }
            else
            {
                print("THE ERROR WAS: "+error!.localizedDescription)
            }
                }//snapshot end
            }//else end
                    
            }//for end
                
            return
            }//criteria2
            
            for n in 1...6 {
                
                if(criteria1!.key == "Type") {
                
                db.collectionGroup(team+"Shots")
                    .whereField("Result", isEqualTo: n)
                    .whereField("Phase", isEqualTo: phase)
                    .whereField(criteria1!.key, arrayContains: criteria1!.value).getDocuments { snapshot, error in
                
                if snapshot != nil
                {
                    for doc in snapshot!.documents {
                        
                        let shot = Shot(doc: doc)
                        
                        if(n == 1 && !self.goal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goal.append(shot) }
                        if(n == 2 && !self.fieldBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.fieldBlock.append(shot) }
                        if(n == 3 && !self.missGoal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.missGoal.append(shot) }
                        if(n == 4 && !self.tipOut.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.tipOut.append(shot) }
                        if(n == 5 && !self.goalieBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goalieBlock.append(shot) }
                        if(n == 6 && !self.beatFB.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.beatFB.append(shot) }
                    }
                }
                else
                {
                    print("THE ERROR WAS: "+error!.localizedDescription)
                }
            }
            }
                
            else {
                db.collectionGroup(team+"Shots")
                    .whereField("Result", isEqualTo: n)
                    .whereField("Phase", isEqualTo: phase)
                    .whereField(criteria1!.key, isEqualTo: criteria1!.value).getDocuments { snapshot, error in
                
                if snapshot != nil
                {
                    for doc in snapshot!.documents {
                        
                        let shot = Shot(doc: doc)
                        
                        if(n == 1 && !self.goal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goal.append(shot) }
                        if(n == 2 && !self.fieldBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.fieldBlock.append(shot) }
                        if(n == 3 && !self.missGoal.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.missGoal.append(shot) }
                        if(n == 4 && !self.tipOut.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.tipOut.append(shot) }
                        if(n == 5 && !self.goalieBlock.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.goalieBlock.append(shot) }
                        if(n == 6 && !self.beatFB.contains(where: { temp in
                            if(shot.equals(temp: temp)) { return true }
                            return false }))
                        { self.beatFB.append(shot) }
                    }
                }
                else
                {
                    print("THE ERROR WAS: "+error!.localizedDescription)
                }
            }
            }
            }//for end
            
            return
        }//criteria1
        
        for n in 1...6 {
        db.collectionGroup(team+"Shots")
            .whereField("Phase", isEqualTo: phase)
            .whereField("Result", isEqualTo: n).getDocuments { snapshot, error in
            
            if snapshot != nil
            {
                for doc in snapshot!.documents {
                    
                    let shot = Shot(doc: doc)
                    
                    if(n == 1 && !self.goal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goal.append(shot) }
                    if(n == 2 && !self.fieldBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.fieldBlock.append(shot) }
                    if(n == 3 && !self.missGoal.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.missGoal.append(shot) }
                    if(n == 4 && !self.tipOut.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.tipOut.append(shot) }
                    if(n == 5 && !self.goalieBlock.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.goalieBlock.append(shot) }
                    if(n == 6 && !self.beatFB.contains(where: { temp in
                        if(shot.equals(temp: temp)) { return true }
                        return false }))
                    { self.beatFB.append(shot) }
                }
            }
            else
            {
                print("THE ERROR WAS: "+error!.localizedDescription)
            }
        }
            
        }//for end
        
    }//func end
}
