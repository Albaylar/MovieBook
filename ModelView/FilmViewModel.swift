//
//  FilmViewModel.swift
//  InvioFilm
//
//  Created by Furkan Deniz Albaylar on 19.10.2022.
//

import Foundation
import SwiftUI

class FilmListeViewModel : ObservableObject {
    //Observable Object = Publisher
    @Published var filmler = [FilmViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasıYap(filmIsmi : String) {
        downloaderClient.filmleriIndir(search: filmIsmi) { (sonuc) in
            switch sonuc {
                case.failure(let hata):
                    print(hata)
                case.success(let filmDizisi):
                    if let filmDizisi = filmDizisi { // Optionaldan çıkardık if let kullanarak.
                        DispatchQueue.main.async {
                            //Kullannıcı arayüzünde bir değiişklik yapıcak. 
                            self.filmler = filmDizisi.map(FilmViewModel.init)
                            // map = neyi kullanarak dönüştürmek istediğimizi söylüyor.(Bu şekilde döndürebiliyoruz). İnternetten aldığım filmeleri filmViewModela dönüştürüyoruz.
                        }
                }
            }
        }
    }
    
}
//Kullanıcıya gösterilecek modeller
struct FilmViewModel{
    
    let film : Film
    
    var title : String {
        film.title
    }
    var poster : String {
        film.poster
    }
    var year : String {
        film.year
    }
    var imdbId : String {
        film.imdbId
    }
    var type : String {
        film.type
    }
}

