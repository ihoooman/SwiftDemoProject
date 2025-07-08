//
//  ContentView.swift
//  test
//
//  Created by Hooman Maddah on 7/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showNextPage = false

    var body: some View {
        NavigationStack {
            ZStack {
                
                Image(systemName: "cloud.drizzle.fill")
                    .font(.system(size: 20))
                    .padding(.top, 10)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                Text("Cloudy")
                    .padding(.top, 40)
                    .padding(.leading, 12.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                VStack {
                    Spacer()
                        .frame(height: 15)
                    Image(systemName: "appletv.badge.checkmark.fill")
                        .imageScale(.large)
                        .font(.system(size: 120))
                        .foregroundStyle(.tint)
                    Spacer()
                    Text("Hello, world!")
                        .font(.system(size: 25))
                    Spacer()
                        .frame(height: 10)
                    Text("you can go to next page")
                    Spacer()
                }
                VStack {
                    Spacer()
                    HStack {
                        Button("Back") {}
                            .disabled(true)
                        Spacer()
                        Button("Next") {
                            showNextPage = true
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Home")
            .padding()
            .navigationDestination(isPresented: $showNextPage) {
                NextView()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct NextView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var showNextPage = false
    @State private var showPrieviewsPage = false
    @State private var agreementAccepted = false
    @State private var userInput = ""
    @State private var showWaitPage = false

    var body: some View {
        ZStack {
            VStack {
                
                Spacer()
                    .frame(height: 15)
                Image(systemName: "signature")
                    .imageScale(.large)
                    .font(.system(size: 120))
                    .foregroundStyle(.tint)
                Spacer()
                Text("Need Something new?")
                    .font(.system(size: 25))
                Spacer()
                    .frame(height: 10)
                Text("Lets setup")
                Spacer()
            }
            VStack {
                Spacer()
                Toggle("I accept the rules", isOn: $agreementAccepted)
                    .padding(.top, -60)
                    .padding(.horizontal)
                HStack {
                    Button("Back") {
                        dismiss()
                    }

                    Spacer()
                    Button("Next") {
                        showWaitPage = true
                    }
                    .padding()
                    .disabled(!agreementAccepted)
                }
            }
        }
        .navigationTitle("Next Page")
        .padding()
        .navigationDestination(isPresented: $showWaitPage) {
            WaitView()
        }
    }
    
}

struct WaitView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            VStack() {
                Spacer()
                    .frame(height: 15)
                Image(systemName: "arrow.triangle.2.circlepath")
                    .imageScale(.large)
                    .font(.system(size: 120))
                    .foregroundStyle(.tint)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                Text("Check for update...")
                    .font(.title2)
                    .padding(.bottom, 20)
                Spacer()
                    .frame(height: 10)
                VStack {
                    Spacer()
                    HStack {
                        Button("Cancel") {}
                            .disabled(true)
                        Spacer()
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    .font(.title3)
                    .padding([.horizontal, .bottom])
                }
            }
        }
        .navigationTitle("Wait")
        .padding()
    }
}

#Preview {
    NextView()
}

#Preview {
    WaitView()
    
}
