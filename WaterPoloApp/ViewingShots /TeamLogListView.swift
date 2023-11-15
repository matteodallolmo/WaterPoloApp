//
//  TeamLogView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/14/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct TeamLogListView: View {
    
    var teams: [String]
    @State private var players = [String]()
    @State private var viewIsActive = false
    @State private var globalTeam = ""
    
    var body: some View {
       
VStack {
    List(teams, id: \.self) { team in
        Button(action: {
            globalTeam = team
            retrievePlayers(team: team)
            }, label: {
                TeamLogView(team: team)
            })
    }//list
    .navigationTitle("Teams")
    .navigationBarTitleDisplayMode(.large)
      
    NavigationLink(
        destination: PlayerListView(team: globalTeam, players: players),
        isActive: $viewIsActive,
        label: {
            Text("")
        })
}
}//body end

func retrievePlayers(team: String) -> Void
{
    var arr = [String]()
    let db = Firestore.firestore()
    
    db.collection("teams").document(team).collection("players").getDocuments { snapshot, err in
        
    if(snapshot != nil && err == nil)
    {
        let docs = snapshot!.documents
        for document in docs
        {
            arr.append(document.documentID)
        }
    }
        
        players = arr
        self.viewIsActive = true
    }
}//func end
}//struct end

struct TeamLogView: View {
    
    var team: String
    
    var body: some View {
    HStack(spacing: 0) {
        Text(team)
            .fontWeight(.thin)
            .font(.title)
            .padding(.leading, 20)
            .fixedSize(horizontal: true, vertical: false)
    }
        Spacer()
    }
}
