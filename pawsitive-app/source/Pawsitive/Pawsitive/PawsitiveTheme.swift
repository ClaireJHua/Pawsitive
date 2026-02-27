import SwiftUI

struct PawsitiveTheme {
    // Brand colors extracted from the logo and posters
    static let skyBlue = Color(red: 0.56, green: 0.79, blue: 0.91)
    static let peach = Color(red: 0.96, green: 0.76, blue: 0.63)
    static let softPink = Color(red: 0.96, green: 0.66, blue: 0.73)
    static let golden = Color(red: 0.90, green: 0.77, blue: 0.28)
    static let warmOrange = Color(red: 0.91, green: 0.58, blue: 0.35)
    static let offWhite = Color(red: 0.98, green: 0.98, blue: 0.96)
    static let darkText = Color(red: 0.18, green: 0.18, blue: 0.18)
    static let cardBackground = Color.white
    static let lightGray = Color(red: 0.95, green: 0.95, blue: 0.95)

    static let gradientPrimary = LinearGradient(
        colors: [skyBlue, skyBlue.opacity(0.6)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let gradientWarm = LinearGradient(
        colors: [peach, softPink],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let gradientSunset = LinearGradient(
        colors: [golden, warmOrange],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 4)
    }
}

struct PillButtonStyle: ButtonStyle {
    var color: Color = PawsitiveTheme.skyBlue

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(color)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct TagStyle: ViewModifier {
    var color: Color

    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(color)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(color.opacity(0.15))
            .clipShape(Capsule())
    }
}

extension View {
    func cardStyle() -> some View {
        modifier(CardStyle())
    }

    func tagStyle(color: Color) -> some View {
        modifier(TagStyle(color: color))
    }
}
