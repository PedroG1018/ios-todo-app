//
//  AddView.swift
//  TodoList
//
//  Created by Pedro Gutierrez on 8/16/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .cornerRadius(10)
                    .background(Color(""))
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
    
                })
            }
            .padding(14)
            
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(title: textFieldText)
        // go to previous view
        presentationMode.wrappedValue.dismiss()
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(""))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())

    }
}
