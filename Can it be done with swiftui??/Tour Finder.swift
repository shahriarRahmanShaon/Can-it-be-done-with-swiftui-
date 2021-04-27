//
//  Tour Finder.swift
//  Can it be done with swiftui??
//
//  Created by sergio shaon on 21/4/21.
//

import SwiftUI
import Combine

struct Tour_Finder: View {
    
    var body: some View {
        TabView{
            home()
                .tabItem {
                Image("home")
                    .font(.title)
            }
            Text("search")
                .tabItem {
                    Image("search")
                        .font(.title)
                }
            Text("setting")
                .tabItem {
                    Image("Setting")
                        .font(.title)
                }
            Text("person")
                .tabItem {
                    Image("activity")
                        .font(.title)
                }
        }
    }
}

struct Tour_Finder_Previews: PreviewProvider {
    static var previews: some View {
        Detail()
    }
}

//MARK:- home view
struct home: View {
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                Button(action: {
                    
                }, label: {
                    Image("menu")
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image("Profile")
                })
            }
            Text("FInd More")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding(.top, 15)
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("Experiences")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Advantures")
                        .foregroundColor(.gray)
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Activities")
                        .foregroundColor(.gray)
                })
            }
            .padding([.top, .bottom], 15)
            MiddleVIew()
            Bottom()
                .padding(.top, 15)
        }
        .padding()
    }
}
//MARK:- detail view
struct Detail: View {
    var body: some View{
        VStack{
            Image("topbg")
                .resizable()
                .frame(height: 500)
                .aspectRatio(1.35, contentMode: .fill)
                .offset(y: -200)
                .padding(.bottom, -200)
            GeometryReader{ geo in
                VStack{
                    Color.white
                }
                
            }.background(Color.white)
            .clipShape(shape())
            .padding(.top, -75)
            
        }
    }
}

//MARK:- detail top view
struct DetailTop: View {
    var body: some View{
        
    }
}
//MARK:- detail view shape using bezier path
struct shape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
    
    
}
//MARK:- bottom view
struct Bottom: View {
    var body: some View{
        VStack{
            HStack(){
                Text("What you want?")
                    .fontWeight(.heavy)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("View all")
                        .foregroundColor(.gray)
                })
            }
            .padding([.top, .bottom], 15)
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 35){
                    VStack(spacing: 9){
                        Image("mcard1")
                        Text("Hiking")
                            .foregroundColor(.gray)
                    }
                    VStack(spacing: 9){
                        Image("mcard2")
                        Text("Hiking")
                            .foregroundColor(.gray)
                    }
                    VStack(spacing: 9){
                        Image("mcard3")
                        Text("Hiking")
                            .foregroundColor(.gray)
                    }
                    VStack(spacing: 9){
                        Image("mcard4")
                        Text("Hiking")
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.leading, 20)
                .padding([.top, .bottom], 15)
            })
            
        }
    }
}

//MARK:- middle view
struct MiddleVIew: View {
    @State var show = false
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack( spacing: 15){
                VStack(alignment: .leading){
                    Button(action: {
                        
                    }, label: {
                        Image("Card1")
                    })
                    Text("Fishing Time")
                        .fontWeight(.bold)
                    HStack{
                        Image("map").renderingMode(.original)
                        Text("Birganj, Dinajpur")
                            .foregroundColor(.gray)
                    }
                }
                VStack{
                    Button(action: {
                        self.show.toggle()
                    }, label: {
                        Image("Card2")
                    })
                    Text("Forest Camping")
                        .fontWeight(.bold)
                    HStack{
                        Image("map").renderingMode(.original)
                        Text("Dhap, Rangpur")
                            .foregroundColor(.gray)
                    }
                }
                .sheet(isPresented: $show, content: {
                    Detail()
                })
            }
            
            
        })
    }
}
