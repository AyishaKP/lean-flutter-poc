//
//  ContentView.swift
//  ContentView
//
//  Created by Ayisha Farhan on 29/11/2021.
//


import SwiftUI
import LeanSDK

struct ContentView: View {
    @State var appToken: String = ""
    @State var isSandbox: Bool = true
    
    var body: some View {
        NavigationView {
            List {
//                VStack(alignment: .leading) {
//                    Text("Config")
//                        .font(.headline)
//                        .padding(.vertical)
//                    HStack {
//                        TextField("App Token", text: $appToken, onCommit: {
//                            LeanSetup()
//                        })
//                    }
//                }
//                Toggle("Sandbox", isOn: $isSandbox)
//                    .gesture(
//                        TapGesture()
//                            .onEnded({ _ in
//                                LeanSetup()
//                            })
//                    )
//                VStack(alignment: .leading) {
//                    Text("Methods")
//                        .font(.headline)
//                        .padding(.vertical)
//                    NavigationLink(
//                        destination: LinkAccountView(),
//                        label: {
//                            Text("Link Account")
//                        })
//                }
//                NavigationLink(
//                    destination: ReconnectView(),
//                    label: {
//                        Text("Reconnect Account")
//                    })
                NavigationLink(
                    destination: CreatePaymentSourceView(),
                    label: {
                        Text("Create a Payment Source")
                    })
//                NavigationLink(
//                    destination: UpdatePaymentSourceView(),
//                    label: {
//                        Text("Update a Payment Source")
//                    })
//                NavigationLink(
//                    destination: PayView(),
//                    label: {
//                        Text("Initiate a Payment")
//                    })
                
            }
            .navigationBarTitle("LinkSDK")
        }
        
    }
    
    func LeanSetup() {
        Lean.manager.setup(appToken: appToken, sandbox: isSandbox, version: "latest")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
