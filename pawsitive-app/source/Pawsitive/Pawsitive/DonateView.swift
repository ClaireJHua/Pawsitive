import SwiftUI

struct DonateView: View {
    @State private var selectedAmount: Int? = 10
    @State private var customAmount = ""
    @State private var showThankYou = false
    let presetAmounts = [5, 10, 25, 50, 100]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    heroSection
                    amountSection
                    impactSection
                    wishListSection
                    otherWaysSection
                }
                .padding(.bottom, 30)
            }
            .background(PawsitiveTheme.offWhite)
            .navigationTitle("Donate")
            .alert("Thank You!", isPresented: $showThankYou) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Your generous donation helps us continue our mission to help shelter animals. Every dollar makes a difference!")
            }
        }
    }

    // MARK: - Hero

    private var heroSection: some View {
        ZStack {
            LinearGradient(
                colors: [PawsitiveTheme.warmOrange, PawsitiveTheme.softPink],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Every Dollar\nSaves Lives")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text("100% goes directly to helping animals")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                }

                Spacer()

                Image(systemName: "heart.circle.fill")
                    .font(.system(size: 48))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding(24)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    // MARK: - Amount Selection

    private var amountSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Choose an Amount")
                .padding(.horizontal, 20)

            VStack(spacing: 12) {
                // Preset amounts
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 10),
                    GridItem(.flexible(), spacing: 10),
                    GridItem(.flexible(), spacing: 10)
                ], spacing: 10) {
                    ForEach(presetAmounts, id: \.self) { amount in
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedAmount = amount
                                customAmount = ""
                            }
                        } label: {
                            Text("$\(amount)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(selectedAmount == amount ? .white : PawsitiveTheme.darkText)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(
                                    selectedAmount == amount
                                    ? AnyShapeStyle(LinearGradient(colors: [PawsitiveTheme.warmOrange, PawsitiveTheme.softPink], startPoint: .leading, endPoint: .trailing))
                                    : AnyShapeStyle(Color.white)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
                        }
                    }
                }

                // Custom amount
                HStack {
                    Text("$")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.secondary)

                    TextField("Custom amount", text: $customAmount)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .keyboardType(.numberPad)
                        .onChange(of: customAmount) { _, newValue in
                            if !newValue.isEmpty {
                                selectedAmount = nil
                            }
                        }
                }
                .padding(14)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)

                // Donate button
                Button {
                    showThankYou = true
                } label: {
                    HStack {
                        Image(systemName: "heart.fill")
                        Text("Donate Now")
                    }
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            colors: [PawsitiveTheme.warmOrange, PawsitiveTheme.softPink],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.top, 4)
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Impact

    private var impactSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Your Impact", subtitle: "See where your money goes")
                .padding(.horizontal, 20)

            VStack(spacing: 10) {
                ImpactRow(amount: "$5", description: "Feeds a shelter animal for a week", icon: "fork.knife", color: PawsitiveTheme.golden)
                ImpactRow(amount: "$10", description: "Provides a cozy blanket and toys", icon: "teddybear.fill", color: PawsitiveTheme.softPink)
                ImpactRow(amount: "$25", description: "Covers one vaccination round", icon: "syringe.fill", color: PawsitiveTheme.skyBlue)
                ImpactRow(amount: "$50", description: "Sponsors a spay/neuter surgery", icon: "cross.case.fill", color: PawsitiveTheme.warmOrange)
                ImpactRow(amount: "$100", description: "Funds an emergency medical rescue", icon: "staroflife.fill", color: .red)
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Wish List

    private var wishListSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Wish List", subtitle: "Items our shelters need most")
                .padding(.horizontal, 20)

            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 10),
                GridItem(.flexible(), spacing: 10)
            ], spacing: 10) {
                WishListItem(name: "Dog Food", icon: "bag.fill", priority: "High")
                WishListItem(name: "Cat Litter", icon: "tray.fill", priority: "High")
                WishListItem(name: "Blankets", icon: "bed.double.fill", priority: "Medium")
                WishListItem(name: "Cleaning Supplies", icon: "sparkles", priority: "Medium")
                WishListItem(name: "Toys", icon: "teddybear.fill", priority: "Low")
                WishListItem(name: "Leashes", icon: "lasso", priority: "Low")
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Other Ways

    private var otherWaysSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Other Ways to Help")
                .padding(.horizontal, 20)

            VStack(spacing: 10) {
                OtherWayCard(
                    title: "Fundraise With Us",
                    description: "Start a peer-to-peer fundraiser for your birthday, school event, or just because!",
                    icon: "megaphone.fill",
                    color: PawsitiveTheme.golden
                )
                OtherWayCard(
                    title: "Share Our Mission",
                    description: "Follow us on social media and spread the word about The Pawsitive Project.",
                    icon: "square.and.arrow.up.fill",
                    color: PawsitiveTheme.skyBlue
                )
                OtherWayCard(
                    title: "Corporate Matching",
                    description: "Ask your parent's employer if they match charitable donations.",
                    icon: "building.2.fill",
                    color: PawsitiveTheme.warmOrange
                )
            }
            .padding(.horizontal, 16)
        }
    }
}

// MARK: - Subviews

struct ImpactRow: View {
    let amount: String
    let description: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 1) {
                Text(amount)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(PawsitiveTheme.darkText)
                Text(description)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(12)
        .cardStyle()
    }
}

struct WishListItem: View {
    let name: String
    let icon: String
    let priority: String

    var priorityColor: Color {
        switch priority {
        case "High": return .red
        case "Medium": return PawsitiveTheme.warmOrange
        default: return .green
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(PawsitiveTheme.skyBlue)
                Spacer()
                Text(priority)
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .foregroundColor(priorityColor)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(priorityColor.opacity(0.12))
                    .clipShape(Capsule())
            }

            Text(name)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(PawsitiveTheme.darkText)
        }
        .padding(12)
        .cardStyle()
    }
}

struct OtherWayCard: View {
    let title: String
    let description: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(PawsitiveTheme.darkText)
                Text(description)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(14)
        .cardStyle()
    }
}

#Preview {
    DonateView()
}
