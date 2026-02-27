import SwiftUI

struct AnimalCard: View {
    let animal: Animal

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Photo placeholder with gradient
            ZStack {
                LinearGradient(
                    colors: animal.gradientColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                Image(systemName: animal.species.icon)
                    .font(.system(size: 40))
                    .foregroundColor(.white.opacity(0.9))
            }
            .frame(height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(alignment: .topTrailing) {
                Text(animal.species.rawValue)
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .padding(8)
            }
            .overlay(alignment: .bottomLeading) {
                if animal.isFeatured {
                    HStack(spacing: 3) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 9))
                        Text("Featured")
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(PawsitiveTheme.warmOrange)
                    .clipShape(Capsule())
                    .padding(8)
                }
            }

            // Info section
            VStack(alignment: .leading, spacing: 4) {
                Text(animal.name)
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundColor(PawsitiveTheme.darkText)

                Text(animal.breed)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
                    .lineLimit(1)

                HStack(spacing: 8) {
                    Label(animal.age, systemImage: "calendar")
                    Label(animal.gender, systemImage: animal.gender == "Male" ? "circle.fill" : "circle.fill")
                }
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .foregroundColor(.secondary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    AnimalCard(animal: Animal.samples[0])
        .frame(width: 180)
        .padding()
}
