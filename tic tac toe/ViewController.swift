//
//  ViewController.swift
//  tic tac toe
//
//  Created by Ahmed Hamdy Gomaa on 3/22/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var mRef : DatabaseReference!

    @IBOutlet weak var gameCollectionView: UICollectionView!
    
    @IBAction func startNewGame(_ sender: UIButton) {


        // check if there's available games
        //
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameCollectionView.isHidden = true
        configureDataBase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }

    func configureDataBase(){
        mRef = Database.database().reference()
//        let temp = Game()
//        temp.player1 = "ahmed"
//        mRef.child("Games").child("game1").child("player1").setValue("nil")
//        mRef.child("Games").child("game1").child("player2").setValue("nil")

        let player1 = Player(name: "muhammad", DatabaseReference: mRef)
        let Player2 = Player(name: "ahmed", DatabaseReference: mRef)
        var game = Game(DatabaseRef: mRef, player1: player1, player2: Player2)


    }

}

