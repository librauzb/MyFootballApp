//
//  SendModels.swift
//  MyFootballApp
//
//  Created by Ulmasbek on 2021/10/22.
//

import Foundation

struct InfoSendModel{
    
    var proc:String = "get_match_info"
    
    var _p_sport:Int = 1
    var _p_match_id:Int = 1724836
    
    var dic : [String : Any] {
        
        var result = [ "proc": proc] as [String : Any]
        var params = [String: Any]()
        params.updateValue(_p_sport, forKey: "_p_sport")
        params.updateValue(_p_match_id, forKey: "_p_match_id")
        result.updateValue(params, forKey: "params")
        return result
    }
}

//struct Params {
//    var _p_sport:Int = 1
//    var _p_match_id:Int = 1724836
//}

struct LinkSendModel {
    var match_id:Int = 1724836
    var sport_id:Int = 1
    
    var dic : [String : Any] {
        
        let result = [ "match_id": match_id,
                       "sport_id": sport_id,] as [String : Any]
        return result
    }
}
