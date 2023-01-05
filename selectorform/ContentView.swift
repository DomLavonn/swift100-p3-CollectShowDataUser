//
//  ContentView.swift
//  selectorform
//
//  Created by Domanik Johnson on 1/3/23.
//

import SwiftUI

struct ContentView: View {
    
    enum MaritalStatus: String,CaseIterable, Identifiable {
        
        // for Identfiable
        var id: Self  {self}
        
        case Mr, Mrs, Miss, Ms
    }
    enum MenuItem: String, CaseIterable, Identifiable {
        // for Identfiable
        var id: Self  {self}
        case Vanilla, Cherry, GirlScout
    }
    
    
    @State private var fn = ""
    @State private var ln = ""
    @State private var un = ""
    @State private var pw = ""
    // Selected variable
    @State private var selectedFlavor: MaritalStatus = .Mr
    @State private var selectMenuItem: MenuItem = .Cherry
    
    var body: some View {
        ScrollView{
            
            VStack{
                Text("Enter Details")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                TextField("Enter Firstname", text: $fn)
                TextField("Enter Lastname", text: $ln)
                TextField("Enter Username", text: $un)
                TextField("Enter Password", text: $pw)
                
                    HStack {
                        Text("Martial Status")
                    Spacer()
                        //Picker
                        Picker("Flavor", selection: $selectedFlavor) {
                            Text("Mr").tag(MaritalStatus.Mr)
                            Text("Ms").tag(MaritalStatus.Ms)
                            Text("Miss").tag(MaritalStatus.Miss)
                            
                        }.accentColor(.red)
                          
                    }.font(.title3)
                
                Picker("Menu Item", selection:$selectMenuItem ) {
                    ForEach(MenuItem.allCases) { menuItemIn in
                        Text(menuItemIn.rawValue.capitalized)
                    }
                }.pickerStyle(.segmented)
            
                VStack {
                    HStack{
                        Text("firstname:")
                        Spacer()
                        Text(fn)
                    }
                    HStack{
                        Text("lastname:")
                        Spacer()
                        Text(ln)
                    }
                    HStack{
                        Text("username:")
                        Spacer()
                        Text(un)
                    }
                    HStack{
                        Text("password:")
                        Spacer()
                        Text(pw)
                    }
                    
                    HStack{
                        Text("Marital Status:")
                        Spacer()
                        Text(selectedFlavor.rawValue)
                    }
                    HStack{
                        Text("Flavor:")
                        Spacer()
                        Text(selectMenuItem.rawValue)
                    }
                }.padding()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            .shadow(radius: 2)
            .cornerRadius(5)
            .foregroundColor(.black)
                
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
