//
//  StreetFighterCharacterGridViewController.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import UIKit

class StreetFighterCharacterCollectionViewController: UIViewController {
    var countries: [Country] = Country.allCases.sorted(by: { $0.rawValue < $1.rawValue })
    let fighters: [StreetFighter] = [
        StreetFighter(name: "Ryu", imageUrl: "https://www.streetfighter.com/6/assets/images/character/ryu/ryu.png", nationality: .japan, pageUrl: "https://www.streetfighter.com/6/character/ryu"),
        StreetFighter(name: "Ken", imageUrl: "https://www.streetfighter.com/6/assets/images/character/ken/ken.png", nationality: .us, pageUrl: "https://www.streetfighter.com/6/character/ken"),
        StreetFighter(name: "Guile", imageUrl: "https://www.streetfighter.com/6/assets/images/character/guile/guile.png", nationality: .us, pageUrl: "https://www.streetfighter.com/6/character/guile"),
        StreetFighter(name: "A.K.I", imageUrl: "https://www.streetfighter.com/6/assets/images/character/aki/aki.png", nationality: .china, pageUrl: "https://www.streetfighter.com/6/character/aki"),
        StreetFighter(name: "Rashid", imageUrl: "https://www.streetfighter.com/6/assets/images/character/rashid/rashid.png", nationality: .arab, pageUrl: "https://www.streetfighter.com/6/character/rashid"),
        StreetFighter(name: "Cammy", imageUrl: "https://www.streetfighter.com/6/assets/images/character/cammy/cammy.png", nationality: .uk, pageUrl: "https://www.streetfighter.com/6/character/cammy"),
        StreetFighter(name: "Lily", imageUrl: "https://www.streetfighter.com/6/assets/images/character/lily/lily.png", nationality: .mexico, pageUrl: "https://www.streetfighter.com/6/character/lily"),
        StreetFighter(name: "JP", imageUrl: "https://www.streetfighter.com/6/assets/images/character/jp/jp.png", nationality: .russia, pageUrl: "https://www.streetfighter.com/6/character/jp"),
        StreetFighter(name: "Marisa", imageUrl: "https://www.streetfighter.com/6/assets/images/character/marisa/marisa.png", nationality: .italy, pageUrl: "https://www.streetfighter.com/6/character/marisa"),
        StreetFighter(name: "Zangief", imageUrl: "https://www.streetfighter.com/6/assets/images/character/zangief/zangief.png", nationality: .russia, pageUrl: "https://www.streetfighter.com/6/character/zangief"),
        StreetFighter(name: "Manon", imageUrl: "https://www.streetfighter.com/6/assets/images/character/manon/manon.png", nationality: .france, pageUrl: "https://www.streetfighter.com/6/character/manon"),
        StreetFighter(name: "Dee Jay", imageUrl: "https://www.streetfighter.com/6/assets/images/character/deejay/deejay.png", nationality: .jamaica, pageUrl: "https://www.streetfighter.com/6/character/deejay"),
        StreetFighter(name: "E. Honda", imageUrl: "https://www.streetfighter.com/6/assets/images/character/ehonda/ehonda.png", nationality: .japan, pageUrl: "https://www.streetfighter.com/6/character/ehonda"),
        StreetFighter(name: "Dhalsim", imageUrl: "https://www.streetfighter.com/6/assets/images/character/dhalsim/dhalsim.png", nationality: .india, pageUrl: "https://www.streetfighter.com/6/character/dhalsim"),
        StreetFighter(name: "Blanka", imageUrl: "https://www.streetfighter.com/6/assets/images/character/blanka/blanka.png", nationality: .brazil, pageUrl: "https://www.streetfighter.com/6/character/blanka"),
        StreetFighter(name: "Juri", imageUrl: "https://www.streetfighter.com/6/assets/images/character/juri/juri.png", nationality: .korea, pageUrl: "https://www.streetfighter.com/6/character/juri"),
        StreetFighter(name: "Chun-Li", imageUrl: "https://www.streetfighter.com/6/assets/images/character/chunli/chunli.png", nationality: .china, pageUrl: "https://www.streetfighter.com/6/character/chunli"),
        StreetFighter(name: "Jamie", imageUrl: "https://www.streetfighter.com/6/assets/images/character/jamie/jamie.png", nationality: .hongKong, pageUrl: "https://www.streetfighter.com/6/character/jamie"),
        StreetFighter(name: "Luke", imageUrl: "https://www.streetfighter.com/6/assets/images/character/luke/luke.png", nationality: .us, pageUrl: "https://www.streetfighter.com/6/character/luke"),
    ]
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
        for country in countries {
            let fighters = self.fighters.filter { $0.nationality == country }.sorted(by: { $0.name < $1.name })
            self.fightersDict[country] = fighters
        }
        
        let cellXib = UINib(nibName: "StreetFighterCollectionViewCell", bundle: nil)
        collectionView.register(cellXib, forCellWithReuseIdentifier: "StreetFighterCollectionViewCell")
        collectionView.register(StreetFighterCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StreetFighterCollectionHeaderView.identifier)
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
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
