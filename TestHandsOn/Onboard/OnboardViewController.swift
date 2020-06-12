//
//  OnboardViewController.swift
//  testeClass
//
//  Created by Yuri on 11/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import UIKit

//swiftlint:disable force_cast

class OnboardViewController: UIViewController {
    
    let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(OnboardCollectionViewCell.self, forCellWithReuseIdentifier: OnboardCollectionViewCell.reuseIdentifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.hidesForSinglePage = true
        control.translatesAutoresizingMaskIntoConstraints = false
        control.pageIndicatorTintColor = .black
        control.currentPageIndicatorTintColor = .red
        
        return control
    }()
    
    private var currentPage = 0 {
        didSet { pageControl.currentPage = currentPage }
    }
    private var onboards = [Onboard]()
    
    init(onboard: [Onboard]) {
        super.init(nibName: nil, bundle: nil)
        pageControl.numberOfPages = onboard.count
        self.onboards = onboard
    }
    
    required init?(coder: NSCoder) {
        fatalError("You doing something wrong")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constructView()
        setupLayout()
    }
    
    private func constructView() {
        self.view.addSubview(collection)
        collection.dataSource = self
        collection.delegate = self
        
        self.view.addSubview(pageControl)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.view.topAnchor),
            collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collection.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collection.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            
            pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func nextPage() {
        if currentPage < onboards.count - 1 {
            currentPage += 1
            collection.scrollToItem(at: IndexPath(row: currentPage, section: 0), at: .centeredHorizontally, animated: true)
        } else {
            presentNewScreen()
        }
    }
    
    private func presentNewScreen() {
        UserDefaults.standard.set(1, forKey: "hasSeenOnboard")
        self.view.window?.rootViewController = UINavigationController(rootViewController: CitiesViewController())
    }
}

extension OnboardViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardCollectionViewCell.reuseIdentifier, for: indexPath) as! OnboardCollectionViewCell
        cell.setup(onboard: onboards[indexPath.row], action: nextPage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
    }
}
