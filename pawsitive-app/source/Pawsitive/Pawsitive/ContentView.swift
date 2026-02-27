import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

            AdoptView()
                .tabItem {
                    Label("Adopt", systemImage: "heart.fill")
                }
                .tag(1)

            FosterView()
                .tabItem {
                    Label("Foster", systemImage: "hand.raised.fill")
                }
                .tag(2)

            VolunteerView()
                .tabItem {
                    Label("Volunteer", systemImage: "person.3.fill")
                }
                .tag(3)

            DonateView()
                .tabItem {
                    Label("Donate", systemImage: "gift.fill")
                }
                .tag(4)
        }
        .tint(PawsitiveTheme.skyBlue)
    }
}

#Preview {
    ContentView()
}
