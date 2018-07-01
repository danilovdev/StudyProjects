//
//  ViewController.swift
//  PlayingCardDemo
//
//  Created by Alexey Danilov on 27.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
            swipeGesture.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipeGesture)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
            playingCardView.addGestureRecognizer(tapGesture)
            
            let pinchGesture = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinchGesture)
        }
    }

    var playingCardDeck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        if let card = playingCardDeck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default: break
        }
    }

}

