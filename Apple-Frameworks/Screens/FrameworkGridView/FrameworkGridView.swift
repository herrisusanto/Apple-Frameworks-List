//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by loratech on 26/12/23.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(MockData.frameworks){framework in
                    FrameworkTitleView(framework: framework)
                        .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                    
                }
                
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView){
                FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView))
            }
        }
        .accentColor(Color(.label))
        
        
    }
}

#Preview {
    FrameworkGridView().preferredColorScheme(.dark)
}


