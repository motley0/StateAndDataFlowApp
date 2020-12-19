import SwiftUI

struct TimerContentView: View {
    
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            TextContent(content: "Hi, \(user.name)", offsetY: 50)
            TextContent(content: "\(timer.counter)", offsetY: 100)
            Spacer()
            ButtonContentView(action: timer.startTimer,
                              buttonTitle: timer.buttonTitle,
                              buttonColor: .red)
                .disabled(timer.isWaitButton())
            Spacer()
            ButtonContentView(action: logout,
                              buttonTitle: "Logout",
                              buttonColor: .blue)
        }
        .padding()
    }
    
    private func logout() {
        user.isRegistered = false
        user.name = ""
    }
}

struct TextContent: View {
    
    let content: String
    let offsetY: CGFloat
    
    var body: some View {
        Text(content)
            .font(.largeTitle)
            .offset(x: 0, y: CGFloat(offsetY))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerContentView()
            .environmentObject(UserManager())
    }
}
