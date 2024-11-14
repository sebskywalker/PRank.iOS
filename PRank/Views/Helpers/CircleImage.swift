//
//  CircleImage.swift
//  PRank
//
//  Created by seb's on 11/12/24.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 7)
            )
            .shadow(radius: 7)
            .scaleEffect(0.999) // Aplica una reducción del 25%
    }
}

#Preview {
    CircleImage(image: Image("samsulek"))
}

