//
//  SnsView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI
import UIKit


struct SnsView: View {
    @EnvironmentObject private var family : Family
    @EnvironmentObject private var userLoader : UserLoader
    @State var isWrite:Bool = false
    @State var isClick:Int = 1
    @State private var date = Date()
    
    var body: some View {
        NavigationView{
            
                //                Color.mainGrey.edgesIgnoringSafeArea(.all)  // 전체배경색 변화
                
                VStack {
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(family.storys, id: \.id) { story in
                                NavigationLink(destination: SnsStoryView(story: story)) {
                                    storyView(story: story)
                                }
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .frame(width: 350)
                    .frame(height: 30)
//                    .padding(.bottom,10)
                    .padding(.top,30)
                    postMenu(isClick: $isClick)
                    if (isClick == 1 ){
                        ZStack(alignment: .bottomTrailing){
                            ScrollView{
                                LazyVStack{
                                    ForEach(family.posts, id: \.id) { post in
                                        NavigationLink(destination: SnsPostDetailView(post:post)) {
                                            SnsPostRow(post:post)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                            VStack{
                                if let user = userLoader.user{
                                    if isWrite {
                                        NavigationLink(destination: SnsPostWriteView(user:user,family:family)) {
                                            Image("postWrite")
                                                .padding(13)     
                                                .background(Color.mainBlue)
                                                .foregroundColor(.white)
                                                .clipShape(Circle())
                                        }
                                        NavigationLink(destination: SnsStoryWriteView(user:user,family:family)) {
                                            Image("storyWrite")
                                                .padding(13)
                                                .background(Color.mainBlue)
                                                .foregroundColor(.white)
                                                .clipShape(Circle())
                                        }
                                    }
                                    Button {
                                        if isWrite {
                                            isWrite = false
                                        }
                                        else {
                                            isWrite = true
                                        }
                                        //                    showNewTweetView.toggle()
                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                    .background(Color.mainBlue)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                }
                            }
                            .padding()
                        
                            
                            //                MyView()
                        }
                        
                    }
                    else if (isClick == 2) {
                        VStack{
                            DatePicker("추억", selection: $date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                            //달력과 텍스트의 위치를 지정하는 프레임
                                .frame(maxHeight: 700)
                        }
                    }
                }
            }
        }
    }


struct storyView : View {
    var story : Story
    var body : some View {
        VStack{
            Image(systemName: "person")
                .resizable()
//                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 0.5))
            Text("\(story.createdBy)")
                .font(.caption)
                .fontWeight(.thin)
                .padding(.bottom, 6)
        }
    }
}
struct postMenu : View {
    @Binding var isClick : Int
    var body : some View {
        HStack{
            Button(action: { isClick=1 }) {
              Capsule()
                .fill(Color.mainBlue)
                .frame(maxWidth: 100, minHeight: 30, maxHeight: 45)
                .overlay(Text("Family")
                  .font(.system(size: 20)).fontWeight(.medium)
                  .foregroundColor(Color.white))
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
            }
            Button(action: { isClick=2 }) {
              Capsule()
                .fill(Color.mainBlue)
                .frame(maxWidth: 100, minHeight: 30, maxHeight: 45)
                .overlay(Text("Memory")
                  .font(.system(size: 20)).fontWeight(.medium)
                  .foregroundColor(Color.white))
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
            }
                
        }
        .padding(.top,10)
    }
}
/*
struct MyView: UIViewControllerRepresentable {
    typealias UIViewControllerType = FloatingButtonViewController
    func makeUIViewController(context: Context) -> FloatingButtonViewController {
        let vc = FloatingButtonViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: FloatingButtonViewController, context: Context) {
        
    }
}
class FloatingButtonViewController: UIViewController {
    private lazy var floatingButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .blue
        config.cornerStyle = .capsule
        config.image = UIImage(systemName: "plus")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
        button.configuration = config
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.addTarget(self, action: #selector(didTapFloatingButton), for: .touchUpInside)
        return button
    }()
    private let postWriteButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .blue
        config.cornerStyle = .capsule
        config.image = UIImage(named: "postWrite")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 5, weight: .medium))
        button.configuration = config
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.alpha = 0.0
        return button
    }()
    private let storyWriteButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .blue
        config.cornerStyle = .capsule
        config.image = UIImage(named: "storyWrite")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 5, weight: .medium))
        button.configuration = config
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.alpha = 0.0
        return button
    }()
    private var isActive: Bool = false {
        didSet {
            showActionButtons()
        }
    }
    private var animation: UIViewPropertyAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 60 - 8 - 20, y: view.frame.size.height - 60 - 8 - 40, width: 60, height: 60)
        postWriteButton.frame = CGRect(x: view.frame.size.width - 60 - 8 - 20, y: view.frame.size.height - 60 - 80 - 8 - 40, width: 60, height: 60)
        storyWriteButton.frame = CGRect(x: view.frame.size.width - 60 - 8 - 20, y: view.frame.size.height - 60 - 152 - 8 - 8 - 40, width: 60, height: 60)
        
    }
    
    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(floatingButton)
        view.addSubview(postWriteButton)
        view.addSubview(storyWriteButton)
    }
    
    
    @objc private func didTapFloatingButton() {
        isActive.toggle()
    }
    
    private func showActionButtons() {
        popButtons()
        rotateFloatingButton()
    }
    
    private func popButtons() {
        if isActive {
            postWriteButton.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1)
            UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.3, options: [.curveEaseInOut], animations: { [weak self] in
                guard let self = self else { return }
                self.postWriteButton.layer.transform = CATransform3DIdentity
                self.postWriteButton.alpha = 1.0
            })
            storyWriteButton.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1)
            UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.3, options: [.curveEaseInOut], animations: { [weak self] in
                guard let self = self else { return }
                self.storyWriteButton.layer.transform = CATransform3DIdentity
                self.storyWriteButton.alpha = 1.0
            })
        } else {
            UIView.animate(withDuration: 0.15, delay: 0.2, options: []) { [weak self] in
                guard let self = self else { return }
                self.postWriteButton.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.1)
                self.postWriteButton.alpha = 0.0
                self.storyWriteButton.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.1)
                self.storyWriteButton.alpha = 0.0
            }
        }
    }
    
    private func rotateFloatingButton() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        let fromValue = isActive ? 0 : CGFloat.pi / 4
        let toValue = isActive ? CGFloat.pi / 4 : 0
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 0.3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        floatingButton.layer.add(animation, forKey: nil)
    }
    
}*/
struct SnsView_Previews: PreviewProvider {
    static var previews: some View {
        SnsView()
    }
}
