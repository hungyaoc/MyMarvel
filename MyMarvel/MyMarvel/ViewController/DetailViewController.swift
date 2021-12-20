//
//  DetailViewController.swift
//  MyMarvel
//
//  Created by Jeff Chen on 12/16/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myDescription: UITextView!
    
    private var heroViewModel : HeroViewModal!
    
    var myData : [String:Any]?
    var charID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        getHeroInfo()
    }
    
    func initUI() {
        // for name
        let name = myData?["name"] as? String
        self.myLabel.text = name
        
        charID = myData?["id"] as? String
        
        // for image
        let thumbnail = myData?["thumbnail"] as? [String:Any]
        let path = thumbnail?["path"] as? String
        let ext = thumbnail?["extension"] as? String
        let urlImg = path! + "." + ext!
        
        //===
        let url = URL(string: urlImg)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.myImage?.image = UIImage(data: data!)
            }
        }
        
        // for description
        let description = myData?["description"] as? String
        self.myDescription.text = description
    }
    

    /*func getHeroInfo() {
        heroViewModel.getDataFromURL(completion: <#T##([String : Any]) -> ()#>)
    }*/

}
