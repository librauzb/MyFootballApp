//
//  ViewController.swift
//  MyFootballApp
//
//  Created by Ulmasbek on 2021/10/21.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    private let tableView : UITableView = {
        
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()
    
    private let presenter = MatchPresenter()
    
    private var mInfo = MatchInfoModel()
    private var mLinks = [MatchLinkModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        presenter.setViewDelegate(self)
        presenter.getMatchLink()
        presenter.getMatchInfo()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
        tableView.separatorStyle = .none
        
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return mLinks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = (mInfo.tournament?.name_eng ?? "") + "   " + ((mInfo.date?.count ?? 0) > 10 ? mInfo.date!.prefix(10) : "")
                cell.textLabel?.textAlignment = .center
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                cell.selectionStyle = .none
                return cell
            default:
                let a = (mInfo.team1?.abbrev_eng ?? "") + " " + String("\(mInfo.team1?.score ?? 0)") + " : "
                let b = String("\(mInfo.team2?.score ?? 0)") + " " + (mInfo.team2?.abbrev_eng ?? "")
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = a + b
                cell.textLabel?.textAlignment = .center
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
                cell.selectionStyle = .none
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = String("\(mLinks[indexPath.row].period ?? 0)") + " half (\(mLinks[indexPath.row].quality ?? ""))"
            cell.textLabel?.textAlignment = .center
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            watchMatch(mLinks[indexPath.row].url ?? "")
        }
        
    }
    
}

extension ViewController:MatchProtocol{
    
    func presentMatchInfo(_ info: MatchInfoModel, _ link: [MatchLinkModel]) {
        
        self.mInfo = info
        self.mLinks = link
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func watchMatch(_ link: String) {
        
        if link != ""{
            let url = URL(string: link)!
            
            let player = AVPlayer(url: url)
            
            let vc = AVPlayerViewController()
            vc.player = player
            
            self.present(vc, animated: true) { vc.player?.play() }
        }
    }
    
    
}
