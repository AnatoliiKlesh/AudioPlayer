//
//  TracklistViewController.swift
//  AudioPlayer
//
//  Created by Михаил Андреев on 11/10/2019.
//  Copyright © 2019 Squad of 4. All rights reserved.
//


import UIKit

class TrackListViewController: UITableViewController {

    var trackList = [
        "Rockstar"
]
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackName", for: indexPath)

        cell.textLabel?.text = trackList[indexPath.row]
        cell.imageView?.image = UIImage(named: trackList[indexPath.row])
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trackName = trackList[indexPath.row]
        performSegue(withIdentifier: "ShowDetails", sender: trackName)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
        tableView.reloadData()
    }

    // MARK: - Navigation
func prepare(for segue: PlayerViewController, sender: Any?) {
    
    }
}
