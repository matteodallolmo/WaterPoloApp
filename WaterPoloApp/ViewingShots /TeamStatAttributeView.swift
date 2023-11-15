//
//  PositionStatView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/23/21.
//

import SwiftUI

struct PositionStatView: View {
    
    var num: Int
    var shotsTaken: Int
    
    var body: some View {
        HStack(spacing: 0) {
            Text("From "+String(num))
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            
            Spacer()
            
            Text(String("Shots: "+String(shotsTaken)))
                .fontWeight(.thin)
                .font(.title)
                .padding(.horizontal, 20)
                .fixedSize(horizontal: true, vertical: false)
        }
            Spacer()
    }
}

struct TypeStatView: View {
    
    var num: Int
    var shotsTaken: Int
    
    var body: some View {
        HStack(spacing: 0) {
            
            if(num == 1) {
            Text("Direct")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 2) {
            Text("Catch & Shoot")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 3) {
            Text("Fake")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 4) {
            Text("Drive")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 5) {
            Text("Pick Up")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 6) {
            Text("Backhand")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 7) {
            Text("Quick 6v5")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            Group {
            if(num == 8) {
            Text("Overpass")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 9) {
            Text("Skip")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 10) {
            Text("Lob")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 11) {
            Text("Transition")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            }
            Spacer()
            
            Text(String("Shots: "+String(shotsTaken)))
                .fontWeight(.thin)
                .font(.title)
                .padding(.horizontal, 20)
                .fixedSize(horizontal: true, vertical: false)
        }
            Spacer()
    }
}

struct ResultStatView: View {
    
    var num: Int
    var shotsTaken: Int
    
    var body: some View {
        HStack(spacing: 0) {
            if(num == 1) {
            Text("Goal")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 2) {
            Text("Field Block")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 3) {
            Text("Missed Goal")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 4) {
            Text("Tip Out")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 5) {
            Text("Goalie Block")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 6) {
            Text("Beat Field Blocker")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            
            Spacer()
            
            Text(String("Shots: "+String(shotsTaken)))
                .fontWeight(.thin)
                .font(.title)
                .padding(.horizontal, 20)
                .fixedSize(horizontal: true, vertical: false)
        }
            Spacer()
    }
}

struct LocationStatView: View {
    
    var num: Int
    var shotsTaken: Int
    
    var body: some View {
        HStack(spacing: 0) {
            if(num == 1) {
            Text("Bottom Left")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 2) {
            Text("Top Left")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 3) {
            Text("Center")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 4) {
            Text("Top Right")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            if(num == 5) {
            Text("Bottom Right")
                .fontWeight(.thin)
                .font(.title)
                .padding(.leading, 20)
                .fixedSize(horizontal: true, vertical: false)
            }
            
            Spacer()
            
            Text(String("Shots: "+String(shotsTaken)))
                .fontWeight(.thin)
                .font(.title)
                .padding(.horizontal, 20)
                .fixedSize(horizontal: true, vertical: false)
        }
            Spacer()
    }
}

struct PositionStatView_Previews: PreviewProvider {
    static var previews: some View {
        PositionStatView(num: 1, shotsTaken: 47)
    }
}
