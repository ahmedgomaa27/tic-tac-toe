//
//  Models.swift
//  tic tac toe
//
//  Created by Ahmed Hamdy Gomaa on 3/22/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation
import Firebase

class Game{

    static var baseId = 0

    var gameId:Int
    var player1Id:String? //TODO: string or int
    var player2Id:String?
    var winnerId :String?
    var isFinished:Bool?
    var isAvailabe:Bool{return (player1Id?.isEmpty)! || (player2Id?.isEmpty)!}
    var gameArray:[String]?
    var game :[String:Any]?

//    init(DatabaseRef: DatabaseReference) {
//    
//        gameId = Game.baseId
//        Game.baseId += 1
//        
////        DatabaseRef.child("Games").child("game\(gameId!)").child(Constants.GameKeys.player1Id).setValue("nil")
//        
//        game = [
//            Constants.GameKeys.gameId: gameId ?? -1,
//            Constants.GameKeys.player1Id: "nil",
//            Constants.GameKeys.player2Id: "nil",
//            Constants.GameKeys.winnerId: "nil",
//            Constants.GameKeys.isFinished: false,
//            Constants.GameKeys.isAvailabe: false,
//            ]
//        
//        DatabaseRef.child("Games").child("game\(gameId!)").setValue(game)
//
//        
////        DatabaseRef.child("Games").child("game\(gameId!)").child(Constants.GameKeys.player1).setValue("nil")
////        DatabaseRef.child("Games").child("game\(gameId!)").child(Constants.GameKeys.player2).setValue("nil")
////        DatabaseRef.child("Games").child("game\(gameId!)").child(Constants.GameKeys.winnerId).setValue("nil")
////        DatabaseRef.child("Games").child("game\(gameId!)").child(Constants.GameKeys.isAvailabe).setValue("nil")
////        DatabaseRef.child("Games").child("game\(gameId!)").child(Constants.GameKeys.isFinished).setValue("nil")
//
//
//        
//
//    }
    
    init(DatabaseRef: DatabaseReference, player1: Player? = nil, player2: Player? = nil) {
        
        gameId = Game.baseId
        Game.baseId += 1
        
        //        DatabaseRef.child("Games").child("game\(gameId!)").child(Constants.GameKeys.player1Id).setValue("nil")
        
        // TODO: initiallize almost all properties before assgning them to game dictionary
        
        game = [
            Constants.GameKeys.gameId: gameId,
            Constants.GameKeys.player1Id: String(describing: player1?.playerId ?? -1),
            Constants.GameKeys.player2Id: String(describing: player2?.playerId ?? -1),
            Constants.GameKeys.winnerId: -1,
            Constants.GameKeys.isFinished: false,
            Constants.GameKeys.isAvailabe: false,
            Constants.GameKeys.gameArray: ["X","X","X",
                                           "X","X","X",
                                           "X","X","X"]
        ]
        
        DatabaseRef.child("Games").child("game\(gameId)").setValue(game)
    }
}









class Player{
    static private var baseId = 0

    var playerId:Int
    var name:String
    var isAssigned:Bool{
        return !(gameId == -1)
    }
    var gameId:Int{
        didSet{
            if gameId != -1 {
                //TODO: get the game with gameId and update its player
            }
        }
    }
    var player:[String:Any]?
  
    
    init(name: String?, DatabaseReference DatabaseRef: DatabaseReference? = nil) {
        playerId = Player.baseId
        Player.baseId += 1
        
        self.name = name ?? "nil"
        self.gameId = -1
        
        player = [
            Constants.Playerkeys.playerId: playerId ,
            Constants.Playerkeys.name: self.name,
            Constants.Playerkeys.isAssigned: isAssigned,
            Constants.Playerkeys.gameId: gameId,
        ]
        
        if DatabaseRef != nil {
            self.add(toDatabase: DatabaseRef!)
        }
    }
    
    func add(toDatabase DatabaseRef: DatabaseReference) {
        DatabaseRef.child("Players").child("player\(playerId)").setValue(player)
    }
    
    func add(toGame game: Game, DatabaseRef: DatabaseReference?, isDatabaseUpdated: Bool) {
        self.gameId = game.gameId
        
        if isDatabaseUpdated {
            DatabaseRef?.child("Players/player\(playerId)/gameId").setValue(self.gameId)
        }
        
    }
}







struct Constants {
    
    // MARK: GameKeys
    struct GameKeys {
        static let gameId = "gameId"
        static let player1Id = "player1Id"
        static let player2Id = "player2Id"
        static let winnerId = "winnerId"
        static let isFinished = "isFinished"
        static let isAvailabe = "isAvailabe"
        static let gameArray = "gameArray"

    }
    
    //MARK: Playerkeys
    struct Playerkeys {
        static let playerId = "playerId"
        static let name = "name"
        static let isAssigned = "isAssigned"
        static let gameId = "gameId"
        }

}
