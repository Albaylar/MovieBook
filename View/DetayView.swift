//
//  DetayView.swift
//  InvioFilm
//
//  Created by Furkan Deniz Albaylar on 22.10.2022.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        ScrollView{
        VStack {
                OzelImage(url: filmDetayViewModel.filmDetail?.poster ?? "Ozel Image gösterilecek").frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height*0.5, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                
                Text(filmDetayViewModel.filmDetail?.title ?? "Başlık gösterilecek")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding()
                
                Text(filmDetayViewModel.filmDetail?.year ?? "Yıl gösterilecek")
                    
                    .font(.title3)
                    .foregroundColor(Color.green)
                Text(filmDetayViewModel.filmDetail?.genre ?? "Filmin türü gösterilecek.")
                    .font(.title3)
                    .foregroundColor(.green)
                
                Text(filmDetayViewModel.filmDetail?.plot ?? "Film açıklaması gösterilecek")
                    .frame(width: UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.13, alignment: .center
                    )
                        .font(.title3)
                        .foregroundColor(.gray)
                Text("Director : \(filmDetayViewModel.filmDetail?.director ?? "Yönetmen gösterilecek.")")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .padding()
                Text("Awards : \(filmDetayViewModel.filmDetail?.awards ?? "Aldığı ödüller.")")
                    .font(.title3)
                    .foregroundColor(.green)
                    .frame(width: UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.07)
                Text("IMDB :  \(filmDetayViewModel.filmDetail?.imdbRating ?? "İmdb Puanı.")")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding()
            }
            
            
            
            .onAppear {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        }
    
    }
}
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "")
    }
}
