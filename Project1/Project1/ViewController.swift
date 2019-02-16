//
//  ViewController.swift
//  Project1
//
//  Created by Hoff Henry Pereira da Silva on 16/02/19.
//  Copyright © 2019 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    private let storyBoardCellIdentifier = "Picture"
    var arrayOfPicturesNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        let fileManager = FileManager.default
        guard let path = Bundle.main.resourcePath else { return }
        guard let itemsNames = try? fileManager.contentsOfDirectory(atPath: path) else {
            return
        }
        for itemName in itemsNames {
            if itemName.hasPrefix("nssl") {
                arrayOfPicturesNames.append(itemName)
            }
        }
        print(arrayOfPicturesNames)
    }


}

// MARK - TableView Definitions

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPicturesNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureTableViewCell(cellForRowAt: indexPath)
    }
    
    private func configureTableViewCell(cellForRowAt: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: storyBoardCellIdentifier, for: cellForRowAt)
        cell.textLabel?.text = arrayOfPicturesNames[cellForRowAt.row]
        return cell
    }
}

