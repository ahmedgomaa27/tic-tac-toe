//
//  Models.swift
//  tic tac toe
//
//  Created by Ahmed Hamdy Gomaa on 3/22/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation



class Game{

    static var baseId = 0

    var gameId:Int?
    var player1:String?
    var player2:String?
    var winner :String?
    var isFinished:Bool?
    var isAvailabe:Bool{return (player1?.isEmpty)! || (player2?.isEmpty)!}
    var game :[String:Any]?

     init() {

        gameId = Game.baseId
        Game.baseId += 1

    }





}

class Player{
    static var baseId = 0

    var playerId:Int?
    var name:String?
    var isAssigned:Bool?
    var gameId:Int?

    init() {
        playerId = Player.baseId
        Player.baseId += 1
    }


}
