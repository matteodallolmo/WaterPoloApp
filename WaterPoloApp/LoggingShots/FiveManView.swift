//
//  FiveManView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/13/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct FiveManView: View {
    
    var teamname = ""
    var strCapNum = ""
    var shotType = [Int]()
    var shotResult = 0
    var phase = 0
    var location = 0
    
    @State private var source = 0
    @State private var isActive = false
    
    var body: some View {
    GeometryReader { geometry in
    Group {
        ZStack() {
            
            NavigationLink(destination: AdminView()
                .navigationBarTitle("")
                .navigationBarHidden(true), isActive: $isActive) {
                Text("")
            }
            
            Image("halfcourt1")
                .resizable()
                .frame(width: geometry.size.width/1.3, height: geometry.size.height/1.1)
            
            Text("Shot Source")
                .offset(y: -geometry.size.height/2.1)
                .font(.custom("Gill Sans", size: 30))
            
            VStack(spacing: 5) {
                
                HStack(spacing: 5) {
                    Button(action: {
                        self.source = 1
                        updateToFirebase()
                        self.isActive = true
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/2)/3, height: geometry.size.height/4)
                            .border(Color.red, width:3)
                    })
                    
                    Button(action: {
                        self.source = 2
                        updateToFirebase()
                        self.isActive = true
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/2)/3, height: geometry.size.height/4)
                            .border(Color.red, width: 3)
                    })
                    
                    Button(action: {
                        self.source = 3
                        updateToFirebase()
                        self.isActive = true
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/2)/3, height: geometry.size.height/4)
                            .border(Color.red, width: 3)
                    })
                    
                    Button(action: {
                        self.source = 6
                        updateToFirebase()
                        self.isActive = true
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/2)/3, height: geometry.size.height/4)
                            .border(Color.red, width: 3)
                    })
                }//hstack
                HStack(spacing: 5) {
                    
                    Button(action: {
                        self.source = 4
                        updateToFirebase()
                        self.isActive = true
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/2)/3, height: geometry.size.height/4)
                            .border(Color.red, width: 3)
                    })
                    
                    Button(action: {
                        self.source = 5
                        updateToFirebase()
                        self.isActive = true
                    }, label: {
                        Rectangle().fill(Color.clear)
                            .frame(width: (geometry.size.width/2)/3, height: geometry.size.height/4)
                            .border(Color.red, width: 3)
                    })
                }//hstack
                
                Button(action: {
                    self.source = 7
                    updateToFirebase()
                    self.isActive = true
                }, label: {
                    Text("Penalty")
                        .padding(.horizontal, 80)
                        .padding(.vertical, 15)
                        .background(Color.red)
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .offset(y: 30)
                })
                
            }//VStack
            .frame(width: geometry.size.width/1.45, height: geometry.size.height/2, alignment: .center)
        }
    }//zstack
    .offset(x: geometry.size.width/9, y: geometry.size.height/10)
    .onAppear {
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
    .onDisappear {
        DispatchQueue.main.async {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }
}//geometry
}//body
    func updateToFirebase() -> Void
    {
        let capNum = Int(strCapNum)
        let db = Firestore.firestore()
        
        var docID : String = ""
        
        db.collection("teams").whereField("name", isEqualTo: self.teamname).getDocuments { snapshot, err in
            
        if(snapshot != nil && err == nil)
        {
            let docs = snapshot!.documents
            for document in docs
            {
                docID = document.documentID
            }
            
            if(docID == "")
            {
                db.collection("teams").document(teamname).setData(["name" : teamname])
            }
            db.collection("teams").document(teamname).collection("players").document(strCapNum).setData(["capNum" : capNum!], merge: true)
            db.collection("teams").document(teamname).collection("players").document(strCapNum).collection(teamname+"Shots").addDocument(data: ["Location" : location, "Phase" : phase, "Result" : shotResult, "Position" : self.source, "Type" : shotType])
        }
        }
    }

}//struct

struct FiveManView_Previews: PreviewProvider {
    static var previews: some View {
        FiveManView(teamname: "Harvard-Westlake", strCapNum: "3", shotType: [3, 2, 1], shotResult: 4, phase: 1, location: 4)
            .previewLayout(.fixed(width: 2532, height: 1170))
    }
}
