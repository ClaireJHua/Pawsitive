import SwiftUI

struct VolunteerView: View {
    @State private var selectedCategory: VolunteerEvent.Category? = nil
    @State private var showSignUpSheet = false
    @State private var selectedEvent: VolunteerEvent? = nil
    private let activityImages = ["activity1", "activity2", "activity3"]

    var filteredEvents: [VolunteerEvent] {
        if let category = selectedCategory {
            return VolunteerEvent.upcoming.filter { $0.category == category }
        }
        return VolunteerEvent.upcoming
    }

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    heroSection
                    categoryFilter
                    eventsSection
                    gallerySection
                }
                .padding(.bottom, 30)
            }
            .background(PawsitiveTheme.offWhite)
            .navigationTitle("Volunteer")
            .sheet(item: $selectedEvent) { event in
                eventSignUpSheet(event: event)
            }
        }
    }

    // MARK: - Hero

    private var heroSection: some View {
        ZStack {
            LinearGradient(
                colors: [PawsitiveTheme.golden, PawsitiveTheme.warmOrange],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Make a\nDifference")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text("Join our team of amazing volunteers")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                }

                Spacer()

                Image(systemName: "hands.sparkles.fill")
                    .font(.system(size: 48))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding(24)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    // MARK: - Category Filter

    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                FilterChip(label: "All", isSelected: selectedCategory == nil) {
                    withAnimation { selectedCategory = nil }
                }
                ForEach(VolunteerEvent.Category.allCases, id: \.self) { category in
                    FilterChip(label: category.rawValue, isSelected: selectedCategory == category, color: category.color) {
                        withAnimation { selectedCategory = category }
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Events

    private var eventsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Upcoming Events", subtitle: "\(filteredEvents.count) events available")
                .padding(.horizontal, 20)

            VStack(spacing: 12) {
                ForEach(filteredEvents) { event in
                    EventCard(event: event) {
                        selectedEvent = event
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Gallery

    private var gallerySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Past Events", subtitle: "See what we've been up to")
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(activityImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            }
        }
    }

    // MARK: - Sign Up Sheet

    private func eventSignUpSheet(event: VolunteerEvent) -> some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Event icon
                    Image(systemName: event.icon)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .background(event.category.color)
                        .clipShape(RoundedRectangle(cornerRadius: 20))

                    Text(event.title)
                        .font(.system(size: 22, weight: .bold, design: .rounded))

                    // Event details
                    VStack(spacing: 12) {
                        EventDetailRow(icon: "calendar", text: event.date, color: PawsitiveTheme.skyBlue)
                        EventDetailRow(icon: "clock", text: event.time, color: PawsitiveTheme.golden)
                        EventDetailRow(icon: "mappin.circle.fill", text: event.location, color: PawsitiveTheme.warmOrange)
                        EventDetailRow(icon: "person.badge.plus", text: "\(event.spotsAvailable) spots available", color: .green)
                    }
                    .padding(16)
                    .cardStyle()
                    .padding(.horizontal, 20)

                    Text(event.description)
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)

                    Button {
                        selectedEvent = nil
                    } label: {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Sign Me Up!")
                        }
                    }
                    .buttonStyle(PillButtonStyle(color: event.category.color))
                    .padding(.top, 8)
                }
                .padding(.top, 30)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { selectedEvent = nil }
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(PawsitiveTheme.skyBlue)
                }
            }
        }
    }
}

// MARK: - Subviews

struct FilterChip: View {
    let label: String
    let isSelected: Bool
    var color: Color = PawsitiveTheme.skyBlue
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 13, weight: .semibold, design: .rounded))
                .foregroundColor(isSelected ? .white : PawsitiveTheme.darkText)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(isSelected ? color : Color.white)
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
        }
    }
}

struct EventCard: View {
    let event: VolunteerEvent
    let onSignUp: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: event.icon)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(event.category.color)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                VStack(alignment: .leading, spacing: 2) {
                    Text(event.title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(PawsitiveTheme.darkText)

                    Text(event.category.rawValue)
                        .tagStyle(color: event.category.color)
                }

                Spacer()
            }

            HStack(spacing: 16) {
                Label(event.date, systemImage: "calendar")
                Label(event.time, systemImage: "clock")
            }
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(.secondary)

            HStack(spacing: 8) {
                Label(event.location, systemImage: "mappin")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)

                Spacer()

                Button(action: onSignUp) {
                    Text("Sign Up")
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 7)
                        .background(event.category.color)
                        .clipShape(Capsule())
                }
            }
        }
        .padding(16)
        .cardStyle()
    }
}

struct EventDetailRow: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(color)
                .frame(width: 24)
            Text(text)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(PawsitiveTheme.darkText)
            Spacer()
        }
    }
}

extension VolunteerEvent: Equatable {
    static func == (lhs: VolunteerEvent, rhs: VolunteerEvent) -> Bool {
        lhs.id == rhs.id
    }
}

#Preview {
    VolunteerView()
}
