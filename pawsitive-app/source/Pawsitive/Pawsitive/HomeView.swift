import SwiftUI

struct HomeView: View {
    @State private var showAbout = false
    private let activityImages = ["activity1", "activity2", "activity3"]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    heroSection
                    quickActions
                    impactStats
                    featuredPets
                    photoGallery
                    upcomingPreview
                }
                .padding(.bottom, 30)
            }
            .background(PawsitiveTheme.offWhite)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 36)
                        .clipShape(Circle())
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAbout = true
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(PawsitiveTheme.skyBlue)
                    }
                }
            }
            .sheet(isPresented: $showAbout) {
                aboutSheet
            }
        }
    }

    // MARK: - Hero Section

    private var heroSection: some View {
        ZStack {
            LinearGradient(
                colors: [PawsitiveTheme.skyBlue, PawsitiveTheme.skyBlue.opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            VStack(spacing: 12) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)

                Text("The Pawsitive Project")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Text("A student-led organization dedicated to\nhelping the animal shelter crisis")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)

                HStack(spacing: 4) {
                    Image(systemName: "pawprint.fill")
                    Image(systemName: "pawprint.fill")
                    Image(systemName: "pawprint.fill")
                }
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.6))
                .padding(.top, 4)
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 20)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    // MARK: - Quick Actions

    private var quickActions: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Get Involved")
                .padding(.horizontal, 20)

            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 12),
                GridItem(.flexible(), spacing: 12)
            ], spacing: 12) {
                QuickActionCard(
                    title: "Adopt",
                    subtitle: "Find your bestie",
                    icon: "heart.fill",
                    gradient: [PawsitiveTheme.softPink, PawsitiveTheme.peach]
                )
                QuickActionCard(
                    title: "Foster",
                    subtitle: "Temporary love",
                    icon: "house.fill",
                    gradient: [PawsitiveTheme.skyBlue, Color.blue.opacity(0.5)]
                )
                QuickActionCard(
                    title: "Volunteer",
                    subtitle: "Make a difference",
                    icon: "person.3.fill",
                    gradient: [PawsitiveTheme.golden, PawsitiveTheme.warmOrange]
                )
                QuickActionCard(
                    title: "Donate",
                    subtitle: "Every $ helps",
                    icon: "gift.fill",
                    gradient: [PawsitiveTheme.warmOrange, PawsitiveTheme.softPink]
                )
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Impact Stats

    private var impactStats: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Our Impact", subtitle: "Together we make a difference")
                .padding(.horizontal, 20)

            HStack(spacing: 12) {
                ImpactCard(number: "150+", label: "Animals Helped", icon: "pawprint.fill", color: PawsitiveTheme.softPink)
                ImpactCard(number: "80+", label: "Volunteers", icon: "person.2.fill", color: PawsitiveTheme.skyBlue)
                ImpactCard(number: "25+", label: "Events Held", icon: "calendar.badge.checkmark", color: PawsitiveTheme.golden)
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Featured Pets

    private var featuredPets: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Featured Pets", subtitle: "Looking for a forever home")
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(Animal.samples.filter { $0.isFeatured }) { animal in
                        NavigationLink(destination: AnimalDetailView(animal: animal)) {
                            AnimalCard(animal: animal)
                                .frame(width: 170)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            }
        }
    }

    // MARK: - Photo Gallery

    private var photoGallery: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "What We Do", subtitle: "Check out our recent activities")
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(activityImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 260, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            }
        }
    }

    // MARK: - Upcoming Preview

    private var upcomingPreview: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Coming Up", subtitle: "Next volunteer opportunity")
                .padding(.horizontal, 20)

            if let nextEvent = VolunteerEvent.upcoming.first {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: nextEvent.icon)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(nextEvent.category.color)
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                        VStack(alignment: .leading, spacing: 2) {
                            Text(nextEvent.title)
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                            Text("\(nextEvent.date) \u{2022} \(nextEvent.time)")
                                .font(.system(size: 13, weight: .regular, design: .rounded))
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }

                    Text(nextEvent.description)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundColor(.secondary)
                        .lineLimit(2)

                    HStack {
                        Label("\(nextEvent.spotsAvailable) spots left", systemImage: "person.badge.plus")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .tagStyle(color: PawsitiveTheme.skyBlue)
                        Spacer()
                    }
                }
                .padding(16)
                .cardStyle()
                .padding(.horizontal, 16)
            }
        }
    }

    // MARK: - About Sheet

    private var aboutSheet: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())

                    Text("The Pawsitive Project")
                        .font(.system(size: 24, weight: .bold, design: .rounded))

                    Text("We are a student-led organization dedicated to helping the animal shelter crisis. Through volunteering, fundraising, and community outreach, we work to give every shelter animal a chance at a happy life.")
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)

                    Image("poster")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 20)
                }
                .padding(.vertical, 20)
            }
            .navigationTitle("About Us")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { showAbout = false }
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(PawsitiveTheme.skyBlue)
                }
            }
        }
    }
}

// MARK: - Quick Action Card

struct QuickActionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let gradient: [Color]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.white)
                .frame(width: 48, height: 48)
                .background(
                    LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(RoundedRectangle(cornerRadius: 14))

            Text(title)
                .font(.system(size: 17, weight: .bold, design: .rounded))
                .foregroundColor(PawsitiveTheme.darkText)

            Text(subtitle)
                .font(.system(size: 13, weight: .regular, design: .rounded))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .cardStyle()
    }
}

// MARK: - Impact Card

struct ImpactCard: View {
    let number: String
    let label: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(color)

            Text(number)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(PawsitiveTheme.darkText)

            Text(label)
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .cardStyle()
    }
}

#Preview {
    HomeView()
}
