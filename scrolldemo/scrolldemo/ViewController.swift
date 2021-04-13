//
//  ViewController.swift
//  hotstar
//
//  Created by Admin on 16/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollV: UIScrollView!
    @IBOutlet weak var tvHeight: NSLayoutConstraint!
    
    @IBOutlet weak var CV: UICollectionView!
    @IBOutlet weak var sbl1: UIButton!
    @IBOutlet weak var TV: UITableView!
    @IBOutlet weak var kl: UILabel!
    @IBOutlet weak var sbL: UILabel!
    
    let hArr = ["1h","5h","2h","4h"]
    let header = ["Best in Sports","Specials & Latest Movies","Shows Recommended For You","Popular Movies","Popular Shows"]
    //,"Movies Recommmeded For You","Loved by Cricket Lovers","Best of Superheroes","Latest Shows","Best of Kids"]
    let imgH1 = [["1h.jpeg","2h.jpeg","4h.jpeg"],["5h.jpeg","1h.jpeg","9h.jpeg"],["7h.jpeg","6h.jpeg","7h.jpeg","1h"],["9h.jpeg","2h.jpeg","7h.jpeg"],["4h.jpeg","1h","2h.jpeg"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CV.delegate = self
        CV.dataSource = self
        CV.tag = 0
        sbL.layer.cornerRadius = 12
        sbL.layer.borderWidth = 2
        sbL.layer.borderColor = UIColor.systemBlue.cgColor
        sbl1.layer.cornerRadius = 12
        sbl1.layer.borderWidth = 2
        sbl1.layer.borderColor = UIColor.systemBlue.cgColor
        //        kl.layer.cornerRadius = 12
        //        kl.layer.borderWidth = 2
        //        kl.layer.borderColor = UIColor.black.cgColor
        TV.reloadData()
        
        tvHeight.constant = 1250//CGFloat(header.count * 200) + CGFloat(header.count * 50)
        scrollV.contentSize = CGSize(width: self.view.frame.size.width, height: 400)
        scrollV.layoutSubviews()
        scrollV.layoutIfNeeded()
    }
    
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
//        tvHeight.constant = CGFloat(header.count * 200) + CGFloat(header.count * 50)
        return header.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTVC
        cell.backgroundColor = UIColor.yellow
        // cell.CVC.tag =
        cell.CVC.tag = indexPath.section
        cell.CVC.delegate = self
        cell.CVC.dataSource = self
        cell.selectionStyle = .none
        cell.CVC.reloadData()
        return cell
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return header[section]
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
        let lbl = UILabel(frame: CGRect(x: 0, y: 15, width: 500 ,height: 20))
        // lbl.backgroundColor = UIColor.black
        lbl.text = "\(header[section])"
        lbl.textColor = UIColor.white
        lbl.font = UIFont(name: "System.Helvetica", size: 20)
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        //   lbl.font = UIFont.TextStyle.largeTitle.
        vw.addSubview(lbl)
        vw.backgroundColor = UIColor.black

        return vw
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.CV {
            return hArr.count
            
        }
        return imgH1[collectionView.tag].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.CV{
            return 1
        }
        return header.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.CV{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomHeadCVC", for: indexPath) as! CustomHeadCVC
            cell.backgroundColor = UIColor.green
            cell.imgH.image = UIImage(named: "\(hArr[indexPath.row])")
            cell.countlb.text = "\(indexPath.row+1) / \(hArr.count)"
            return cell
        }
        
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVC", for: indexPath) as! CustomCVC
        cell2.imgV.image = UIImage(named: "\(imgH1[collectionView.tag][indexPath.row])")
        return cell2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.CV{
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        }
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
