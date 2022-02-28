//
//  CoinDetailViewController.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 27/02/2022.
//

import UIKit

final class CoinDetailViewController: UIViewController {
    @IBOutlet private weak var symbolLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    var coin: Coin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        symbolLabel.text = coin?.symbol
        nameLabel.text = coin?.name
        
        let pngUrl = coin?.iconUrl.replacingOccurrences(of: "svg", with: "png") ?? ""
        if let url = URL(string: pngUrl) {
            iconImageView.setImage(from: url)
        }
    }
}
