//
//  Presenter.swift
//  MyFootballApp
//
//  Created by Ulmasbek on 2021/10/21.
//

import Foundation
import UIKit

protocol MatchProtocol:AnyObject{
    
    func presentMatchInfo(_ info:MatchInfoModel, _ link:[MatchLinkModel])
}

typealias PresenterDelegate = UIViewController & MatchProtocol

class MatchPresenter {
    
    weak var delegate : PresenterDelegate?
    
    var matchLinks:[MatchLinkModel]? = nil
    
    public func setViewDelegate(_ delegate:PresenterDelegate){
        self.delegate = delegate
    }
    
    public func getMatchInfo(){
        
        guard let url = URL(string: "https://api.instat.tv/test/data") else { return }
        
        let json: [String: Any] = ["proc": "get_match_info",
                                   "params": [
                                    "_p_sport": 1,
                                    "_p_match_id": 1724836]]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do {
                
                let info = try JSONDecoder().decode(MatchInfoModel.self, from: data)
                self.delegate?.presentMatchInfo(info, self.matchLinks ?? [])
                
            } catch{
                print(error)
            }
        }

        task.resume()
    }
    
    public func getMatchLink(){
        
        
        
        guard let url = URL(string: "https://api.instat.tv/test/video-urls") else { return }
        
        let json: [String: Any] = ["match_id": 1724836,
                                   "sport_id": 1]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do {
                
                self.matchLinks = try JSONDecoder().decode([MatchLinkModel].self, from: data)
                
                
            } catch{
                print(error)
            }
        }

        task.resume()
        
    }
    
}
