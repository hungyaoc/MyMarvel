//
//  ViewController.swift
//  MyMarvel
//
//  Created by Jeff Chen on 12/15/21.
//

import UIKit
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

class CharacterCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
}

class ViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    
    private var heroViewModel : HeroViewModal!
    
    var characters : [[String: Any]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModal()
    }
    
    func setupViewModal(){
        self.heroViewModel =  HeroViewModal()
        self.heroViewModel.getDataFromURL(completion: { (data:[String:Any]) in
            
            if let data = data as? [String: Any] {
                let dicData = data["data"] as? [String: Any]
                self.characters = dicData?["results"] as? [[String: Any]]
                
                DispatchQueue.main.async {
                    self.myTable.reloadData()
                }
            }
        })
    }
}

extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let characters = characters else {
            return 0
        }
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell
        
        let dic = characters?[indexPath.row] as! [String:Any]
        
        // for image
        let thumbnail = dic["thumbnail"] as? [String:Any]
        let path = thumbnail?["path"] as? String
        let ext = thumbnail?["extension"] as? String
        let urlImg = path! + "." + ext!
        
        //===
        let url = URL(string: urlImg)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.cellImage?.image = UIImage(data: data!)
            }
        }
        
        cell.cellLabel?.text = dic["name"] as? String
        return cell
  }
}

extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        vc.myData = characters?[indexPath.row] as? [String:Any]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
