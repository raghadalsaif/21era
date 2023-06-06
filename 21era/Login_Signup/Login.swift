import SwiftUI

struct Login: View {
    @State private var Emaill: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        ZStack{
       
    
            Color("BackColor").ignoresSafeArea().opacity(0.2)
            
            
            VStack(spacing: 50){
                
                VStack(alignment: .leading , spacing: 8){
                    Text("Welcome Back")
                        .font(.custom("basecoat-bold", size: 34))
                    
                        .foregroundColor(Color("FontLargeTitle"))
                    
                    
                }.padding(.trailing,90)
                
                
                VStack(spacing: 20){
                    VStack(alignment: .leading, spacing: 16){
                        
                        HStack {
                            Image(systemName: "envelope")
                                .resizable()
                                .frame(width: 25 , height: 20)
                                .foregroundColor(Color("MainColor"))
                                .padding(.leading, 10)
                                .padding(.trailing, 4)
                            
                            TextField("Email", text: $Emaill)
                                .foregroundColor(.black)
                            .font(.custom("basecoat", size: 16))                        }
                        .frame(height: 50)
                        .background(Color("TextFildeColor").opacity(0.5))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        
                        
                        HStack {
                            Image(systemName: "lock")
                                .resizable()
                                .frame(width: 20 , height: 25)
                                .foregroundColor(Color("MainColor"))
                                .padding(.leading, 12)
                                .padding(.trailing, 4)
                            
                            TextField("Password", text: $password)
                                .foregroundColor(.black)
                                .font(.custom("basecoat", size: 16))
                        }
                        .frame(height: 50)
                        .background(Color("TextFildeColor").opacity(0.5))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                    }
                    
                    // Button for performing login action
                    Button(action: {
                        // Perform login logic here
                        login()
                    }) {
                        Text("Login")
                            .frame(width: 260 , height: 50)
                            .foregroundColor(.white)
                            .font(.custom("basecoat-bold", size: 24))

                            .background(Color("MainColor"))
                            .cornerRadius(15)
                    }
                    .padding(.top , 70)
                    
                    Button(action: {
                        // Perform login logic here
                        
                        
                    }) {
                        Text("Forget Password?")
                            .frame(width: 260 , height: 50)
                            .foregroundColor(Color("MainColor"))
                            .font(.custom("basecoat", size: 16))
                        
                    }
                    
                    VStack( alignment: .leading, spacing: 16){
                        Text("---------------------------OR---------------------------")
                            .font(.footnote)
                            .foregroundColor(Color("FontLargeTitle"))
                        
                        
                        HStack{
                            Text("Don’t have an account?")
                                .foregroundColor(Color("FontLargeTitle"))
                                .font(.custom("basecoat", size: 16))
                           
                            NavigationLink(destination: Signup()) {
                                Text("Sginup")
                                    .foregroundColor(Color("MainColor"))
                                    .font(.custom("basecoat", size: 17))                            }
                         
                            
                        }
                        
                    }
                }
            }
            .padding()
        }
    }
    
    
    
    
    // Function to handle login action
    func login() {
        
        // Create a login request to your backend API
        guard let url = URL(string: "https://your-backend.com/login") else {
            print("Invalid URL")
            return
        }
        
        // Prepare parameters for the login request
        let parameters = ["PhoneNumber": Emaill, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        
        // Configure the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Send the login request using URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Process the login response from the backend
            if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let success = responseJSON["success"] as? Bool,
               let token = responseJSON["token"] as? String {
                if success {
                    // Login successful, store the token or perform further actions
                    print("Login successful. Token: \(token)")
                } else {
                    // Login failed, show an error message
                    print("Login failed.")
                }
            } else {
                print("Invalid response from the server.")
            }
        }.resume()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
