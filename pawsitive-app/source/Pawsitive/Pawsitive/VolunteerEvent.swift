import SwiftUI

struct VolunteerEvent: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let time: String
    let location: String
    let description: String
    let spotsAvailable: Int
    let category: Category
    let icon: String

    enum Category: String, CaseIterable {
        case shelterVisit = "Shelter Visit"
        case fundraiser = "Fundraiser"
        case crafting = "Crafting"
        case community = "Community"

        var color: Color {
            switch self {
            case .shelterVisit: return PawsitiveTheme.skyBlue
            case .fundraiser: return PawsitiveTheme.golden
            case .crafting: return PawsitiveTheme.softPink
            case .community: return PawsitiveTheme.warmOrange
            }
        }
    }

    static let upcoming: [VolunteerEvent] = [
        VolunteerEvent(
            title: "Shelter Blanket Making",
            date: "March 1, 2026",
            time: "3:30 PM - 5:00 PM",
            location: "Room 204, Main Building",
            description: "Join us to make cozy fleece blankets for shelter animals! All materials provided. No experience needed.",
            spotsAvailable: 15,
            category: .crafting,
            icon: "scissors"
        ),
        VolunteerEvent(
            title: "SPCA Weekend Visit",
            date: "March 8, 2026",
            time: "10:00 AM - 12:00 PM",
            location: "Montgomery County SPCA",
            description: "Spend the morning walking dogs, socializing cats, and helping with shelter chores. Parent/guardian permission required.",
            spotsAvailable: 8,
            category: .shelterVisit,
            icon: "building.2.fill"
        ),
        VolunteerEvent(
            title: "Bake Sale Fundraiser",
            date: "March 15, 2026",
            time: "11:00 AM - 2:00 PM",
            location: "School Cafeteria",
            description: "Help run our bake sale to raise money for local shelters! We need bakers and volunteers to sell.",
            spotsAvailable: 20,
            category: .fundraiser,
            icon: "dollarsign.circle.fill"
        ),
        VolunteerEvent(
            title: "Senior Center Pet Therapy",
            date: "March 22, 2026",
            time: "2:00 PM - 4:00 PM",
            location: "Sunrise Senior Living",
            description: "Bring joy to seniors by helping facilitate a pet therapy session with trained therapy animals.",
            spotsAvailable: 10,
            category: .community,
            icon: "heart.circle.fill"
        ),
        VolunteerEvent(
            title: "Adoption Event Setup",
            date: "April 5, 2026",
            time: "8:00 AM - 12:00 PM",
            location: "Community Park Pavilion",
            description: "Help set up and run our spring adoption event! Tasks include setting up tents, managing the check-in table, and helping families meet animals.",
            spotsAvailable: 25,
            category: .shelterVisit,
            icon: "pawprint.fill"
        )
    ]
}
