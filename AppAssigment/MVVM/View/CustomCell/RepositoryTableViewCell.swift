//
//  RepositoryTableViewCell.swift
//  AppAssigment
//
//  Created by Esraa Aldeeb on 8/18/18.
//  Copyright © 2018 AccessToArabia. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

  @IBOutlet var repositoryImg: UIImageView!
  @IBOutlet var repositoryNameLbl: UILabel!
  @IBOutlet var numberOfPublicRepositoryLbl: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    self.repositoryImg.layer.cornerRadius = self.repositoryImg.frame.size.width / 2
    self.repositoryImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
