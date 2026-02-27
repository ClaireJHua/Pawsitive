# Pawsitive

A student-led organization dedicated to helping the animal shelter crisis. This repository contains both the iOS mobile app and the companion website.

## Project Structure

```
Pawsitive/
├── pawsitive-app/    # Native iOS app (SwiftUI)
└── pawsitive-web/    # Website (HTML/CSS/JavaScript)
```

---

## pawsitive-app

A native iOS app built with **SwiftUI**.

### Features

- **Home** — Hero section, impact stats (150+ animals helped, 80+ volunteers, 25+ events), featured pets carousel, activity photo gallery, and upcoming events preview
- **Adopt** — Browse animals by species (dogs/cats) with search and detailed profiles
- **Foster** — Program overview, 5-step process guide, urgent foster needs, FAQ, and application contact form
- **Volunteer** — Event listings with category filters (Shelter Visit, Fundraiser, Crafting, Community) and signup flow
- **Donate** — Preset and custom donation amounts with confirmation feedback

### Tech Stack

| | |
|---|---|
| Language | Swift |
| Framework | SwiftUI |
| Navigation | `TabView` + `NavigationStack` |
| State | `@State`, `@Binding` |

### Project Layout

```
pawsitive-app/source/Pawsitive/Pawsitive/
├── PawsitiveApp.swift        # App entry point
├── ContentView.swift         # 5-tab navigation
├── HomeView.swift            # Home screen
├── AdoptView.swift           # Adoption browser
├── FosterView.swift          # Foster program info
├── VolunteerView.swift       # Volunteer events
├── DonateView.swift          # Donation screen
├── Animal.swift              # Animal data model
├── VolunteerEvent.swift      # Event data model
├── AnimalCard.swift          # Reusable animal card
├── AnimalDetailView.swift    # Animal detail modal
├── PawsitiveTheme.swift      # Design system (colors, styles)
└── SectionHeader.swift       # Reusable section header
```

### Requirements

- Xcode 15+
- iOS 17+ deployment target

### Running

Open `pawsitive-app/source/Pawsitive/Pawsitive.xcodeproj` in Xcode and run on a simulator or device.

---

## pawsitive-web

A static website with no build tools or dependencies.

### Features

Mirrors the iOS app with the same five sections: Home, Adopt, Foster, Volunteer, and Donate. Additional web-specific features include animated stat counters, scroll-triggered fade-in animations (Intersection Observer), and keyboard-accessible modals.

### Tech Stack

| | |
|---|---|
| Markup | HTML5 |
| Styling | CSS3 with custom properties |
| Scripting | Vanilla JavaScript (ES6+) |
| Font | Google Fonts — Nunito |
| Build tool | None |

### Project Layout

```
pawsitive-web/
├── index.html    # Single-page app
├── app.js        # All JavaScript logic
├── styles.css    # All styles
└── images/       # Image assets
```

### Running

Open `pawsitive-web/index.html` directly in a browser — no server or build step required.

---

## Design System

Both apps share a unified visual identity:

| Token | Color |
|---|---|
| Sky Blue | `#8ECAE6` |
| Peach | `#F5C1A0` |
| Soft Pink | `#F4A7BB` |
| Golden | `#E6C547` |
| Warm Orange | `#E8935A` |

Font: **Nunito** — rounded and friendly across both platforms.
