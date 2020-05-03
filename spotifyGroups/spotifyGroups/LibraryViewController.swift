//
//  LibraryViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/13/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class Group {
    var groupName: String = ""
    var groupDesc: String = ""
    var members: [String] = []
    init?(dictionary: Dictionary<String,Any>) {
        self.groupName = dictionary["groupName"] as! String
        self.groupDesc = dictionary["groupDesc"] as! String
        for member in dictionary["members"] as! [Dictionary<String,Any>] {
            self.members.append(member["userInfo_id"] as! String)
        }
    }
}

class LibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    @IBOutlet weak var group_block1: UIImageView!
    // @IBOutlet weak var groups_scroll: UIScrollView!
    
    @IBOutlet weak var groupTable: UITableView!
    var groups = [Group]()
    var loaded = false
    
    override func viewDidAppear(_ animated: Bool) {
        loadGroupData()
        self.groupTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // groups_scroll.showsVerticalScrollIndicator = false
        // Do any additional setup after loading the view.
//        (self.tabBarController as? ToolbarViewController)?.popInvite()
        //Get groups API call
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(oneTapped(tapGestureRecognizer:)))
//        group_block1.isUserInteractionEnabled = true
//        group_block1.addGestureRecognizer(tapGestureRecognizer)
        
        // Loading group data
        loadGroupData()
        self.groupTable.delegate = self
        self.groupTable.dataSource = self
    }
    
    private func loadGroupData() {
        let name = userName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
           
        // Prepare URL
        let url = URL(string: "http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/getGroups/" + name)
        guard let requestUrl = url else { fatalError() }
       
        // Prepare URL Request Object
        let request = URLRequest(url: requestUrl)
       
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
               
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            // Convert HTTP Response Data to a String / JSON
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
                do {
                    if let jsonData = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>] {
                        // Reset groupData
                        self.groups = [Group]()
                        for group in jsonData {
                            if let groupData = Group(dictionary: group) {
                                self.groups.append(groupData)
                            }
                        }
                    }
                    self.loaded = true
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
        }
        task.resume()
        
        // Wait until the response arrives
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        } while !self.loaded
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "GroupTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GroupTableViewCell  else {
            fatalError("The dequeued cell is not an instance of GroupTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let group = self.groups[indexPath.row]
        
        // cell.nameLabel.text = group.groupName
        
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Create Group") {
            if let destinationVC = segue.destination as? createGroupContainerViewController {
                destinationVC.dismissHandler = {
                    self.loadGroupData()
                    self.groupTable.reloadData()
                }
            }
        }
    }
    
    @objc func oneTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "groupDetailHome") as! GroupDetailHomeViewController
             vc.providesPresentationContextTransitionStyle = true
             vc.definesPresentationContext = true
             vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
            self.navigationController?.pushViewController(vc, animated: true)
    }

}
