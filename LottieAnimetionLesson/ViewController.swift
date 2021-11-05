//
//  ViewController.swift
//  LottieAnimetionLesson
//
//  Created by UrataHiroki on 2021/11/05.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAnimation(showContent: "6", animationTime: 10) { bool in
            
            if bool == false{
                
                return
            }
            
            print("animationView.stop()")
        }
        
    }

}


extension ViewController{
    
    func showAnimation(showContent:String?,animationTime:Double?,completion: @escaping (Bool) -> Void){
        
        guard let content = showContent else { completion(false); return }
        guard let time = animationTime else { completion(false); return }
        
        let animationView = AnimationView()
        animationView.frame = CGRect(x: view.frame.maxX / 4, y: view.frame.maxY * 0.25, width: view.frame.width / 2, height: view.frame.width / 2)
        animationView.layer.cornerRadius = 15.0
        animationView.backgroundColor = .darkGray
        animationView.animation = Animation.named(content)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play(completion: nil)
        view.addSubview(animationView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            
            completion(true)
            animationView.stop()
            animationView.removeFromSuperview()
        }
    }
    
}
