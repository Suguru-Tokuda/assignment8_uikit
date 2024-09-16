//
//  StreetFighterCharacterGridViewController.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import UIKit

class StreetFighterCharacterCollectionViewController: UIViewController {
    var countries: [Country] = Country.allCases.sorted(by: { $0.rawValue < $1.rawValue })
    var fighters: [StreetFighter] = []
    var fightersDict: [Country : [StreetFighter]] = [:]
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension StreetFighterCharacterCollectionViewController {
    private func setUpUI() {
        let cellXib = UINib(nibName: "StreetFighterCollectionViewCell", bundle: nil)
        collectionView.register(cellXib, forCellWithReuseIdentifier: "StreetFighterCollectionViewCell")
        collectionView.register(StreetFighterCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StreetFighterCollectionHeaderView.identifier)
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        loadStreetFightersFromJson()
    }
}

extension StreetFighterCharacterCollectionViewController {
    private func loadStreetFightersFromJson() {
        let bundle = Bundle(for: StreetFighterCharacterCollectionViewController.self)
        let url = bundle.url(forResource: "fighterData", withExtension: "json")
        guard let url = url else { return }
        
        DispatchQueue.global(qos: .utility).async {
            do {
                let rawData = try Data(contentsOf: url)
                let fighterData: [StreetFighter] = try JSONDecoder().decode([StreetFighter].self, from: rawData)

                DispatchQueue.main.async { [weak self] in
                    self?.fighters = fighterData
                    if let countries = self?.countries {
                        for country in countries {
                            let fighters = self?.fighters.filter { $0.nationality == country }.sorted(by: { $0.name < $1.name })
                            self?.fightersDict[country] = fighters
                        }
                    }
                    self?.collectionView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension StreetFighterCharacterCollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fighters.filter { $0.nationality == countries[section] }.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StreetFighterCollectionViewCell.identifier, for: indexPath) as? StreetFighterCollectionViewCell {
            
            let country = countries[indexPath.section]
            if let fightersInSection = fightersDict[country] {
                let fighter = fightersInSection[indexPath.item]
                if let url = URL(string: fighter.imageUrl) {
                    cell.fighterImage.load(url: url)
                    cell.fighterImage.contentMode = .scaleAspectFit
                }
                cell.fighterNameLabel.text = fighter.name
                cell.fighterNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                
                cell.backgroundColor = .blue
            }
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StreetFighterCollectionHeaderView.identifier, for: indexPath) as! StreetFighterCollectionHeaderView
        let country = countries[indexPath.section]
        header.configure(country: country)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
}

extension StreetFighterCharacterCollectionViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let fightersInSection = fightersDict[countries[indexPath.section]] {
            let fighter = fightersInSection[indexPath.item]
            let vc = WebViewController()
            vc.urlStr = fighter.pageUrl
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension StreetFighterCharacterCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns = 2
        let width = (Int(collectionView.bounds.width) - 40) / columns
        let height = Int(Double(width) * 1.2)
        return CGSize(width: width, height: height)
    }
}
