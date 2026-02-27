import SwiftUI

struct FosterView: View {
    @State private var showApplySheet = false
    @State private var expandedFAQ: String? = nil

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    heroSection
                    whyFosterSection
                    howItWorksSection
                    currentNeedsSection
                    faqSection
                    applySection
                }
                .padding(.bottom, 30)
            }
            .background(PawsitiveTheme.offWhite)
            .navigationTitle("Foster")
            .sheet(isPresented: $showApplySheet) {
                fosterApplySheet
            }
        }
    }

    // MARK: - Hero

    private var heroSection: some View {
        ZStack {
            LinearGradient(
                colors: [PawsitiveTheme.skyBlue, PawsitiveTheme.skyBlue.opacity(0.4)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Open Your Home,\nSave a Life")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text("Temporary care with permanent impact")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                }

                Spacer()

                Image(systemName: "house.and.flag.fill")
                    .font(.system(size: 48))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding(24)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    // MARK: - Why Foster

    private var whyFosterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Why Foster?")
                .padding(.horizontal, 20)

            VStack(spacing: 10) {
                FosterBenefitRow(
                    icon: "heart.fill",
                    title: "Save Lives",
                    description: "Every foster home frees up shelter space for another animal in need.",
                    color: PawsitiveTheme.softPink
                )
                FosterBenefitRow(
                    icon: "house.fill",
                    title: "Home Environment",
                    description: "Animals thrive in a home setting, making them more adoptable.",
                    color: PawsitiveTheme.skyBlue
                )
                FosterBenefitRow(
                    icon: "face.smiling.fill",
                    title: "Trial Run",
                    description: "Not sure about adopting? Fostering lets you experience pet parenthood.",
                    color: PawsitiveTheme.golden
                )
                FosterBenefitRow(
                    icon: "dollarsign.circle.fill",
                    title: "We Cover Costs",
                    description: "Food, supplies, and vet care are covered by the shelter.",
                    color: PawsitiveTheme.warmOrange
                )
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - How It Works

    private var howItWorksSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "How It Works")
                .padding(.horizontal, 20)

            VStack(spacing: 0) {
                FosterStep(number: 1, title: "Apply", description: "Fill out a quick application form", isLast: false)
                FosterStep(number: 2, title: "Get Matched", description: "We'll pair you with the perfect pet", isLast: false)
                FosterStep(number: 3, title: "Welcome Home", description: "Pick up your foster and all supplies", isLast: false)
                FosterStep(number: 4, title: "Love & Care", description: "Provide a warm, safe temporary home", isLast: false)
                FosterStep(number: 5, title: "Happy Ending", description: "Help them find their forever family", isLast: true)
            }
            .padding(16)
            .cardStyle()
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Current Needs

    private var currentNeedsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Urgent Foster Needs", subtitle: "These animals need homes now")
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    FosterNeedCard(type: "Kittens", count: 3, description: "Bottle-feeding needed", icon: "cat.fill", color: PawsitiveTheme.softPink)
                    FosterNeedCard(type: "Senior Dogs", count: 2, description: "Calm home preferred", icon: "dog.fill", color: PawsitiveTheme.golden)
                    FosterNeedCard(type: "Post-Surgery", count: 1, description: "Recovery monitoring", icon: "cross.case.fill", color: PawsitiveTheme.skyBlue)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            }
        }
    }

    // MARK: - FAQ

    private var faqSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "FAQ")
                .padding(.horizontal, 20)

            VStack(spacing: 8) {
                FAQItem(
                    question: "How long is a typical foster?",
                    answer: "Foster periods vary from 2 weeks to 3 months, depending on the animal's needs. We'll discuss the expected timeline when you're matched.",
                    expandedFAQ: $expandedFAQ
                )
                FAQItem(
                    question: "What supplies do I need?",
                    answer: "We provide everything: food, litter, crate, toys, and any medications. Just bring the love!",
                    expandedFAQ: $expandedFAQ
                )
                FAQItem(
                    question: "What if I fall in love?",
                    answer: "Foster fails are welcome! If you decide to adopt your foster, we'll waive the adoption fee as a thank-you.",
                    expandedFAQ: $expandedFAQ
                )
                FAQItem(
                    question: "I'm a student - can I still foster?",
                    answer: "Yes! With a parent/guardian's permission, students can be part of a foster family. It's a great way to learn responsibility.",
                    expandedFAQ: $expandedFAQ
                )
            }
            .padding(.horizontal, 16)
        }
    }

    // MARK: - Apply

    private var applySection: some View {
        VStack(spacing: 12) {
            Text("Ready to make a difference?")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(PawsitiveTheme.darkText)

            Button {
                showApplySheet = true
            } label: {
                HStack {
                    Image(systemName: "pawprint.fill")
                    Text("Apply to Foster")
                }
            }
            .buttonStyle(PillButtonStyle(color: PawsitiveTheme.skyBlue))
        }
        .padding(.top, 8)
    }

    // MARK: - Apply Sheet

    private var fosterApplySheet: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "house.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(PawsitiveTheme.skyBlue)

                Text("Foster Application")
                    .font(.system(size: 24, weight: .bold, design: .rounded))

                Text("Thank you for your interest in fostering! To get started, please reach out to The Pawsitive Project and we'll guide you through the process.")
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)

                VStack(alignment: .leading, spacing: 16) {
                    ContactRow(icon: "envelope.fill", label: "Email Us", detail: "pawsitiveproject@email.com")
                    ContactRow(icon: "globe", label: "Instagram", detail: "@thepawsitiveproject")
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)

                Spacer()
            }
            .padding(.top, 30)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { showApplySheet = false }
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(PawsitiveTheme.skyBlue)
                }
            }
        }
    }
}

// MARK: - Subviews

struct FosterBenefitRow: View {
    let icon: String
    let title: String
    let description: String
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

struct FosterStep: View {
    let number: Int
    let title: String
    let description: String
    let isLast: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            VStack(spacing: 0) {
                Text("\(number)")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(PawsitiveTheme.skyBlue)
                    .clipShape(Circle())

                if !isLast {
                    Rectangle()
                        .fill(PawsitiveTheme.skyBlue.opacity(0.3))
                        .frame(width: 2, height: 30)
                }
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(PawsitiveTheme.darkText)
                Text(description)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, isLast ? 0 : 12)

            Spacer()
        }
    }
}

struct FosterNeedCard: View {
    let type: String
    let count: Int
    let description: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Spacer()
                Text("\(count)")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(color)
            }

            Text(type)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundColor(PawsitiveTheme.darkText)

            Text(description)
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .foregroundColor(.secondary)

            Text("URGENT")
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .foregroundColor(.red)
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(Color.red.opacity(0.1))
                .clipShape(Capsule())
        }
        .frame(width: 160)
        .padding(14)
        .cardStyle()
    }
}

struct FAQItem: View {
    let question: String
    let answer: String
    @Binding var expandedFAQ: String?

    private var isExpanded: Bool {
        expandedFAQ == question
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    expandedFAQ = isExpanded ? nil : question
                }
            } label: {
                HStack {
                    Text(question)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(PawsitiveTheme.darkText)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.secondary)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                }
                .padding(14)
            }

            if isExpanded {
                Text(answer)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 14)
                    .padding(.bottom, 14)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .cardStyle()
    }
}

struct ContactRow: View {
    let icon: String
    let label: String
    let detail: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(PawsitiveTheme.skyBlue)
                .frame(width: 36, height: 36)
                .background(PawsitiveTheme.skyBlue.opacity(0.12))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 1) {
                Text(label)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
                Text(detail)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(PawsitiveTheme.darkText)
            }

            Spacer()
        }
    }
}

#Preview {
    FosterView()
}
