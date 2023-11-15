//
//  AdminView.swift
//  WaterPoloApp
//
//  Created by Matteo Dall'Olmo on 11/14/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct AdminView: View {
    
    @State private var logIsActive = false
    @State private var viewIsActive = false
    @State private var teams = [String]()
    
    var body: some View {
    ZStack() {
        
        NavigationLink(destination: LogShotsView(), isActive: $logIsActive) {
            Text("")
        }
        
        NavigationLink(destination: TeamLogListView(teams: teams), isActive: $viewIsActive) {
            Text("")
        }
        
        VStack() {
            Button(action: {
                
                retrieveTeams()
            }, label: {
                Text("View Shots")
                    .padding(.horizontal, 80)
                    .padding(.vertical, 15)
                    .background(Color.red)
                    .cornerRadius(40)
                    .foregroundColor(Color.white)
            })
            
            
            Button(action: {
                
                self.logIsActive = true
                
            }, label: {
                Text("Log Shots")
                    .padding(.horizontal, 80)
                    .padding(.vertical, 15)
                    .background(Color.red)
                    .cornerRadius(40)
                    .foregroundColor(Color.white)
            })
            
        }//vstack end
    }.navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)//zstack end
    }//body end
    
    func retrieveTeams() -> Void
    {
        var arr = [String]()
        let db = Firestore.firestore()
        
        db.collection("teams").getDocuments { snapshot, err in
            
        if(snapshot != nil && err == nil)
        {
            let docs = snapshot!.documents
            for document in docs
            {
                arr.append(document.documentID)
            }
        }
            
            teams = arr
            self.viewIsActive = true
        }
    }//func end
    
}//struct end
