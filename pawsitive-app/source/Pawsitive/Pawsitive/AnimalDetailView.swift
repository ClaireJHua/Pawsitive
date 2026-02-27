import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    @State private var showAdoptSheet = false
    @State private var showFosterSheet = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                // Hero gradient with animal icon
                ZStack {
                    LinearGradient(
                        colors: animal.gradientColors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )

                    VStack(spacing: 12) {
                        Image(systemName: animal.species.icon)
                            .font(.system(size: 80))
                            .foregroundColor(.white.opacity(0.9))

                        Text(animal.species.rawValue)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                    }
                }
                .frame(height: 260)

                // Content
                VStack(alignment: .leading, spacing: 20) {
                    // Name and basic info
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(alignment: .top) {
                            Text(animal.name)
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(PawsitiveTheme.darkText)
                            Spacer()
                            ShareLink(item: "Check out \(animal.name) on The Pawsitive Project! A \(animal.breed) looking for a forever home.") {
                                Image(systemName: "square.and.arrow.up.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(PawsitiveTheme.skyBlue.opacity(0.7))
                            }
                        }

                        Text(animal.breed)
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .foregroundColor(.secondary)
                    }

                    // Quick info chips
                    HStack(spacing: 10) {
                        InfoChip(icon: "calendar", text: animal.age, color: PawsitiveTheme.skyBlue)
                        InfoChip(icon: "scalemass", text: animal.size, color: PawsitiveTheme.golden)
                        InfoChip(
                            icon: animal.gender == "Male" ? "arrow.up.circle" : "arrow.down.circle",
                            text: animal.gender,
                            color: PawsitiveTheme.softPink
                        )
                    }

                    // Personality
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Personality")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(PawsitiveTheme.darkText)

                        FlowLayout(spacing: 8) {
                            ForEach(animal.personality, id: \.self) { trait in
                                Text(trait)
                                    .tagStyle(color: PawsitiveTheme.warmOrange)
                            }
                        }
                    }

                    // About
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About \(animal.name)")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(PawsitiveTheme.darkText)

                        Text(animal.description)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                    }

                    // Good with
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Good With")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(PawsitiveTheme.darkText)

                        HStack(spacing: 10) {
                            ForEach(animal.goodWith, id: \.self) { item in
                                HStack(spacing: 4) {
                                    Image(systemName: iconFor(goodWith: item))
                                        .font(.system(size: 14))
                                    Text(item)
                                }
                                .tagStyle(color: .green)
                            }
                        }
                    }

                    // Medical
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Medical Status")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(PawsitiveTheme.darkText)

                        HStack(spacing: 6) {
                            Image(systemName: "checkmark.shield.fill")
                                .foregroundColor(.green)
                            Text(animal.medicalStatus)
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundColor(.secondary)
                        }
                    }

                    // Action buttons
                    VStack(spacing: 12) {
                        Button {
                            showAdoptSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "heart.fill")
                                Text("Adopt \(animal.name)")
                            }
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(
                                    colors: [PawsitiveTheme.softPink, PawsitiveTheme.peach],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }

                        Button {
                            showFosterSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "house.fill")
                                Text("Foster \(animal.name)")
                            }
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundColor(PawsitiveTheme.skyBlue)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(PawsitiveTheme.skyBlue.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                    }
                    .padding(.top, 8)
                }
                .padding(20)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showAdoptSheet) {
            applicationSheet(type: "Adoption")
        }
        .sheet(isPresented: $showFosterSheet) {
            applicationSheet(type: "Foster")
        }
    }

    private func iconFor(goodWith item: String) -> String {
        switch item {
        case "Kids": return "figure.and.child.holdinghands"
        case "Dogs": return "dog.fill"
        case "Cats": return "cat.fill"
        default: return "checkmark"
        }
    }

    private func applicationSheet(type: String) -> some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: type == "Adoption" ? "heart.circle.fill" : "house.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(type == "Adoption" ? PawsitiveTheme.softPink : PawsitiveTheme.skyBlue)

                Text("\(type) Application")
                    .font(.system(size: 24, weight: .bold, design: .rounded))

                Text("Interested in \(type == "Adoption" ? "adopting" : "fostering") \(animal.name)? Contact The Pawsitive Project to start the application process!")
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)

                VStack(alignment: .leading, spacing: 12) {
                    ApplicationStep(number: "1", text: "Fill out an application form")
                    ApplicationStep(number: "2", text: "Meet \(animal.name) at the shelter")
                    ApplicationStep(number: "3", text: "Home check & approval")
                    ApplicationStep(number: "4", text: "Welcome \(animal.name) home!")
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)

                Spacer()

                Button {
                    // Would open email/form
                } label: {
                    HStack {
                        Image(systemName: "envelope.fill")
                        Text("Contact Us")
                    }
                }
                .buttonStyle(PillButtonStyle(color: type == "Adoption" ? PawsitiveTheme.softPink : PawsitiveTheme.skyBlue))
                .padding(.bottom, 20)
            }
            .padding(.top, 30)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        showAdoptSheet = false
                        showFosterSheet = false
                    }
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(PawsitiveTheme.skyBlue)
                }
            }
        }
    }
}

struct InfoChip: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 13))
            Text(text)
                .font(.system(size: 13, weight: .semibold, design: .rounded))
        }
        .foregroundColor(color)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(color.opacity(0.12))
        .clipShape(Capsule())
    }
}

struct ApplicationStep: View {
    let number: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Text(number)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 28, height: 28)
                .background(PawsitiveTheme.skyBlue)
                .clipShape(Circle())

            Text(text)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(PawsitiveTheme.darkText)
        }
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = layout(in: proposal.width ?? 0, subviews: subviews)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = layout(in: bounds.width, subviews: subviews)
        for (index, position) in result.positions.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y), proposal: .unspecified)
        }
    }

    private func layout(in width: CGFloat, subviews: Subviews) -> (size: CGSize, positions: [CGPoint]) {
        var positions: [CGPoint] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var maxWidth: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > width, x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            positions.append(CGPoint(x: x, y: y))
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
            maxWidth = max(maxWidth, x)
        }

        return (CGSize(width: maxWidth, height: y + rowHeight), positions)
    }
}

#Preview {
    NavigationStack {
        AnimalDetailView(animal: Animal.samples[0])
    }
}
