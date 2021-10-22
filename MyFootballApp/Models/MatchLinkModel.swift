//
//  MatchLinkModel.swift
//  MyFootballApp
//
//  Created by Ulmasbek on 2021/10/21.
//

import Foundation

struct MatchLinkModel:Codable {
    
    let name:String?
    let match_id:Int?
    let period:Int?
    let server_id:Int?
    let quality:String?
    let folder:String?
    let video_type:String?
    let abc:String?
    let start_ms:Int?
    let checksum:Int?
    let size:Int?
    let abc_type:String?
    let duration:Int?
    let fps:Int?
    let url_root:String?
    let url:String?
    
    enum CodingKeys: String, CodingKey {
        
       
        case name = "name"
        case match_id = "match_id"
        case period = "period"
        case server_id = "server_id"
        case quality = "quality"
        case folder = "folder"
        case video_type = "video_type"
        case abc = "abc"
        case start_ms = "start_ms"
        case checksum = "checksum"
        case size = "size"
        case abc_type = "abc_type"
        case duration = "duration"
        case fps = "fps"
        case url_root = "url_root"
        case url = "url"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decodeIfPresent(String.self, forKey: .name)
        match_id = try values.decodeIfPresent(Int.self, forKey: .match_id)
        period = try values.decodeIfPresent(Int.self, forKey: .period)
        server_id = try values.decodeIfPresent(Int.self, forKey: .server_id)
        quality = try values.decodeIfPresent(String.self, forKey: .quality)
        folder = try values.decodeIfPresent(String.self, forKey: .folder)
        video_type = try values.decodeIfPresent(String.self, forKey: .video_type)
        abc = try values.decodeIfPresent(String.self, forKey: .abc)
        start_ms = try values.decodeIfPresent(Int.self, forKey: .start_ms)
        checksum = try values.decodeIfPresent(Int.self, forKey: .checksum)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
        abc_type = try values.decodeIfPresent(String.self, forKey: .abc_type)
        duration = try values.decodeIfPresent(Int.self, forKey: .duration)
        fps = try values.decodeIfPresent(Int.self, forKey: .fps)
        url_root = try values.decodeIfPresent(String.self, forKey: .url_root)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        
    }
    
    init() {
        
        name = ""
        match_id = 0
        period = 0
        server_id = 0
        quality = ""
        folder = ""
        video_type = ""
        abc = ""
        start_ms = 0
        checksum = 0
        size = 0
        abc_type = ""
        duration = 0
        fps = 0
        url_root = ""
        url = ""
    }
    
}
