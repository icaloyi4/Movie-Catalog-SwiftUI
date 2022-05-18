//
//  Movie_Catalog_SwiftUIApp.swift
//  Movie Catalog SwiftUI
//
//  Created by Rizky Haris Risaldi on 12/05/22.
//

import SwiftUI

@main
struct Movie_Catalog_SwiftUIApp: App {
    
    @StateObject var viewRouter = ViewRouter()
        
        var body: some Scene {
            WindowGroup {
                MotherView().environmentObject(viewRouter)
            }
        }
    }
