//
//  AccountForm.swift
//  dice
//
//  Created by Gajender Jangir on 22/04/22.
//

import SwiftUI

struct AccountForm: View {
    //    init()
    //    {
    //        UISegmentedControl.appearance().selectedSegmentTintColor = .green
    //    }
    
    
    @State private var firstName:String = ""
    @State private var lastName:String = ""
    @State private var birthdate = Date()
    @State private var notifications = false
    @State private var datalimit = 1
    @State private var sideOfForce :SideOfForce = .dark
    
    @State var isLoading:Bool = false
    
    var body: some View {
        
        Form{
            Section(header: Text("Personal Information")){
                TextField("First name", text: $firstName)
                TextField("Last name", text: $lastName)
                DatePicker("Birt Date", selection: $birthdate,displayedComponents: .date).disabled(isLoading)
                
                
            }
            Section(header: Text("Preferences")){
                
                Toggle("Notifications", isOn: $notifications)
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .disabled(isLoading)
                
                Stepper("Data Limit", value: $datalimit, in: 1...15)
                    .disabled(isLoading)
                
                Text("Data Limit \(datalimit) GB")
            }
            
            Section(header: Text("Choose favourate hero")){
                
                Picker("Choose", selection: $sideOfForce)
                {
                    ForEach(SideOfForce.allCases, id: \.self)
                    {
                        Text($0.rawValue)
                        
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                choseHero(selected: sideOfForce)
            }
        }
        .onAppear{
            networkCall()
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .navigationTitle("Account")
        .toolbar{
            ToolbarItem(placement: .navigation){
                Menu{
                    Button(action:{}, label: {Text("Dispaly")})
                    Button(action:{}, label: {Text("Network")})
                    Button(action:{}, label: {Text("Storage")})
                    Button(action:{}, label: {Text("About")})
                }
            label:{
                Label(title: {Text("Account")}, icon: {Image(systemName: "gear")})
            }
            }
            
        }
        .accentColor(.green)
        
    }
    func networkCall()
    {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 6){
            isLoading = false
        }
    }
}


func saveUser()
{
    print("user Saved")
}

enum SideOfForce:String,CaseIterable{
    case light = "anakin"
    case dark = "vader"
    
}

struct choseHero:View
{
    var selected:SideOfForce
    var body: some View{
        switch selected {
        case .light:
            HeroImageView(heroName: "anakin")
        case .dark:
            HeroImageView(heroName: "vader")
        }
    }
}

struct HeroImageView: View {
    var heroName:String
    var body: some View {
        Image(heroName).resizable().scaledToFit()
            .frame(height: 250,alignment: .center)
        
    }
}

struct AccountForm_Previews: PreviewProvider {
    static var previews: some View {
        AccountForm()
        
    }
}
