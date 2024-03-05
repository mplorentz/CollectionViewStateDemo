//
//  UICollectionViewRepresentable.swift
//  CollectionViewStateDemo
//
//  Created by Matthew Lorentz on 3/4/24.
//

import SwiftUI

struct UICollectionViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UICollectionView {
        // Create a UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 50) 
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        // Create a UICollectionView
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = context.coordinator
        
        // Register cell class for UICollectionViewCell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        // No update needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    // Coordinator to act as the UICollectionViewDataSource
    class Coordinator: NSObject, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 100
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            
            cell.contentConfiguration = UIHostingConfiguration {
                CellView()
            }
            
            return cell
        }
    }
}
