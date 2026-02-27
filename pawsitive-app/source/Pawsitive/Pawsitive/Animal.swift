import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let species: Species
    let breed: String
    let age: String
    let gender: String
    let size: String
    let description: String
    let personality: [String]
    let goodWith: [String]
    let medicalStatus: String
    let gradientColors: [Color]
    let isFeatured: Bool

    enum Species: String, CaseIterable {
        case dog = "Dog"
        case cat = "Cat"

        var icon: String {
            switch self {
            case .dog: return "dog.fill"
            case .cat: return "cat.fill"
            }
        }
    }

    static let samples: [Animal] = [
        Animal(
            name: "Buddy",
            species: .dog,
            breed: "Golden Retriever",
            age: "2 years",
            gender: "Male",
            size: "Large",
            description: "Buddy is the sweetest golden retriever you'll ever meet! He loves belly rubs, playing fetch, and going on long walks. He's fully house-trained and gets along great with everyone.",
            personality: ["Friendly", "Playful", "Gentle"],
            goodWith: ["Kids", "Dogs", "Cats"],
            medicalStatus: "Vaccinated, Neutered, Microchipped",
            gradientColors: [PawsitiveTheme.golden, PawsitiveTheme.warmOrange],
            isFeatured: true
        ),
        Animal(
            name: "Luna",
            species: .cat,
            breed: "Domestic Shorthair",
            age: "1 year",
            gender: "Female",
            size: "Small",
            description: "Luna is a curious and affectionate cat who loves to explore. She enjoys window-watching, chasing toy mice, and curling up in warm laps for nap time.",
            personality: ["Curious", "Affectionate", "Playful"],
            goodWith: ["Kids", "Cats"],
            medicalStatus: "Vaccinated, Spayed, Microchipped",
            gradientColors: [PawsitiveTheme.softPink, PawsitiveTheme.peach],
            isFeatured: true
        ),
        Animal(
            name: "Max",
            species: .dog,
            breed: "Labrador Mix",
            age: "3 years",
            gender: "Male",
            size: "Large",
            description: "Max is an energetic and loyal companion. He's great on a leash and loves hiking, swimming, and learning new tricks. He'd thrive in an active household!",
            personality: ["Energetic", "Loyal", "Smart"],
            goodWith: ["Kids", "Dogs"],
            medicalStatus: "Vaccinated, Neutered, Microchipped",
            gradientColors: [PawsitiveTheme.skyBlue, Color.blue.opacity(0.6)],
            isFeatured: false
        ),
        Animal(
            name: "Whiskers",
            species: .cat,
            breed: "Tabby",
            age: "4 years",
            gender: "Male",
            size: "Medium",
            description: "Whiskers is a chill tabby who loves a quiet afternoon. He's the perfect companion for movie nights and study sessions. Very low-maintenance and super cuddly.",
            personality: ["Calm", "Cuddly", "Independent"],
            goodWith: ["Kids", "Cats", "Dogs"],
            medicalStatus: "Vaccinated, Neutered, Microchipped",
            gradientColors: [PawsitiveTheme.warmOrange, PawsitiveTheme.golden],
            isFeatured: false
        ),
        Animal(
            name: "Bella",
            species: .dog,
            breed: "Beagle",
            age: "1 year",
            gender: "Female",
            size: "Medium",
            description: "Bella is an adorable beagle puppy with the cutest howl! She's still learning the ropes but is incredibly food-motivated and eager to please.",
            personality: ["Energetic", "Vocal", "Food-Lover"],
            goodWith: ["Kids", "Dogs"],
            medicalStatus: "Vaccinated, Spayed, Microchipped",
            gradientColors: [PawsitiveTheme.peach, PawsitiveTheme.softPink],
            isFeatured: true
        ),
        Animal(
            name: "Shadow",
            species: .cat,
            breed: "Black Domestic Shorthair",
            age: "2 years",
            gender: "Male",
            size: "Medium",
            description: "Shadow is a sleek, handsome boy who's a bit shy at first but becomes your best friend once he trusts you. He loves head scratches and playing with feather toys.",
            personality: ["Shy", "Sweet", "Gentle"],
            goodWith: ["Cats"],
            medicalStatus: "Vaccinated, Neutered, Microchipped",
            gradientColors: [Color.gray, PawsitiveTheme.skyBlue],
            isFeatured: false
        ),
        Animal(
            name: "Daisy",
            species: .dog,
            breed: "Pomeranian",
            age: "5 years",
            gender: "Female",
            size: "Small",
            description: "Daisy is a fluffy little ball of joy! She loves being the center of attention and will make you smile every day. Perfect for apartment living.",
            personality: ["Sassy", "Loving", "Energetic"],
            goodWith: ["Kids"],
            medicalStatus: "Vaccinated, Spayed, Microchipped",
            gradientColors: [PawsitiveTheme.golden, PawsitiveTheme.peach],
            isFeatured: false
        ),
        Animal(
            name: "Mochi",
            species: .cat,
            breed: "Siamese Mix",
            age: "6 months",
            gender: "Female",
            size: "Small",
            description: "Mochi is an absolute sweetheart! This playful kitten loves to climb, pounce, and snuggle. She's looking for her forever home where she can grow up happy.",
            personality: ["Playful", "Vocal", "Adventurous"],
            goodWith: ["Kids", "Cats", "Dogs"],
            medicalStatus: "Vaccinated, Spayed, Microchipped",
            gradientColors: [PawsitiveTheme.skyBlue, PawsitiveTheme.softPink],
            isFeatured: true
        )
    ]
}
