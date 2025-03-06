
//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Sean Allen on 10/30/20.
//
import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    var body: some View {
        VStack {
            FrameworkTitleView(framework: framework)
            Text(framework.description)
            
        }
    }
}


struct FrameworkDetailView_PreViews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView(framework: MockData.sampleFramework)
    }
}
