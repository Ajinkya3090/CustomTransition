//
//  ViewController.swift
//  CustomTransition
//
//  Created by Admin on 19/07/22.
//

import UIKit

class ViewController: UIViewController {

    var isAnimated : Bool = true

    @IBOutlet var easeInLabel: UILabel!
    @IBOutlet var easeOutLabel: UILabel!
    @IBOutlet var easeInOutLabel: UILabel!
    @IBOutlet var linearLabel: UILabel!
    @IBOutlet var transitionFlipFromLeftLabel: UILabel!
    @IBOutlet var transitionFlipFromRightLabel: UILabel!
    @IBOutlet var transitionCurlUpLabel: UILabel!
    @IBOutlet var transitionCurlDownLabel: UILabel!
    @IBOutlet var transitionCrossDissolveLabel: UILabel!
    @IBOutlet var transitionFlipFromTopLabel: UILabel!
    @IBOutlet var transitionFlipFromBottomLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    let durationOfAnimationInSecond = 2.1

    @IBAction func startAnimationButtonAction(_ sender: UIButton) {
      // Curve animation
      curveAnimation(view: easeInLabel, animationOptions: .curveEaseIn, isReset: isAnimated)
      curveAnimation(view: easeOutLabel, animationOptions: .curveEaseOut, isReset: isAnimated)
      curveAnimation(view: easeInOutLabel, animationOptions: .curveEaseInOut, isReset: isAnimated)
      curveAnimation(view: linearLabel, animationOptions: .curveLinear, isReset: isAnimated)
        
      // Transition animation
      transitionAnimation(view: transitionFlipFromLeftLabel, animationOptions: .transitionFlipFromLeft, isReset: isAnimated)
      transitionAnimation(view: transitionFlipFromRightLabel, animationOptions: .transitionFlipFromRight, isReset: isAnimated)
      transitionAnimation(view: transitionCurlUpLabel, animationOptions: .transitionCurlUp, isReset: isAnimated)
      transitionAnimation(view: transitionCurlDownLabel, animationOptions: .transitionCurlDown, isReset: isAnimated)
      transitionAnimation(view: transitionCrossDissolveLabel, animationOptions: .transitionCrossDissolve, isReset: isAnimated)
      transitionAnimation(view: transitionFlipFromTopLabel, animationOptions: .transitionFlipFromTop, isReset: isAnimated)
      transitionAnimation(view: transitionFlipFromBottomLabel, animationOptions: .transitionFlipFromBottom, isReset: isAnimated)
      
      isAnimated.toggle()
    }

    @IBAction func btnReset(_ sender: Any) {
        
    }
    
    func curveAnimation(view: UIView, animationOptions: UIView.AnimationOptions, isReset: Bool) {
      // Solution: Combine with .allowUserInteraction
      let combinedAnimationOptions: UIView.AnimationOptions = [animationOptions, .allowUserInteraction]
      
      let defaultXMovement: CGFloat = 240
      UIView.animate(withDuration: durationOfAnimationInSecond, delay: 0, options: combinedAnimationOptions, animations: {
        view.transform = isReset ? .identity : CGAffineTransform.identity.translatedBy(x: defaultXMovement, y: 0)
      }, completion: nil)
    }

//    @IBOutlet var easeInOutRepeatLabel: UILabel!
//    easeInOutRepeatLabel.layer.removeAllAnimations()

    
    func transitionAnimation(view: UIView, animationOptions: UIView.AnimationOptions, isReset: Bool) {
      // Combine transition annimation option with other animation options
      let combinedAnimationOptions: UIView.AnimationOptions = [animationOptions, .allowUserInteraction, .autoreverse, .repeat]
      
      UIView.transition(with: view, duration: durationOfAnimationInSecond, options: combinedAnimationOptions, animations: {
        view.backgroundColor = UIColor.init(named: isReset ? "darkGreen" :  "darkRed")
      }, completion: nil)
    }
}

