import SwiftUI

struct SectionHeader: View {
    let title: String
    var subtitle: String? = nil
    var actionLabel: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(PawsitiveTheme.darkText)
                if let subtitle {
                    Text(subtitle)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            if let actionLabel, let action {
                Button(action: action) {
                    Text(actionLabel)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundColor(PawsitiveTheme.skyBlue)
                }
            }
        }
    }
}

#Preview {
    SectionHeader(title: "Featured Pets", subtitle: "Find your new best friend", actionLabel: "See All") {}
        .padding()
}
