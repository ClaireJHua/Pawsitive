import SwiftUI

struct AdoptView: View {
    @State private var searchText = ""
    @State private var selectedFilter: AnimalFilter = .all

    enum AnimalFilter: String, CaseIterable {
        case all = "All"
        case dogs = "Dogs"
        case cats = "Cats"
    }

    var filteredAnimals: [Animal] {
        var animals = Animal.samples

        switch selectedFilter {
        case .all: break
        case .dogs: animals = animals.filter { $0.species == .dog }
        case .cats: animals = animals.filter { $0.species == .cat }
        }

        if !searchText.isEmpty {
            animals = animals.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.breed.localizedCaseInsensitiveContains(searchText)
            }
        }

        return animals
    }

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    // Header card
                    headerCard

                    // Filter pills
                    filterPills

                    // Results count
                    HStack {
                        Text("\(filteredAnimals.count) pets available")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    .padding(.horizontal, 20)

                    // Animal grid
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 14),
                        GridItem(.flexible(), spacing: 14)
                    ], spacing: 14) {
                        ForEach(filteredAnimals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalCard(animal: animal)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                }
            }
            .background(PawsitiveTheme.offWhite)
            .navigationTitle("Adopt")
            .searchable(text: $searchText, prompt: "Search by name or breed")
        }
    }

    private var headerCard: some View {
        ZStack {
            LinearGradient(
                colors: [PawsitiveTheme.softPink, PawsitiveTheme.peach],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Find Your\nNew Best Friend")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text("Every adoption saves a life")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                }

                Spacer()

                Image(systemName: "heart.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding(20)
        }
        .frame(height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    private var filterPills: some View {
        HStack(spacing: 10) {
            ForEach(AnimalFilter.allCases, id: \.self) { filter in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedFilter = filter
                    }
                } label: {
                    HStack(spacing: 4) {
                        if filter == .dogs {
                            Image(systemName: "dog.fill")
                                .font(.system(size: 12))
                        } else if filter == .cats {
                            Image(systemName: "cat.fill")
                                .font(.system(size: 12))
                        }
                        Text(filter.rawValue)
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                    }
                    .foregroundColor(selectedFilter == filter ? .white : PawsitiveTheme.darkText)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(selectedFilter == filter ? PawsitiveTheme.skyBlue : Color.white)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    AdoptView()
}
