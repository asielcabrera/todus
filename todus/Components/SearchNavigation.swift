//
//  SearchNavigation.swift
//  todus
//
//  Created by Asiel Cabrera on 9/12/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct SearchNavigationView: View {
    
    let names = ["asiel", "cabrera", "gonzalez", "asdasdasD", "asdasdasd"]
    @State private var textToSearch: String = ""
    
    var body: some View {
        VStack {
            HStack {
                SearchBar(text: $textToSearch)
            }
            ForEach(self.names.filter{
                self.textToSearch.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.textToSearch)
            }, id: \.self) { name in
                Text(name)
            }
            Spacer()
        }
    }
}

struct SearchNavigation_Previews: PreviewProvider {
    static var previews: some View {
        SearchNavigationView()
    }
}


struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>){
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
            text = searchText
        }
    }
    
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
        
    }
}

