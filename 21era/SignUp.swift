import SwiftUI

struct Signup: View {
    @State private var userName: String = ""
    @State private var PhoneNum: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        ZStack{
            BackgroundDesign()
            Color("BackColor").ignoresSafeArea().opacity(0.2)
            
            VStack(spacing: 54){
                
                VStack(spacing: 54){
                    
                    VStack(alignment: .leading , spacing: 8){
                        Text("Welcome To 21ERA ")
                            .font(.largeTitle).bold()
                        
                            .foregroundColor(Color("FontLargeTitle"))
                        Text("Create a new Accont")
                            .font(.headline)
                            .foregroundColor(Color("ArroeColor"))
                    }
                    VStack(spacing:20){
                        HStack {
                            Image(systemName: "pencil.line")
                                .resizable()
                                .frame(width: 25 , height: 20)
                                .foregroundColor(Color("ArroeColor"))
                                .padding(.leading, 10)
                                .padding(.trailing, 4)
                            
                            TextField("UserName", text: $userName)
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        .frame(height: 50)
                        .background(Color("TextFildeColor").opacity(0.5))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        
                        
                        HStack {
                            Image(systemName: "phone")
                                .resizable()
                                .frame(width: 25 , height: 25)
                                .foregroundColor(Color("ArroeColor"))
                                .padding(.leading, 10)
                                .padding(.trailing, 4)
                            
                            TextField("Phone number ", text: $PhoneNum)
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        .frame(height: 50)
                        .background(Color("TextFildeColor").opacity(0.5))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        
                        HStack {
                            Image(systemName: "lock")
                                .resizable()
                                .frame(width: 20 , height: 25)
                                .foregroundColor(Color("ArroeColor"))
                                .padding(.leading, 12)
                                .padding(.trailing, 4)
                            
                            TextField("Password", text: $password)
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        .frame(height: 50)
                        .background(Color("TextFildeColor").opacity(0.5))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        
                    }

                }
                
                VStack(spacing: 45){
                    Button {
                        signup()
                        
                    } label: {
                        Text("Signup")
                            .frame(width: 260 , height: 50)
                            .foregroundColor(.white)
                            .font(.title2)
                            .background(Color("ArroeColor"))
                            .cornerRadius(15)
                    }
                    
                    VStack(spacing: 20){
                        VStack(spacing: 4){
                            Text("------------------OR------------------")
                                .font(.title3)
                                .foregroundColor(Color("FontLargeTitle"))
                            
                            Text("Join with your favorite social media account")
                                .foregroundColor(Color("FontLargeTitle"))
                                .font(.callout)
                                .padding()
                            
                        }
                        
                        HStack(spacing: 20){
                            // Button for signing up with Apple
                            Button(action: {
                                // Perform sign-up with Apple logic here
                                signupWithApple()
                            }) {
                                Image("apple_logo")
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                    .foregroundColor(.black)
                            }
                            
                            // Button for signing up with Google
                            Button(action: {
                                // Perform sign-up with Google logic here
                                signupWithGoogle()
                            }) {
                                Image("google_logo")
                                    .resizable()
                                    .frame(width: 55, height: 55)
                            }
                            
                            // Button for signing up with Twitter
                            Button(action: {
                                // Perform sign-up with Twitter logic here
                                signupWithTwitter()
                            }) {
                                Image("twitter_logo")
                                    .resizable()
                                    .frame(width: 55, height: 55)
                            }
                            
                        }
                    }
                    
                    
                }
                
                
                
            } // end Vsack
            .padding()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func signup() {
        // Perform sign-up logic using the provided username, email, and password
        
        // Example database integration:
        // Send the user data to your backend API for registration
        // You can use Alamofire, URLSession, or other networking libraries to make the API request
        
        let userData = [
            "username": userName,
            "phonNumber": PhoneNum,
            "password": password
        ]
        
        // Make a POST request to the registration endpoint on your backend
        // Replace "https://your-api-url.com/register" with your actual API endpoint
        // Handle success and error cases accordingly
        
        guard let url = URL(string: "https://your-api-url.com/register") else {
            // Handle invalid URL error
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: userData, options: .prettyPrinted)
        } catch {
            // Handle JSON serialization error
            return
        }
        
        // Add any necessary headers to the request, e.g., authentication token
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response from the backend
            
            if let error = error {
                // Handle the request error
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // Handle the response data and status code
            
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                }
                
                // Process the response data as needed
                
                // If the registration is successful, you can navigate to another view or display a success message
                
            }
            
        }.resume()
    }
    
    func signupWithApple() {
        // Perform sign-up with Apple logic
        // Integrate with Apple Sign In API to register the user using their Apple ID
        // Handle success and error cases accordingly
    }
    
    func signupWithGoogle() {
        // Perform sign-up with Google logic
        // Integrate with Google Sign In API to register the user using their Google account
        // Handle success and error cases accordingly
    }
    
    func signupWithTwitter() {
        // Perform sign-up with Twitter logic
        // Integrate with Twitter Sign In API to register the user using their Twitter account
        // Handle success and error cases accordingly
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}


//VStack{
//    VStack(alignment: .leading , spacing: 8){
//        Text("Welcome To 21ERA ")
//            .font(.largeTitle).bold()
//
//            .foregroundColor(Color("FontLargeTitle"))
//        Text("Create a new Accont")
//            .font(.headline)
//    }
//
//    VStack(alignment: .leading , spacing: 54){
//
//
//        VStack(alignment: .center , spacing: 20){
//
//            HStack {
//                Image(systemName: "pencil.line")
//                    .resizable()
//                    .frame(width: 25 , height: 20)
//                    .foregroundColor(Color("ArroeColor"))
//                    .padding(.leading, 10)
//                    .padding(.trailing, 4)
//
//                TextField("UserName", text: $userName)
//                    .foregroundColor(.black)
//                    .font(.body)
//            }
//            .frame(height: 50)
//            .background(Color("TextFildeColor").opacity(0.5))
//            .cornerRadius(8)
//            .padding(.horizontal)
//
//
//
//            HStack {
//                Image(systemName: "envelope")
//                    .resizable()
//                    .frame(width: 25 , height: 20)
//                    .foregroundColor(Color("ArroeColor"))
//                    .padding(.leading, 10)
//                    .padding(.trailing, 4)
//
//                TextField("Phone number ", text: $PhoneNum)
//                    .foregroundColor(.black)
//                    .font(.body)
//            }
//            .frame(height: 50)
//            .background(Color("TextFildeColor").opacity(0.5))
//            .cornerRadius(8)
//            .padding(.horizontal)
//
//
//            HStack {
//                Image(systemName: "lock")
//                    .resizable()
//                    .frame(width: 20 , height: 20)
//                    .foregroundColor(Color("ArroeColor"))
//                    .padding(.leading, 12)
//                    .padding(.trailing, 4)
//
//                TextField("Password", text: $password)
//                    .foregroundColor(.black)
//                    .font(.body)
//            }
//            .frame(height: 50)
//            .background(Color("TextFildeColor").opacity(0.5))
//            .cornerRadius(8)
//            .padding(.horizontal)
//
//
//        }
//
//
//        Button {
//
//        } label: {
//            Text("SginUP")
//                .frame(width: 300 , height: 50)
//                .foregroundColor(.white)
//                .font(.title2)
//                .background(Color("ArroeColor"))
//                .cornerRadius(10)
//        }
//
//
//
//
//
//
//
//
//
//
//
//    }
//
//
//
//
//}
