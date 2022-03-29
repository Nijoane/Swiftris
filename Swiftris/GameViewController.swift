//
//  GameViewController.swift
//  Swiftris
//
//  Created by Nicaely Joane on 12/02/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewConfig()
    }
    
    func viewConfig() {
        let skView = view as? SKView
        skView?.isMultipleTouchEnabled = false
        guard
            let viewSize = skView?.bounds.size
        else { return }

        let scene = GameScene(size: viewSize)
        scene.scaleMode = .aspectFill
        skView?.presentScene(scene)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
