//
//  ViewController.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var coins = [Coin]()
    private let repository = CoinsRepository()
    private let request = CoinsRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        loadAPI()
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CoinTableViewCell.nib,
                           forCellReuseIdentifier: CoinTableViewCell.reuseIdentifier)
    }
    
    private func loadAPI() {
        repository.getCoins(input: request) { [weak self] coins, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let coins = coins {
                self.coins = coins
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.reuseIdentifier)
                as? CoinTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(coin: coins[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScreen = CoinDetailViewController()
        detailScreen.coin = coins[indexPath.row]
        detailScreen.modalPresentationStyle = .pageSheet
        present(detailScreen, animated: true, completion: nil)
    }
}
