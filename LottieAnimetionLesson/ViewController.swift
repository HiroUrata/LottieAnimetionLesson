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
        
        let button = UIButton(frame: CGRect(x: view.frame.maxX / 4, y: view.frame.maxY * 0.7, width: view.frame.width / 2, height: view.frame.height / 15))
        button.backgroundColor = .systemTeal
        button.setTitle("ShowAnimation", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(showAnimation), for: .touchDown)
        view.addSubview(button)

    }
    
    @objc func showAnimation(button:UIButton){
        
        button.showAnimation(showContent: "5", animationTime: 10, targetView: self.view) { result in

            if result == false{

                return
            }

            print("終わり")
        }
    }

}


extension UIButton{
    
    func showAnimation(showContent:String?,animationTime:Double?,targetView:UIView,completion: @escaping (Bool) -> Void){
        
        guard let content = showContent else { completion(false); return }
        guard let time = animationTime else { completion(false); return }
        
        let underView = UIView(frame: CGRect(x: targetView.frame.maxX / 4, y: targetView.frame.maxY * 0.25, width: targetView.frame.width / 2, height: targetView.frame.width / 2))
        underView.layer.cornerRadius = 15.0
        underView.backgroundColor = .darkGray
        underView.alpha = 0.7
        targetView.addSubview(underView)
        
        let animationView = AnimationView()
        animationView.frame = CGRect(x: targetView.frame.maxX / 4, y: targetView.frame.maxY * 0.25, width: targetView.frame.width / 2, height: targetView.frame.width / 2)
        animationView.layer.cornerRadius = 15.0
        animationView.backgroundColor = .clear
        animationView.animation = Animation.named(content)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play(completion: nil)
        targetView.addSubview(animationView)
    
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            
            completion(true)
            animationView.stop()
            animationView.removeFromSuperview()
            underView.removeFromSuperview()
        }
    }
    
}
