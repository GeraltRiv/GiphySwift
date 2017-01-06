//
//  ViewController.swift
//  Giphy
//
//  Created by Admin on 1/1/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit;
import Kingfisher;


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchTextField: UITextField!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = [Gif]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let connection: Connection = Connection();
        connection.getGifs({ (response) -> Void in
            self.items = response;
            self.collectionView.reloadData();
        }) { (error) -> Void in
            print("Fail");
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! GifCellCollectionViewCell;
        
        let url = NSURL(string: self.items[indexPath.item].imageUrl);
        cell.nImage.kf_setImageWithURL(url,
                           placeholderImage: nil,
                           optionsInfo: [.Transition(ImageTransition.Fade(1))],
                           progressBlock: nil,
                           completionHandler: nil)
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! GifCellCollectionViewCell;
       
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath){
        
        let alert = UIAlertView();
        alert.title = "Info";
        alert.message = "Frames " + self.items[indexPath.item].imageFrames + "\nHeight " + self.items[indexPath.item].height + "\nWidth " + self.items[indexPath.item].width;
        alert.addButtonWithTitle("Ok")
        alert.show()
    }

    @IBAction func searchGif(sender: UIButton) {
        let connection: Connection = Connection();
        connection.getGifsSearch(searchTextField.text!, success:{ (response) -> Void in
            self.items = response;
            self.collectionView.reloadData();
        }) { (error) -> Void in
            print("Fail");
        }
        print(searchTextField.text);
    }

}

