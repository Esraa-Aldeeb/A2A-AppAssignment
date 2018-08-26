//
//  RepositoryDetailsViewController.swift
//  AppAssigment
//
//  Created by Esraa Aldeeb on 8/19/18.
//  Copyright © 2018 AccessToArabia. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {
  var repositoryName:String?
  var watchers:String?
  var forks:String?
  @IBOutlet var repositoryNameTitleLbl: UILabel!
  @IBOutlet var numberOfForkTitleLbl: UILabel!
  @IBOutlet var numberOfWatchersTitleLbl: UILabel!
  @IBOutlet var repositoryNameLbl: UILabel!
  @IBOutlet var numberOfForkLbl: UILabel!
  @IBOutlet var numberOfWatchersLbl: UILabel!
  override func viewDidLoad() {
        super.viewDidLoad()
    self.repositoryNameLbl.text = self.repositoryName
    self.numberOfForkLbl.text = self.forks
    self.numberOfWatchersLbl.text = watchers
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
