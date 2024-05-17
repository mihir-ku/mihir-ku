//
//  CardSelectionVC.swift
//  CardWorkout-Programmtic
//
//  Created by Mihir Kumar on 25/04/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    let cardImageView  = UIImageView()
//    let stopButton     = cwButton(backgroundColor: .systemRed, title: "Stop!")
//    let resetButton    = cwButton(backgroundColor: .systemGreen, title: "Reset ")
//    let ruleButton     = cwButton(backgroundColor: .systemBlue, title: "Rule")
    
    
    let stopButton     = cwButton(color: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let resetButton    = cwButton(color: .systemGreen, title: "Reset ", systemImageName: "arrow.clockwise.circle")
    let ruleButton     = cwButton(color: .systemBlue, title: "Rule", systemImageName: "list.bullet.circle")
    
    
//    var cards:[UIImage] = CardDeck.allValues
    //we can write any of the form both has the same meaning both are calling the the cardDeck values it up to us in which format we want to write.
    
    var cards          = CardDeck.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    @objc func resetTimer(){
        stopTimer()
        startTimer()
    }
    
    @objc func showRandomCard(){
        cardImageView.image = cards.randomElement()
    }
    
    func configureUI(){
        configureCardImageView() 
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
     
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
        
    }
    
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 10)
        ])
    }
    
    func configureRulesButton(){
        view.addSubview(ruleButton)
        ruleButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            ruleButton.widthAnchor.constraint(equalToConstant: 115),
            ruleButton.heightAnchor.constraint(equalToConstant: 50),
            ruleButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            ruleButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 10)
        ])
    }
    @objc func presentRulesVC(){
        present(RulesVC()  , animated: true)
    }
}
