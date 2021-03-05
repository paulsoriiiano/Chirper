//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Paul Junver Soriano on 2/25/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var favorited:Bool = false
    var tweetID:Int = -1
    
    func setFavorite( isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named: "favor_icon_red"), for: UIControl.State.normal)
        } else{
            favButton.setImage(UIImage(named: "favor_icon"), for: UIControl.State.normal)
        }
    }
    
 
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: { [self] in
                setFavorite(isFavorited: true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        }  else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: { [self] in
                    setFavorite(isFavorited: false)
                }, failure: { (error) in
                    print("Unfavorite did not succeed: \(error)")
                })
            }
    }
    
    
    @IBAction func retweetTweet(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
