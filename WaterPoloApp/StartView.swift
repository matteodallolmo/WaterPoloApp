//
//  StartView.swift
//  WaterPoloApp
//
//  Created by Matteo Dall'Olmo on 11/14/23.
//
import SwiftUI

struct StartView: View {
    
    @State private var password = ""
    @State private var isActive = false
    @State private var admin = false
    @State private var errorMes = ""
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                Spacer()
                VStack {
                    
                    Text("Harvard-Westlake")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    Image("WapoIcon")
                        .resizable()
                        .frame(width: geometry.size.width/3.5, height: geometry.size.width/3.5)
                    
                    Text("Water Polo")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    HStack {
                         Spacer()
                    }.frame(width: geometry.size.width, height: geometry.size.height/5.5, alignment: .center)
                    
                    Text("Login")
                        .fontWeight(.medium)
                        .font(.largeTitle)
                    
                    VStack(spacing: 0) {
                        
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.horizontal, 60)
                            .padding(.vertical, 15)
                        
                        Text(errorMes)
                            .foregroundColor(Color.red)
                        
                        VStack(spacing: 0) {
                                
                            NavigationLink(destination: ContentView(admin: admin)
                                .navigationBarTitle("")
                                .navigationBarHidden(true), isActive: $isActive) {
                                Text("")
                            }
                            
                        }
                        
                        Button(action: {
                            
                            if(password == "Player1")
                            {
                                self.isActive = true
                            }
                            else if(password == "Admin1")
                            {
                                self.isActive = true
                                self.admin = true
                            }
                            else if(validateFields() != nil)
                            {
                                self.errorMes = self.validateFields()!
                            }
                            else
                            {
                                self.errorMes = "Incorrect password"
                            }
                            
                        }, label: {
                            Text("Submit")
                                .padding(.horizontal, 80)
                                .padding(.vertical, 15)
                                .background(Color.red)
                                .cornerRadius(40)
                                .foregroundColor(Color.white)
                        })//button
                        
                        Spacer()
                        Spacer()
                    }//vstack
                    
                    Spacer()
                }//vstack
                Spacer()
            }
        }
    }
    
    func validateFields() -> String?
    {
        //check if filled
        if(password == "")
        {
            return "Please fill in all fields";
        }
        
        return nil
    }
}
