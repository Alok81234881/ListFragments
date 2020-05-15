//
//  ViewController.swift
//  ListFragments
//
//  Created by alok singh  on 14/05/20.
//  Copyright © 2020 alok singh . All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dogData :[DataModel]!
    let urlString = "https://raw.githubusercontent.com/DevTides/DogsApi/master/dogs.json"
    //var imageDog = [UIImage]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromDogApi()
        
        tableView.reloadData()
        tableView.rowHeight = 145
        
       
    }
    func getDataFromDogApi(){
        
        guard let dogUrl = URL(string: urlString) else {
            print("Can't create url")
            return
        }
        let task = URLSession.shared.downloadTask(with: dogUrl) { (location, response, error) in
            guard let location = location else{
                print("location is nil")
                return
            }
            let iData =  try! Data(contentsOf: location)
            let decoder = JSONDecoder()
            let i1Data = try! decoder.decode([DataModel].self, from: iData)
            self.dogData = i1Data
         
        }
        task.resume()
        
    }

}

extension ListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 260
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DogTableViewCell
        
        if let dogName = dogData?[indexPath.row].name {
            
            cell.dogName?.text = dogName
        }
        else{
            dogData?.remove(at: indexPath.row)
            tableView.reloadData()
        }
        cell.dogLifeSpan?.text = dogData?[indexPath.row].life_span
        
        let imageData = "https://raw.githubusercontent.com/DevTides/DogsApi/master/\(indexPath.row + 1).jpg"
        DispatchQueue.global(qos: .userInteractive).async {
            
        
        if let imageURL = URL(string: imageData){
            
            
            let task = URLSession.shared.downloadTask(with: imageURL, completionHandler: { (location, response, error) in
                
                guard let location = location else{
                    print("location is nil")
                    return
                }
                let iData =  try! Data(contentsOf: location)
                let downloadedImage = UIImage(data: iData)
                if let image = downloadedImage {
                    
                   DispatchQueue.main.async {
                      cell.dogImage?.image = image
                    }
            }
                
            })
            task.resume()
            
        }
        }
      return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! DetailViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            
            if let dogName1 = dogData?[indexPath.row].name {
                destinationVC.name = dogName1
            }
            if let dogBreed = dogData?[indexPath.row].breed_group {
                
                destinationVC.breed = dogBreed
            }
            if let lifeSpan = dogData?[indexPath.row].life_span {
                destinationVC.lfspn = lifeSpan
                
            }
            if let temperament = dogData?[indexPath.row].temperament {
                destinationVC.temp = temperament
                
            }
            let cell = tableView.cellForRow(at: indexPath) as! DogTableViewCell

            if let dogImage = cell.dogImage.image {

                destinationVC.image = dogImage
            }
            
            
        }
        
    }
    
}

