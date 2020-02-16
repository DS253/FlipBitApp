//
//  CPKDrawerMenuView.swift
//  CupertinoKit
//
//  Created by Florian Marcu on 10/10/19.
//  Copyright © 2019 CupertinoKit. All rights reserved.
//

import SwiftUI

struct CPKDrawerMenuView: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void

    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            HStack {
                VStack {
                    Image("user-avatar")
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    List {
                        Text("Home").onTapGesture {
                            print("My Profile")
                        }
                        Text("My Profile").onTapGesture {
                            print("My Profile")
                        }
                        Text("Posts").onTapGesture {
                            print("Posts")
                        }
                        Text("Logout").onTapGesture {
                            print("Logout")
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .opacity(self.isOpen ? 1.0 : 0.0).animation(.easeIn)
    }
}

struct CPKDrawerMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CPKDrawerMenuView(width: 200, isOpen: true) {}
    }
}
