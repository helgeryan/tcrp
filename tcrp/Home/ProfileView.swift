//
//  ProfileView.swift
//  fireSwiftUI
//
//  Created by Ryan Helgeson on 7/18/23.
//

import SwiftUI
import FirebaseFirestore

class ProfileViewModel: ObservableObject {

    
}

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var profileModel = ProfileViewModel()
    @Binding var presentSideMenu: Bool
  
    var body: some View {
        if let user = viewModel.currentUser {
            VStack {
                HStack {
                    Button {
                        presentSideMenu.toggle()
                    } label: {
                        Image(systemName: "text.justify")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color(.gray))
                            .frame(width: 25, height: 25, alignment: .leading)

                    }.padding()
                    Spacer()
                }
                
                List {
                    Section {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())

                            VStack(alignment: .leading,spacing: 4) {
                                Text(user.fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                Text(user.email)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }

                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Section("Account") {
                        Button {
                            debugPrint("Sign out..")
                            viewModel.signOut()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                        }

                        Button {
                            debugPrint("Deleting account..")
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColor: .red)
                        }
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(presentSideMenu: .constant(false))
    }
}
