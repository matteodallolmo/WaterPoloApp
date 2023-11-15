//
//  ContentView.swift
//  WaterPoloApp
//
//  Created by Matteo Dall'Olmo on 11/13/23.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    var admin: Bool
    
    @State private var teams = [String]()
    
    var body: some View {
    
    VStack {
    if(admin)
    {
        AdminView()
    }
    else
    {
        NavigationView{
        TeamLogListView(teams: teams).onAppear {
            retrieveTeams()
        }
        }
    }
        
    }
    }
    
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
        }
    }//func end
}
