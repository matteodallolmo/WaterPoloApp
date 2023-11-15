//
//  TeamView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/14/21.
//

import SwiftUI

struct PlayerListView: View {
    
    var team: String
    var players: [String]
    
    var body: some View {
    
    List(players, id: \.self) { player in
    NavigationLink(
        destination: Player0StatsView(team: team, num: Int(player)!),
        label: {
            Text("#"+player)
        })
    }
    .navigationTitle("Players")
    .navigationBarTitleDisplayMode(.large)
    .navigationBarItems(trailing:
        NavigationLink(destination: Team0StatsView(team: team),
        label: {
            Text("View Team Stats")
        }))
    
    }
}
