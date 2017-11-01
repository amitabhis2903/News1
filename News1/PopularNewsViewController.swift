//
//  PopularNewsViewController.swift
//  News1
//
//  Created by Ammy Pandey on 29/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class PopularNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var popularNewsTable: UITableView!
    
    var newsArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.global(qos: .userInteractive).async {
            //declaring url of json
            let url = URL(string: "https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=7128c0bb961741b99d59fbb69011f3fc")!
            
            // declaring request of url
            let request = NSMutableURLRequest(url: url)
            
            //executing request
            URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                
                //error
                if error != nil {
                    print ("Error: \(String(describing: error))")
                }
                
                // get json data
                do{
                    //store json data in new constant
                    
                    let json =  try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    
                    //Secured way to declare new constant to store data
                    guard let parssedJSON = json else{
                        print("Error while parsing \(String(describing: error))")
                        return
                    }
                    
                    guard let articlesJson = parssedJSON["articles"] else {
                        print("Error while parsing data \(String(describing: error))")
                        return
                    }
                    
                    print(articlesJson)
                    
                    self.newsArray = articlesJson as! [AnyObject]
                    
                    DispatchQueue.main.async {
                        self.popularNewsTable.reloadData()
                    }
                    
                    
                }catch{
                    print("Error Caught \(error)")
                }
                }.resume()
        }
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PopularTableViewCell
        
        let title = newsArray[indexPath.row]["title"]
        cell.headlineLbl.text = title as? String
        
        let disc = newsArray[indexPath.row]["description"]
        cell.discriptionLbl.text = disc as? String
        
        let imageUrlString = newsArray[indexPath.row]["urlToImage"] as! String
        
        //converted string to url
        let imageUrl = URL(string: imageUrlString)
        
        //loaded data from url
        let imageData = NSData(contentsOf: imageUrl!)
        
        cell.newsImg.image = UIImage(data: imageData! as Data)
        
        return cell
    }

   
}
