//
//  Models.swift
//  tic tac toe
//
//  Created by Ahmed Hamdy Gomaa on 3/22/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation
import Firebase

//class Game{
//
//    static var baseId = 0
//
//    var gameId:Int
//    var player1Id:String //TODO: string or int
//    var player2Id:String
//    var winnerId :String
//    var isFinished:Bool
//    var isAvailabe:Bool{return (player1Id == "-1") || (player2Id == "-1") }
//    var gameArray:[String]
//    var game :[String:Any]
//
//    init(DatabaseRef: DatabaseReference, player1: Player? = nil, player2: Player? = nil) {
//
//        gameId = Game.baseId
//        Game.baseId += 1
//
//        player1Id = "-1"
//        player2Id = "-1"
//        winnerId = "-1"
//        isFinished = false
//        gameArray = ["X","X","X",
//                    "X","X","X",
//                    "X","X","X"]
//        // TODO: initiallize almost all properties before assgning them to game dictionary
//
//        game = [
//            Constants.GameKeys.gameId: gameId,
//            Constants.GameKeys.player1Id: String(describing: player1?.playerId ?? -1),
//            Constants.GameKeys.player2Id: String(describing: player2?.playerId ?? -1),
//            Constants.GameKeys.winnerId: winnerId,
//            Constants.GameKeys.isFinished: isFinished,
//            Constants.GameKeys.isAvailabe: false,
//            Constants.GameKeys.gameArray: gameArray
//        ]
//
//        DatabaseRef.child("Games").child("game\(gameId)").setValue(game)
//    }
//
//
//}
//
//
//
//
//class Player{
//    static private var baseId = 0
//
//    var playerId:Int
//    var name:String
//    var isAssigned:Bool{
//        return !(gameId == -1)
//    }
//    var gameId:Int{
//        didSet{
//            if gameId != -1 {
//                //TODO: get the game with gameId and update its player
//            }
//        }
//    }
//    var player:[String:Any]?
//
//
//    init(name: String?, DatabaseReference DatabaseRef: DatabaseReference? = nil) {
//        playerId = Player.baseId
//        Player.baseId += 1
//
//        self.name = name ?? "nil"
//        self.gameId = -1
//
//        player = [
//            Constants.Playerkeys.playerId: playerId ,
//            Constants.Playerkeys.name: self.name,
//            Constants.Playerkeys.isAssigned: isAssigned,
//            Constants.Playerkeys.gameId: gameId,
//        ]
//
//        if DatabaseRef != nil {
//            self.add(toDatabase: DatabaseRef!)
//        }
//    }
//
//    func add(toDatabase DatabaseRef: DatabaseReference) {
//        DatabaseRef.child("Players").child("player\(playerId)").setValue(player)
//    }
//
//    func add(toGame game: Game, DatabaseRef: DatabaseReference?, isDatabaseUpdated: Bool) {
//        self.gameId = game.gameId
//
//        if isDatabaseUpdated {
//            DatabaseRef?.child("Players/player\(playerId)/gameId").setValue(self.gameId)
//        }
//
//    }
//}

func makeGame(DatabaseRef: DatabaseReference) -> NSDictionary{
    let game = [
        Constants.GameKeys.gameId: -1,
        Constants.GameKeys.player1Id: -1,
        Constants.GameKeys.player2Id: -1,
        Constants.GameKeys.winnerId: false,
        Constants.GameKeys.isFinished: false,
        Constants.GameKeys.isAvailabe: false,
        Constants.GameKeys.gameArray: []
    ] as [String : Any]
    
    DatabaseRef.child("Games").childByAutoId().setValue(game)
    
    return game as NSDictionary
    }

func makePlayer(name: String, DatabaseRef: DatabaseReference) -> NSDictionary{

    let player = [
        Constants.Playerkeys.playerId: -1 ,
        Constants.Playerkeys.name: name,
        Constants.Playerkeys.isAssigned: false,
        Constants.Playerkeys.gameId: -1,
        ] as [String : Any]
    
    DatabaseRef.child("Players").childByAutoId().setValue(player)
    return player as NSDictionary
}

func addPlayerToGame(playerId: Int, gameId: Int, DatabaseRef: DatabaseReference){
    
}

//func getGame(Id: String) -> NSDictionary{
//
//}

//func getAllGames() -> [NSDictionary]{
//
//}

func getAvailableGame(DatabaseRef: DatabaseReference) -> NSDictionary{
    let refHandle = DatabaseRef.child("Games").observeSingleEvent(of: .value, with: { (snapshot) in
        let postDict = snapshot.value as? [String : AnyObject] ?? [:]
        print(postDict)
    })
    return [:]
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
