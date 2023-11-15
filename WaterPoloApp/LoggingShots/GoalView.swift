//
//  GoalView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/13/21.
//

import SwiftUI

struct GoalView: View {
    
    var teamname = ""
    var strCapNum = ""
    var shotType = [Int]()
    var shotResult = 0
    var phase = 0
    
    @State private var evenLink = false
    @State private var fiveManLink = false
    @State private var location = 0
    
    var body: some View {
    GeometryReader { geometry in
    Group {
        ZStack() {
            NavigationLink(destination: EvenView(teamname: teamname, strCapNum: strCapNum, shotType: shotType, shotResult: shotResult, phase: phase, location: self.location)
                .navigationBarTitle("")
                .navigationBarHidden(true), isActive: $evenLink) {
                Text("")
            }
            
            NavigationLink(destination: FiveManView(teamname: teamname, strCapNum: strCapNum, shotType: shotType, shotResult: shotResult, phase: phase, location: self.location)
                .navigationBarTitle("")
                .navigationBarHidden(true), isActive: $fiveManLink) {
                Text("")
            }
            
            Image("goal1")
                .resizable()
                .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.1)
                
            Text("Shot Location")
                .offset(y: -geometry.size.height/2.5)
                .font(.custom("Gill Sans", size: 30))
            
            VStack(spacing: 5) {
                
                HStack(spacing: 5) {
                    Button(action: {
                        self.location = 2
                        if(phase == 1) {
                        self.evenLink = true
                        }
                        else {
                        self.fiveManLink = true
                        }
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/1.45)/3, height: geometry.size.height/4)
                            .border(Color.red, width:3)
                    })
                    
                    Button(action: {
                        self.location = 3
                        if(phase == 1) {
                        self.evenLink = true
                        }
                        else {
                        self.fiveManLink = true
                        }
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/1.45)/3, height: geometry.size.height/4)
                            .border(Color.red, width: 3)
                    })
                    
                    Button(action: {
                        self.location = 4
                        if(phase == 1) {
                        self.evenLink = true
                        }
                        else {
                        self.fiveManLink = true
                        }
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/1.45)/3, height: geometry.size.height/4)
                            .border(Color.red, width: 3)
                    })
                }
                HStack(spacing: 5) {
                    
                    Button(action: {
                        self.location = 1
                        if(phase == 1) {
                        self.evenLink = true
                        }
                        else {
                        self.fiveManLink = true
                        }
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/1.45)/3, height: geometry.size.height/4)
                            .border(Color.red, width: 3)
                    })
                    
                    Button(action: {}, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/1.45)/3, height: geometry.size.height/4)
                            .border(Color.clear, width: 3)
                    })
                    
                    Button(action: {
                        self.location = 5
                        if(phase == 1) {
                        self.evenLink = true
                        }
                        else {
                        self.fiveManLink = true
                        }
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/1.45)/3, height: geometry.size.height/4)
                            .border(Color.red, width: 3)
                    })
                }//hstack
            }//vstack
            .frame(width: geometry.size.width/1.45, height: geometry.size.height/2, alignment: .center)
            .offset(x: 0, y: geometry.size.height/8)
            
        }.offset(x: geometry.size.width/21, y: geometry.size.height/10)
        
    }//group end
    .onAppear() {
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
}//geometry end
}//body end
}//struct end
