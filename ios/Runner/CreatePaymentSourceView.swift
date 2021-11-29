//
//  LinkAccountView.swift
//  LeanDemo
//
//  Created by Alex Tomlinson on 24/04/2021.
//

import SwiftUI
import LeanSDK

struct CreatePaymentSourceView: View {
    @State var customerId: String = "2506c3d5-3797-4eb6-a5cd-82b9ffff4f35"
    @State var paymentDestinationId: String = "266733cc-6f46-4e87-af7e-9bb46b99601d"
    @State var bankId: String = ""
    @State var isPresented = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading){
                Image("CPS")
                    .ignoresSafeArea()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: 150,
                           alignment: .center)
                List {
                    VStack(alignment: .leading) {
                        Text("Create Payment Source")
                            .bold()
                            .padding(.top)
                            .font(.title)
                        Text("For a customer to start making payments, they must first connect their account(s) and set up a beneficiary. The Create Payment Source method handles this.")
                            .padding(.vertical)
                            .foregroundColor(.gray)
                    }
                    TextField("Customer ID", text: $customerId)
                    TextField("Bank ID (optional)", text: $bankId)
                    TextField("Payment Destination ID (optional)", text: $paymentDestinationId)
                    
                }
            }
        }.fullScreenCover(isPresented: $isPresented, content: {
            Lean.manager.view.ignoresSafeArea()
        })
    }
    
    func LeanCreatePaymentSource() {
        isPresented = true
        Lean.manager.createPaymentSource(
            customerId: customerId,
            bankId: (bankId.count > 1) ? bankId : nil,
            paymentDestinationId: paymentDestinationId.count > 1 ? paymentDestinationId : nil,
            success: {
                print("Link Success")
                isPresented = false
            }, error: { (status) in
                print(status)
                isPresented = false
            }
        )
    }
}

struct CreatePaymentSource_Previews: PreviewProvider {
    static var previews: some View {
        CreatePaymentSourceView()
    }
}
