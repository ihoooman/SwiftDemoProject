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
                    Image(systemName: "gear.circle")
                        .imageScale(.large)
                        .font(.system(size: 120))
                        .foregroundStyle(.tint)
                    Spacer()
                    Text("Hello, This is a test app")
                        .font(.system(size: 25))
                    Spacer()
                        .frame(height: 10)
                    Text("to show the Swift power")
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
                Text("Let's setup")
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
    @State private var showConfirmation = false
    @State private var showSuccess = false
    var body: some View {
        ZStack {
            VStack() {
                Spacer()
                    .frame(height: 15)
                Image(systemName: "gearshape.arrow.trianglehead.2.clockwise.rotate.90")
                    .imageScale(.large)
                    .font(.system(size: 120))
                    .foregroundStyle(.tint)
                Spacer()
                    .frame(height:20)
                Text("Getting Data...")
                    .font(.title2)
                    .padding(.bottom, 20)
                Spacer()
                    .frame(height: 10)
                VStack {
                    Spacer()
                    HStack {
                        Button("Back") {}
                            .disabled(true)
                        Spacer()
                        Button("Cancel") {
                            showConfirmation = true
                        }
                    }
                    .font(.title3)
                    .padding([.horizontal, .bottom])
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                showSuccess = true
            }
        }
        .navigationTitle("Wait")
        .padding()
        .alert("Are You Sure Want To Exit?", isPresented: $showConfirmation) {
            Button("Yes", role: .destructive) {
                exit(0)
            }
            Button("Back", role: .cancel) {}
        } message: {
            Text("This Will Close Application")
        }
        .alert("Test Successful!", isPresented: $showSuccess) {
            Button("OK", role: .cancel) {
                exit(0)
            }
        } message: {
            Text("The test completed successfully.")
        }
    }
}

#Preview {
    NextView()
}

#Preview {
    WaitView()
    
}
