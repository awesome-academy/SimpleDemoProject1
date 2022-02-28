//
//  GithubRepoTableViewCell.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import UIKit

final class CoinTableViewCell: UITableViewCell, ReusableView {
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configCell(coin: Coin) {
        nameLabel.text = coin.name
        
        let pngUrl = coin.iconUrl.replacingOccurrences(of: "svg", with: "png")
        if let url = URL(string: pngUrl) {
            iconImageView.setImage(from: url)
        }
    }
}
