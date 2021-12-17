//
//  CourseList.swift
//  FitBook
//
//  Created by Salih Çakmak on 4.12.2021.
//

import SwiftUI

struct CourseList: View {
   @State var show = false
   @State var show2 = false
   @State var courses = courseData
    
    var body: some View {
      
        ScrollView {
            
            VStack (spacing:100){
                    
                ForEach(courses.indices, id:\.self) { index in
                    GeometryReader { geometry in
                        CourseView(show: self.$courses[index].show, course: self.courses[index])
                            .offset(y: self.courses[index].show ? -geometry.frame(in: .global).minY: 0)
                        }
                        .frame(height: self.courses[index].show ? screen.height :280)
                        .frame(maxWidth: self.courses[index].show ? .infinity : screen.width-60)
                        .zIndex(self.courses[index].show ? 1 : 0)
                }

                }
                .padding(.top, show ? 0: 60)// padding bıraktın unutma
                .padding(.bottom, show ? 0: 60)
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }
        .statusBar(hidden: true)

    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding  var show : Bool
    var course :Course
    
    var body: some View {

        ZStack (alignment: .top){
            
            VStack(alignment: .leading, spacing: 30) {
                Text("ilk cümlen  BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIM")
                Text("DENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKsadasdasdasdasdssssssssssssss")
                Text("DENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKsadasdasdasdasdssssssssssssss")
                Text("DENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKALIMDENEYELİM BAKsadasdasdasdasdssssssssssssss")
            }
            .padding(30)
            
            .frame(maxWidth : show ? .infinity :screen.width - 60, maxHeight: show ? .infinity : 0)
            .offset(y: show ? 310 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black, radius: 30, x: 0, y: 20)
            .opacity(show ? 1:0)

           
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(course.title)
                                    .font(.system(size: 27, weight: .bold))
                                    .foregroundColor(Color.white)
                                
                        Text(course.subtitle)
                                    .foregroundColor(Color.white)
                        Spacer()
                                
                    }
                    Spacer()
                    
                    VStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .frame(width: 44, height: 44)
                    .background(Color.black)
                    .clipShape(Circle())
                    .opacity(show ? 0.6 : 0)
                }
                .padding()
                
                //Spacer()

            }
            .padding(show ? 30 : 20)
            .padding(.top,show ? 30 : 10)
            .frame(maxWidth : show ? .infinity :screen.width - 60, maxHeight: show ? 220 : 280)
            .background(
                
                course.images
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width :show ? 400:350 ,height: show ? 400:330)
                    .frame(maxWidth:.infinity)
                    .cornerRadius(show ? 55 : 30)
                    
            )
            
            .onTapGesture {
                self.show.toggle()
            }
            

            
        }
        
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
        
            
    
    }
}


 struct Course : Identifiable {
    var id = UUID()
    var title : String
    var subtitle : String
    var images : Image
    var show : Bool
}
var courseData = [
    
    Course(title: "ABS Workout 1", subtitle: "1 - 10 Day", images: Image("fit4"), show: false),
    Course(title: "ABS Workout 2", subtitle: "11 - 20 Day", images: Image( "fit9"), show: false),
    Course(title: "ABS Workout 3", subtitle: "21 - 30 Day", images: Image( "fit8"), show: false)

    

]

