//
//  CellView.swift
//  CollectionViewStateDemo
//
//  Created by Matthew Lorentz on 3/4/24.
//

import SwiftUI

struct CellView: View {
    
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Count \(count)")
            Button { 
                count += 1
            } label: { 
                Text("Increase count")
            }
        }
    }
}
