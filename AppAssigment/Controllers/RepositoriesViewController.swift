//
//  RepositoriesViewController.swift
//  AppAssigment
//
//  Created by Esraa Aldeeb on 8/18/18.
//  Copyright © 2018 AccessToArabia. All rights reserved.
//

import UIKit

struct Repository: Codable {
  let avatarUrl: URL?
  let name: String?
  let repos: Int?
  let followers: Int?
  
  private enum CodingKeys: String, CodingKey {
    case avatarUrl = "avatar_url"
    case name
    case repos = "public_repos"
    case followers
  }
}

class RepositoriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  @IBOutlet var dataTableView: UITableView!
  @IBOutlet var activityIndicator: UIActivityIndicatorView!
  var newImage: UIImage?
  var name : String?
  var followers : String?
  var publicRepository : String?
  override func viewDidLoad() {
    super.viewDidLoad()
    getRepositoryData()
    self.dataTableView.tableFooterView = UIView()
    
  }
  //MARK: TableView Data Source Method
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  //MARK: TableView Delegate Methods
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.dataTableView.dequeueReusableCell(withIdentifier: "repositoryCell", for: indexPath) as! RepositoryTableViewCell
    cell.repositoryImg.image = newImage
    cell.repositoryNameLbl.text = name
    cell.numberOfPublicRepositoryLbl.text = publicRepository
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  //MARK: - Get Repository Data Method
  func getRepositoryData() {
    guard let gitUrl = URL(string: "https://api.github.com/users/whymarrh") else { return }
    self.activityIndicator.startAnimating()
    URLSession.shared.dataTask(with: gitUrl) { (data, response
      , error) in
      
      guard let data = data else { return }
      do {
        let decoder = JSONDecoder()
        let gitData = try decoder.decode(Repository.self, from: data)
        
        DispatchQueue.main.sync {
          if let gimage = gitData.avatarUrl {
            let data = try? Data(contentsOf: gimage)
            let image: UIImage = UIImage(data: data!)!
            self.newImage = image
          }
          
          
          if let gname = gitData.name {
            self.name = gname
          }
          
          
          if let gfollowers = gitData.followers {
            self.followers = String(gfollowers)
          }
          
          if let grepos = gitData.repos {
            self.publicRepository = String(grepos)
            
          }
          
          DispatchQueue.main.async{
            self.activityIndicator.stopAnimating()
            self.dataTableView.reloadData()
          }
        }
      } catch let err {
        print("Err", err)
      }
      }.resume()
    
  }
  //MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "repositoryNames") {
      let destinationViewController = segue.destination as! ListOfRepositoryTableViewController
      destinationViewController.repositoryName = self.name
      destinationViewController.repositoryFollowers = self.followers
      destinationViewController.publicRepository = self.publicRepository
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

