//
//  MatchInfoModel.swift
//  MyFootballApp
//
//  Created by Ulmasbek on 2021/10/21.
//

import Foundation

struct MatchInfoModel:Codable {
    
    let date:String?
    let calc:Bool?
    let has_video:Bool?
    let live:Bool?
    let storage:Bool?
    let sub:Bool?
    let tournament:Tournament?
    let team1:Team?
    let team2:Team?
    
    enum CodingKeys: String, CodingKey {
        
       
        case date = "date"
        case calc = "calc"
        case has_video = "has_video"
        case live = "live"
        case storage = "storage"
        case sub = "sub"
        case tournament = "tournament"
        case team1 = "team1"
        case team2 = "team2"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        date = try values.decodeIfPresent(String.self, forKey: .date)
        calc = try values.decodeIfPresent(Bool.self, forKey: .calc)
        has_video = try values.decodeIfPresent(Bool.self, forKey: .has_video)
        live = try values.decodeIfPresent(Bool.self, forKey: .live)
        storage = try values.decodeIfPresent(Bool.self, forKey: .storage)
        sub = try values.decodeIfPresent(Bool.self, forKey: .sub)
        tournament = try values.decodeIfPresent(Tournament.self, forKey: .tournament)
        team1 = try values.decodeIfPresent(Team.self, forKey: .team1)
        team2 = try values.decodeIfPresent(Team.self, forKey: .team2)
        
    }
    
    init() {
        
        date = ""
        calc = false
        has_video = false
        live = false
        storage = false
        sub = false
        tournament = Tournament()
        team1 = Team()
        team2 = Team()
    
    }
    
}

struct Tournament:Codable {
    
    let id:Int?
    let name_eng:String?
    let name_rus:String?
    
    enum CodingKeys: String, CodingKey {
        
       
        case id = "id"
        case name_eng = "name_eng"
        case name_rus = "name_rus"
        
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decodeIfPresent(Int.self, forKey: .id)
       
        name_eng = try values.decodeIfPresent(String.self, forKey: .name_eng)
        name_rus = try values.decodeIfPresent(String.self, forKey: .name_rus)
        
        
        
    }
    
    init() {
        
        id = 0
        
        name_eng = ""
        name_rus = ""
       
       
    }
}

struct Team:Codable {
    
    let id:Int?
    let name_eng:String?
    let name_rus:String?
    let abbrev_eng:String?
    let abbrev_rus:String?
    let score:Int?
    
    enum CodingKeys: String, CodingKey {
        
       
        case id = "id"
        case name_eng = "name_eng"
        case name_rus = "name_rus"
        case abbrev_eng = "abbrev_eng"
        case abbrev_rus = "abbrev_rus"
        case score = "score"
        
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decodeIfPresent(Int.self, forKey: .id)
       
        name_eng = try values.decodeIfPresent(String.self, forKey: .name_eng)
        name_rus = try values.decodeIfPresent(String.self, forKey: .name_rus)
        abbrev_eng = try values.decodeIfPresent(String.self, forKey: .abbrev_eng)
        abbrev_rus = try values.decodeIfPresent(String.self, forKey: .abbrev_rus)
        score = try values.decodeIfPresent(Int.self, forKey: .score)
        
        
    }
    
    init() {
        
        id = 0
        
        name_eng = ""
        name_rus = ""
        abbrev_eng = ""
        abbrev_rus = ""
        score = 0
       
    }
}

