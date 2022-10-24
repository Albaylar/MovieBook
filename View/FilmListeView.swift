//
//  ContentView.swift
//  InvioFilmApp
//
//  Created by Furkan Deniz Albaylar on 19.10.2022.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    @State var aranacakFilm = ""
    @State private var isEditing = false
    @State private var ButtonEditing = false
    
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
        self.filmListeViewModel.filmAramasıYap(filmIsmi: "")
    }
    var body: some View {
        NavigationView{
            VStack{
                TextField("      "+"Search", text: $aranacakFilm,onEditingChanged: {_ in}, onCommit: {
                self.filmListeViewModel.filmAramasıYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
            })
            .padding()
            .textFieldStyle(.roundedBorder)
            .background(Color(UIColor.darkGray))
            .onTapGesture {
                self.isEditing = true
            }
            .overlay(
                HStack {
                Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    
                        if isEditing {
                        Button(action: {
                        self.aranacakFilm = ""
            }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                    }
                }
            })
                HStack{
                    Button("Search"){
                        self.filmListeViewModel.filmAramasıYap(filmIsmi: aranacakFilm)
                    }
                    .font(.subheadline)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.05)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(60)
                    .shadow(radius: 5.0)
                    .padding()
                    
                }
                if filmListeViewModel.filmler.isEmpty  {
                    Spacer()
                    ActivityIndicator()
                    Spacer()
                    
                }
                else {
                        List(filmListeViewModel.filmler, id: \.imdbId){
                            film in
                            NavigationLink(destination: DetayView(imdbId: film.imdbId), label: {
                                HStack{
                                OzelImage(url: film.poster)
                                        .frame(width: UIScreen.main.bounds.width*0.25,height: UIScreen.main.bounds.height*0.18, alignment: .leading)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .padding()
                                VStack(alignment: .center){
                                    Text(film.title)
                                        .font(.title2)
                                        .foregroundColor(.blue)
                                        .padding()
                                    Text(film.year)
                                        .font(.title2)
                                        .foregroundColor(.green)
                                    Text(film.type)
                                        .font(.title2)
                                        .foregroundColor(.gray)
                                        .padding()
                                    }
                                
                                }
                                
                            })
                            
                        }
                        
                }
                    
             
            }.navigationTitle("Cinema & Series")
            
        }
        
    }
            
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
//Loading animasyonu
struct ActivityIndicator: View {
    
    @State var degress = 0.0
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.6)
            .stroke(.blue, lineWidth: 5.0)
            .frame(width: 60, height: 120)
            .rotationEffect(Angle(degrees: degress))
            .onAppear(perform: {self.start()})
    }
    
    func start() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.degress += 10.0
            }
            if self.degress == 360.0 {
                self.degress = 0.0
            }
        }
    }
}

