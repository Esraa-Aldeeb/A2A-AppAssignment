//
//  ListOfRepositoryTableViewController.swift
//  AppAssigment
//
//  Created by Esraa Aldeeb on 8/19/18.
//  Copyright © 2018 AccessToArabia. All rights reserved.
//

import UIKit

class ListOfRepositoryTableViewController: UITableViewController {
  var repositoryName:String?
  var repositoryFollowers:String?
  var publicRepository:String?
  @IBOutlet var repositoryTableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.repositoryTableView.tableFooterView = UIView()
  }
  
  // MARK: - Table view data source Methods
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  // MARK: - Table view Delegate
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryNameCell", for: indexPath)
    cell.textLabel?.text = self.repositoryName
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "repositoryDetails") {
      let destinationViewController = segue.destination as! RepositoryDetailsViewController
      destinationViewController.repositoryName = self.repositoryName
      destinationViewController.forks = self.publicRepository
      destinationViewController.watchers = self.repositoryFollowers
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
