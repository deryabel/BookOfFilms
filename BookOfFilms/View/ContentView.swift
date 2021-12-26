//
//  ContentView.swift
//  BookOfFilms
//
//  Created by Derya Bel on 26.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            DownloaderClient().filmleriIndir(search: "titanic") { (sonuc) in
                switch sonuc {
                case .success(let filmDizisi):
                    print(filmDizisi)
                case .failure(let hata):
                    print(hata.localizedDescription)
                }
            }
        } label: {
            Text("Test yap")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
