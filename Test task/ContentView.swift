//
//  ContentView.swift
//  Test task
//
//  Created by Akrom on 02.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var pressed = true
    @State var forperiods = 0
    
    let red = Color(red: 241/255, green: 100/255, blue: 94/255)
    let redLight = Color(red: 246/255, green: 165/255, blue: 160/255)
    let gray = Color(red: 164/255, green: 177/255, blue: 202/255)
    let background = Color(red: 248/255, green: 249/255, blue: 251/255)
    let lineColor = Color(red: 255/255, green: 181/255, blue: 69/255)
    let backgroundText = Color(red: 0.639, green: 0.706, blue: 0.761)
    let borderColor = Color(red: 0.914, green: 0.925, blue: 0.946)
    
    var body: some View {
        let tableElement = Text("")
            .frame(width: 75, height: 37, alignment: .center)
            .border(borderColor, width: 1)
            .background(.white)
            .padding(.all, 0)
            .padding(.top, -1)
        let tableElementBig = Text("")
            .frame(width: 75, height: 52, alignment: .center)
            .border(borderColor, width: 1)
            .background(.white)
            .padding(.all, 0)
            .padding(.top, -1)
        VStack (spacing: 0){
            HStack {
                Button(action: {
                            print("Button back pressed")
                        }) {
                            Image(systemName: "chevron.left")
                                .frame(width: 12, height: 21, alignment: .leading)
                                .padding(.leading, 16)
                                .font(.system(size: 25))
                        }
                Text("Индивидуальный учебный план")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("SFUIDisplay-Semibold", size: 16))
                    .padding(.leading, 37)
                    .padding(.trailing, 28)
                    
                Button(action: {
                    let url = URL(string: blogPost.documentURL!)!
                    let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
                            if let localURL = localURL {
                                    if let string = try? String(contentsOf: localURL) {
                                            print(string)
                                    }
                            }
                    }
                    task.resume()

                }) {
                            Image(systemName: "arrow.down.doc")
                                .frame(width: 18, height: 22, alignment: .trailing)
                                .font(.system(size: 25))
                                .padding(.trailing, 5)
                                .padding(.vertical, 10)
                }
            }.frame(maxWidth: .infinity, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [red, redLight]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
            HStack {
                VStack (spacing: 0) {
                    VStack{
                        Text("ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН")
                        Text("НА \(blogPost.academicYear!)")
                    }.font(.custom("SFUIDisplay-Bold", size: 14).bold())
                        .padding(.top, 18)
                        .padding(.bottom, 12)
                        .multilineTextAlignment(.center)
                        
                    Text("Surname Name Father's name")
                        .padding(.all, 10)
                        .background(gray)
                        .foregroundColor(.white)
                        .cornerRadius(2)
                        .font(.custom("SFUIDisplay-Semibold", size: 14))
                }
            }.padding(.bottom, 17)
            
            VStack {
                HStack{
                    let semester = Text("Семестр " )
                        .bold()
                        .font(.custom("SFUIDisplay-Medium", size: 15))
                        .padding(.top, 10)
                        .onTapGesture{
                            pressed = !pressed
                        }
                    VStack{
                        let line = Rectangle().frame(width: 195, height: 3, alignment: .center).foregroundColor(lineColor)
                        if !pressed{
                            HStack(spacing: 0){
                                semester
                                Text(blogPost.semesters?[0].number! ?? "").padding(.top, 10)
                            }.foregroundColor(backgroundText)
                            line.opacity(0.00001)
                        } else {
                            HStack(spacing: 0){
                                semester
                                Text(blogPost.semesters?[0].number! ?? "").padding(.top, 10)
                            }
                            line.opacity(1)
                        }
                    }.padding(.all, 0)
                    VStack{
                        let line2 = Rectangle().frame(width: 195, height: 3, alignment: .center).foregroundColor(lineColor)
                        if pressed{
                            HStack(spacing: 0){
                                semester
                                Text(blogPost.semesters?[1].number! ?? "").padding(.top, 10)
                            }.foregroundColor(backgroundText)
                            line2.opacity(0.00001)
                        } else{
                            HStack(spacing: 0){
                                semester
                                Text(blogPost.semesters?[1].number! ?? "").padding(.top, 10)
                            }
                            line2.opacity(1)
                        }
                    }.padding(.all, 0)
                }
                .border(borderColor, width: 1)
                HStack{
                    Spacer()
                    Text("Аудиторные занятия в часах").padding(.trailing, 38)
                        .font(.custom("SFUIDisplay-Light", size: 12))
                        .foregroundColor(backgroundText)
                        .padding(.vertical, 6)
                }
                VStack (spacing: 0) {
                    VStack (spacing: 0) {
                       let line =  Rectangle().frame(width: 133, height: 1, alignment: .center)
                            .foregroundColor(borderColor)
                            .padding(.leading, 17)
                        HStack (alignment: .top, spacing: 0){
                            VStack{
                                Text("Наименование дисциплины")
                                    .padding(.leading, 10)
                                    .font(.custom("SFUIDisplay-Regular", size: 12))
                                    .foregroundColor(backgroundText)
                                line
                            }
                            ZStack{
                                tableElement
                                Text("Лекция").foregroundColor(backgroundText)
                                    .font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                            ZStack{
                                tableElement
                                Text("Семинар").foregroundColor(backgroundText)
                                    .font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                            ZStack{
                                tableElement
                                Text("Лабарат.").foregroundColor(backgroundText)
                                    .font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                        }
                        HStack (alignment: .top, spacing: -2) {
                            VStack(spacing: 0){
                                Text(blogPost.semesters?[0].disciplines?[0].disciplineName?.nameRu ?? "")
                                    .padding(.leading, 16)
                                    .padding(.trailing, 50)
                                    .padding(.vertical, 11)
                                    .font(.custom("SFUIDisplay-Medium", size: 12))
                                line
                            }
                            ZStack{
                                tableElementBig
                                HStack{
                                    let a = Text(blogPost.semesters?[0].disciplines?[0].lesson?[0].realHours! ?? "")
                                    let b = Text(blogPost.semesters?[0].disciplines?[0].lesson?[0].hours! ?? "")
                                    if(a == b){
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.green)
                                    } else {
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.red)
                                    }
                                }.font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                            ZStack{
                                tableElementBig
                                HStack{
                                    let a = Text(blogPost.semesters?[0].disciplines?[0].lesson?[1].realHours! ?? "")
                                    let b = Text(blogPost.semesters?[0].disciplines?[0].lesson?[1].hours! ?? "")
                                    if(a == b){
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.green)
                                    } else {
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.red)
                                    }
                                }.font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                            ZStack{
                                tableElementBig
                                HStack{
                                    let a = Text(blogPost.semesters?[0].disciplines?[0].lesson?[2].realHours! ?? "")
                                    let b = Text(blogPost.semesters?[0].disciplines?[0].lesson?[2].hours! ?? "")
                                    if(a == b){
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.green)
                                    } else {
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.red)
                                    }
                                }.font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                        }
                        HStack (alignment: .top, spacing: -2){
                            VStack{
                                Text(blogPost.semesters?[0].disciplines?[1].disciplineName?.nameRu ?? "")
                                    .padding(.leading, 16)
                                    .padding(.trailing, 10)
                                    .padding(.top, 12)
                                    .padding(.bottom, 1)
                                    .font(.custom("SFUIDisplay-Medium", size: 12))
                                line
                            }
                            ZStack{
                                tableElement
                                HStack{
                                    let a = Text(blogPost.semesters?[0].disciplines?[1].lesson?[0].realHours! ?? "")
                                    let b = Text(blogPost.semesters?[0].disciplines?[1].lesson?[0].hours! ?? "")
                                    if(a == b){
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.green)
                                    } else {
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.red)
                                    }
                                }.font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                            ZStack{
                                tableElement
                                HStack{
                                    let a = Text(blogPost.semesters?[0].disciplines?[1].lesson?[1].realHours! ?? "")
                                    let b = Text(blogPost.semesters?[0].disciplines?[1].lesson?[1].hours! ?? "")
                                    if(a == b){
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.green)
                                    } else {
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.red)
                                    }
                                }.font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                            ZStack{
                                tableElement
                                HStack{
                                    let a = Text(blogPost.semesters?[0].disciplines?[1].lesson?[2].realHours! ?? "")
                                    let b = Text(blogPost.semesters?[0].disciplines?[1].lesson?[2].hours! ?? "")
                                    if(a == b){
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.green)
                                    } else {
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.red)
                                    }
                                }.font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                        }
                        HStack (alignment: .top, spacing: -2){
                            VStack{
                                Text(blogPost.semesters?[0].disciplines?[2].disciplineName?.nameRu ?? "")
                                    .padding(.leading, 16)
                                    .padding(.trailing, 14)
                                    .padding(.vertical, 12)
                                    .font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                            ZStack{
                                tableElementBig
                                HStack{
                                    let a = Text(blogPost.semesters?[0].disciplines?[2].lesson?[0].realHours! ?? "")
                                    let b = Text(blogPost.semesters?[0].disciplines?[2].lesson?[0].hours! ?? "")
                                    if(a == b){
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.green)
                                    } else {
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.red)
                                    }
                                }.font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                            ZStack{
                                tableElementBig
                                HStack{
                                    let a = Text("")
                                    let b = Text("")
                                    if(a == b){
                                        a.foregroundColor(Color.green)
                                        b.foregroundColor(Color.green)
                                    } else {
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.red)
                                    }
                                }.font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                            ZStack{
                                tableElementBig
                                HStack{
                                    let a = Text(blogPost.semesters?[0].disciplines?[2].lesson?[1].realHours! ?? "")
                                    let b = Text(blogPost.semesters?[0].disciplines?[2].lesson?[1].hours! ?? "")
                                    if(a == b){
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.green)
                                    } else {
                                        a.foregroundColor(Color.green)
                                        Text("/")
                                        b.foregroundColor(Color.red)
                                    }
                                }.font(.custom("SFUIDisplay-Medium", size: 12))
                            }
                        }
                    }
                }
                Spacer()
            }.background(background)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



