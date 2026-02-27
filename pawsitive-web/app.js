// ============================
// Data
// ============================

const animals = [
    {
        name: "Buddy",
        species: "dog",
        breed: "Golden Retriever",
        age: "2 years",
        gender: "Male",
        size: "Large",
        description: "Buddy is the sweetest golden retriever you'll ever meet! He loves belly rubs, playing fetch, and going on long walks. He's fully house-trained and gets along great with everyone.",
        personality: ["Friendly", "Playful", "Gentle"],
        goodWith: ["Kids", "Dogs", "Cats"],
        medicalStatus: "Vaccinated, Neutered, Microchipped",
        gradient: "linear-gradient(135deg, #E6C547, #E8935A)",
        featured: true
    },
    {
        name: "Luna",
        species: "cat",
        breed: "Domestic Shorthair",
        age: "1 year",
        gender: "Female",
        size: "Small",
        description: "Luna is a curious and affectionate cat who loves to explore. She enjoys window-watching, chasing toy mice, and curling up in warm laps for nap time.",
        personality: ["Curious", "Affectionate", "Playful"],
        goodWith: ["Kids", "Cats"],
        medicalStatus: "Vaccinated, Spayed, Microchipped",
        gradient: "linear-gradient(135deg, #F4A7BB, #F5C1A0)",
        featured: true
    },
    {
        name: "Max",
        species: "dog",
        breed: "Labrador Mix",
        age: "3 years",
        gender: "Male",
        size: "Large",
        description: "Max is an energetic and loyal companion. He's great on a leash and loves hiking, swimming, and learning new tricks. He'd thrive in an active household!",
        personality: ["Energetic", "Loyal", "Smart"],
        goodWith: ["Kids", "Dogs"],
        medicalStatus: "Vaccinated, Neutered, Microchipped",
        gradient: "linear-gradient(135deg, #8ECAE6, #5ba3d9)",
        featured: false
    },
    {
        name: "Whiskers",
        species: "cat",
        breed: "Tabby",
        age: "4 years",
        gender: "Male",
        size: "Medium",
        description: "Whiskers is a chill tabby who loves a quiet afternoon. He's the perfect companion for movie nights and study sessions. Very low-maintenance and super cuddly.",
        personality: ["Calm", "Cuddly", "Independent"],
        goodWith: ["Kids", "Cats", "Dogs"],
        medicalStatus: "Vaccinated, Neutered, Microchipped",
        gradient: "linear-gradient(135deg, #E8935A, #E6C547)",
        featured: false
    },
    {
        name: "Bella",
        species: "dog",
        breed: "Beagle",
        age: "1 year",
        gender: "Female",
        size: "Medium",
        description: "Bella is an adorable beagle puppy with the cutest howl! She's still learning the ropes but is incredibly food-motivated and eager to please.",
        personality: ["Energetic", "Vocal", "Food-Lover"],
        goodWith: ["Kids", "Dogs"],
        medicalStatus: "Vaccinated, Spayed, Microchipped",
        gradient: "linear-gradient(135deg, #F5C1A0, #F4A7BB)",
        featured: true
    },
    {
        name: "Shadow",
        species: "cat",
        breed: "Black Domestic Shorthair",
        age: "2 years",
        gender: "Male",
        size: "Medium",
        description: "Shadow is a sleek, handsome boy who's a bit shy at first but becomes your best friend once he trusts you. He loves head scratches and playing with feather toys.",
        personality: ["Shy", "Sweet", "Gentle"],
        goodWith: ["Cats"],
        medicalStatus: "Vaccinated, Neutered, Microchipped",
        gradient: "linear-gradient(135deg, #888, #8ECAE6)",
        featured: false
    },
    {
        name: "Daisy",
        species: "dog",
        breed: "Pomeranian",
        age: "5 years",
        gender: "Female",
        size: "Small",
        description: "Daisy is a fluffy little ball of joy! She loves being the center of attention and will make you smile every day. Perfect for apartment living.",
        personality: ["Sassy", "Loving", "Energetic"],
        goodWith: ["Kids"],
        medicalStatus: "Vaccinated, Spayed, Microchipped",
        gradient: "linear-gradient(135deg, #E6C547, #F5C1A0)",
        featured: false
    },
    {
        name: "Mochi",
        species: "cat",
        breed: "Siamese Mix",
        age: "6 months",
        gender: "Female",
        size: "Small",
        description: "Mochi is an absolute sweetheart! This playful kitten loves to climb, pounce, and snuggle. She's looking for her forever home where she can grow up happy.",
        personality: ["Playful", "Vocal", "Adventurous"],
        goodWith: ["Kids", "Cats", "Dogs"],
        medicalStatus: "Vaccinated, Spayed, Microchipped",
        gradient: "linear-gradient(135deg, #8ECAE6, #F4A7BB)",
        featured: true
    }
];

const events = [
    {
        title: "Shelter Blanket Making",
        date: "March 1, 2026",
        time: "3:30 PM - 5:00 PM",
        location: "Room 204, Main Building",
        description: "Join us to make cozy fleece blankets for shelter animals! All materials provided. No experience needed.",
        spotsAvailable: 15,
        category: "crafting",
        icon: "\u2702\uFE0F",
        color: "#F4A7BB"
    },
    {
        title: "SPCA Weekend Visit",
        date: "March 8, 2026",
        time: "10:00 AM - 12:00 PM",
        location: "Montgomery County SPCA",
        description: "Spend the morning walking dogs, socializing cats, and helping with shelter chores. Parent/guardian permission required.",
        spotsAvailable: 8,
        category: "shelterVisit",
        icon: "\uD83C\uDFE5",
        color: "#8ECAE6"
    },
    {
        title: "Bake Sale Fundraiser",
        date: "March 15, 2026",
        time: "11:00 AM - 2:00 PM",
        location: "School Cafeteria",
        description: "Help run our bake sale to raise money for local shelters! We need bakers and volunteers to sell.",
        spotsAvailable: 20,
        category: "fundraiser",
        icon: "\uD83D\uDCB0",
        color: "#E6C547"
    },
    {
        title: "Senior Center Pet Therapy",
        date: "March 22, 2026",
        time: "2:00 PM - 4:00 PM",
        location: "Sunrise Senior Living",
        description: "Bring joy to seniors by helping facilitate a pet therapy session with trained therapy animals.",
        spotsAvailable: 10,
        category: "community",
        icon: "\u2764\uFE0F",
        color: "#E8935A"
    },
    {
        title: "Adoption Event Setup",
        date: "April 5, 2026",
        time: "8:00 AM - 12:00 PM",
        location: "Community Park Pavilion",
        description: "Help set up and run our spring adoption event! Tasks include setting up tents, managing check-in, and helping families meet animals.",
        spotsAvailable: 25,
        category: "shelterVisit",
        icon: "\uD83D\uDC3E",
        color: "#8ECAE6"
    }
];

const categoryLabels = {
    shelterVisit: "Shelter Visit",
    fundraiser: "Fundraiser",
    crafting: "Crafting",
    community: "Community"
};

// ============================
// DOM Ready
// ============================

document.addEventListener("DOMContentLoaded", () => {
    initNavbar();
    initMobileMenu();
    renderFeaturedPets();
    renderUpcomingPreview();
    renderAnimalGrid(animals);
    renderEvents(events);
    initAnimalFilters();
    initEventFilters();
    initFAQ();
    initDonation();
    initScrollAnimations();
    initStatCounters();
});

// ============================
// Navigation
// ============================

function initNavbar() {
    const navbar = document.getElementById("navbar");
    const navLinks = document.querySelectorAll(".nav-link");

    window.addEventListener("scroll", () => {
        navbar.classList.toggle("scrolled", window.scrollY > 10);
        updateActiveNav();
    });

    navLinks.forEach(link => {
        link.addEventListener("click", () => {
            const mobileLinks = document.getElementById("navLinks");
            const btn = document.getElementById("mobileMenuBtn");
            mobileLinks.classList.remove("active");
            btn.classList.remove("active");
        });
    });
}

function updateActiveNav() {
    const sections = document.querySelectorAll(".section");
    const navLinks = document.querySelectorAll(".nav-link");
    let current = "";

    sections.forEach(section => {
        const top = section.offsetTop - 100;
        if (window.scrollY >= top) {
            current = section.getAttribute("id");
        }
    });

    navLinks.forEach(link => {
        link.classList.toggle("active", link.getAttribute("href") === `#${current}`);
    });
}

function initMobileMenu() {
    const btn = document.getElementById("mobileMenuBtn");
    const links = document.getElementById("navLinks");

    btn.addEventListener("click", () => {
        btn.classList.toggle("active");
        links.classList.toggle("active");
    });
}

// ============================
// Animal Cards
// ============================

function createAnimalCard(animal, index) {
    const speciesEmoji = animal.species === "dog" ? "\uD83D\uDC36" : "\uD83D\uDC31";
    const card = document.createElement("div");
    card.className = "animal-card";
    card.setAttribute("data-species", animal.species);
    card.innerHTML = `
        <div class="animal-card-image" style="background: ${animal.gradient};">
            <span class="species-icon">${speciesEmoji}</span>
            <span class="species-badge">${animal.species === "dog" ? "Dog" : "Cat"}</span>
            ${animal.featured ? '<span class="featured-badge">\u2B50 Featured</span>' : ""}
        </div>
        <div class="animal-card-info">
            <h3>${animal.name}</h3>
            <p class="breed">${animal.breed}</p>
            <div class="meta">
                <span>\uD83D\uDCC5 ${animal.age}</span>
                <span>${animal.gender}</span>
            </div>
        </div>
    `;
    card.addEventListener("click", () => openAnimalModal(animal));
    return card;
}

function renderAnimalGrid(list) {
    const grid = document.getElementById("animalGrid");
    grid.innerHTML = "";
    list.forEach((animal, i) => {
        grid.appendChild(createAnimalCard(animal, i));
    });
    document.getElementById("resultsCount").textContent = `${list.length} pets available`;
}

function renderFeaturedPets() {
    const container = document.querySelector(".featured-pets-scroll");
    const featured = animals.filter(a => a.featured);
    featured.forEach((animal, i) => {
        const card = createAnimalCard(animal, i);
        card.style.minWidth = "200px";
        card.style.flexShrink = "0";
        container.appendChild(card);
    });
}

// ============================
// Animal Filters
// ============================

function initAnimalFilters() {
    const pills = document.querySelectorAll(".adopt-controls .filter-pill");
    const searchInput = document.getElementById("searchInput");

    pills.forEach(pill => {
        pill.addEventListener("click", () => {
            pills.forEach(p => p.classList.remove("active"));
            pill.classList.add("active");
            filterAnimals();
        });
    });

    searchInput.addEventListener("input", filterAnimals);
}

function filterAnimals() {
    const activeFilter = document.querySelector(".adopt-controls .filter-pill.active").dataset.filter;
    const search = document.getElementById("searchInput").value.toLowerCase();

    let filtered = animals;
    if (activeFilter !== "all") {
        filtered = filtered.filter(a => a.species === activeFilter);
    }
    if (search) {
        filtered = filtered.filter(a =>
            a.name.toLowerCase().includes(search) ||
            a.breed.toLowerCase().includes(search)
        );
    }
    renderAnimalGrid(filtered);
}

// ============================
// Animal Detail Modal
// ============================

function openAnimalModal(animal) {
    const overlay = document.getElementById("modalOverlay");
    const body = document.getElementById("modalBody");
    const speciesEmoji = animal.species === "dog" ? "\uD83D\uDC36" : "\uD83D\uDC31";

    const chipColors = {
        age: { color: "#8ECAE6", bg: "rgba(142,202,230,0.12)" },
        size: { color: "#E6C547", bg: "rgba(230,197,71,0.12)" },
        gender: { color: "#F4A7BB", bg: "rgba(244,167,187,0.12)" }
    };

    body.innerHTML = `
        <div class="modal-hero" style="background: ${animal.gradient};">
            <span class="species-icon">${speciesEmoji}</span>
            <span class="species-text">${animal.species === "dog" ? "Dog" : "Cat"}</span>
        </div>
        <div class="modal-detail-content">
            <h2>${animal.name}</h2>
            <p class="breed-text">${animal.breed}</p>
            <div class="detail-chips">
                <span class="detail-chip" style="color:${chipColors.age.color};background:${chipColors.age.bg};">\uD83D\uDCC5 ${animal.age}</span>
                <span class="detail-chip" style="color:${chipColors.size.color};background:${chipColors.size.bg};">\u2696\uFE0F ${animal.size}</span>
                <span class="detail-chip" style="color:${chipColors.gender.color};background:${chipColors.gender.bg};">${animal.gender === "Male" ? "\u2642\uFE0F" : "\u2640\uFE0F"} ${animal.gender}</span>
            </div>
            <div class="detail-section">
                <h3>Personality</h3>
                <div class="personality-tags">
                    ${animal.personality.map(t => `<span class="personality-tag">${t}</span>`).join("")}
                </div>
            </div>
            <div class="detail-section">
                <h3>About ${animal.name}</h3>
                <p>${animal.description}</p>
            </div>
            <div class="detail-section">
                <h3>Good With</h3>
                <div class="good-with-tags">
                    ${animal.goodWith.map(g => `<span class="good-with-tag">${g}</span>`).join("")}
                </div>
            </div>
            <div class="detail-section">
                <h3>Medical Status</h3>
                <div class="medical-status">
                    <span class="check">\u2705</span>
                    <span>${animal.medicalStatus}</span>
                </div>
            </div>
            <div class="modal-actions">
                <button class="btn-adopt-modal" onclick="showToast('Thank you for your interest in adopting ${animal.name}! Contact us to start the process.');">\u2764\uFE0F Adopt ${animal.name}</button>
                <button class="btn-foster-modal" onclick="showToast('Thank you for your interest in fostering ${animal.name}! We\\'ll be in touch.')">\uD83C\uDFE0 Foster ${animal.name}</button>
            </div>
        </div>
    `;

    overlay.classList.add("active");
    document.body.style.overflow = "hidden";
}

function closeModal() {
    document.getElementById("modalOverlay").classList.remove("active");
    document.body.style.overflow = "";
}

document.getElementById("modalClose").addEventListener("click", closeModal);
document.getElementById("modalOverlay").addEventListener("click", (e) => {
    if (e.target === e.currentTarget) closeModal();
});

document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") closeModal();
});

// ============================
// Events
// ============================

function renderEvents(list) {
    const container = document.getElementById("eventsList");
    container.innerHTML = "";

    list.forEach(event => {
        const card = document.createElement("div");
        card.className = "event-card";
        card.innerHTML = `
            <div class="event-card-header">
                <div class="event-card-icon" style="background: ${event.color};">${event.icon}</div>
                <div class="event-card-title">
                    <h4>${event.title}</h4>
                    <span class="category-tag" style="color: ${event.color}; background: ${event.color}22;">${categoryLabels[event.category]}</span>
                </div>
            </div>
            <div class="event-card-meta">
                <span>\uD83D\uDCC5 ${event.date}</span>
                <span>\uD83D\uDD52 ${event.time}</span>
            </div>
            <div class="event-card-footer">
                <span class="event-location">\uD83D\uDCCD ${event.location}</span>
                <button class="btn-signup" style="background: ${event.color};" onclick="showToast('You\\'re signed up for ${event.title}! See you there!')">Sign Up</button>
            </div>
        `;
        container.appendChild(card);
    });

    document.getElementById("eventCount").textContent = `${list.length} events available`;
}

function renderUpcomingPreview() {
    const container = document.getElementById("upcomingPreview");
    const event = events[0];

    container.innerHTML = `
        <div class="event-preview-card">
            <div class="event-preview-header">
                <div class="event-preview-icon" style="background: ${event.color};">${event.icon}</div>
                <div>
                    <h4>${event.title}</h4>
                    <span class="event-date">${event.date} \u2022 ${event.time}</span>
                </div>
            </div>
            <p class="event-preview-desc">${event.description}</p>
            <span class="spots-tag">\uD83D\uDC64 ${event.spotsAvailable} spots left</span>
        </div>
    `;
}

function initEventFilters() {
    const pills = document.querySelectorAll("#eventFilters .filter-pill");

    pills.forEach(pill => {
        pill.addEventListener("click", () => {
            pills.forEach(p => p.classList.remove("active"));
            pill.classList.add("active");
            const category = pill.dataset.category;
            const filtered = category === "all" ? events : events.filter(e => e.category === category);
            renderEvents(filtered);
        });
    });
}

// ============================
// FAQ Accordion
// ============================

function initFAQ() {
    document.querySelectorAll(".faq-question").forEach(btn => {
        btn.addEventListener("click", () => {
            const item = btn.parentElement;
            const wasOpen = item.classList.contains("open");

            // Close all
            document.querySelectorAll(".faq-item").forEach(i => i.classList.remove("open"));

            // Toggle current
            if (!wasOpen) item.classList.add("open");
        });
    });
}

// ============================
// Donation
// ============================

function initDonation() {
    const amountBtns = document.querySelectorAll(".amount-btn");
    const customInput = document.getElementById("customAmount");
    const donateBtn = document.getElementById("donateBtn");

    amountBtns.forEach(btn => {
        btn.addEventListener("click", () => {
            amountBtns.forEach(b => b.classList.remove("active"));
            btn.classList.add("active");
            customInput.value = "";
        });
    });

    customInput.addEventListener("input", () => {
        if (customInput.value) {
            amountBtns.forEach(b => b.classList.remove("active"));
        }
    });

    donateBtn.addEventListener("click", () => {
        const activeBtn = document.querySelector(".amount-btn.active");
        const amount = customInput.value || (activeBtn ? activeBtn.dataset.amount : "10");
        showToast(`Thank you for your $${amount} donation! Every dollar makes a difference.`);
    });
}

// ============================
// Scroll Animations
// ============================

function initScrollAnimations() {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add("visible");
            }
        });
    }, { threshold: 0.1 });

    document.querySelectorAll(".fade-in").forEach(el => observer.observe(el));
}

// ============================
// Stat Counters
// ============================

function initStatCounters() {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const el = entry.target;
                const target = parseInt(el.dataset.target);
                animateCounter(el, target);
                observer.unobserve(el);
            }
        });
    }, { threshold: 0.5 });

    document.querySelectorAll(".stat-number").forEach(el => observer.observe(el));
}

function animateCounter(el, target) {
    const duration = 1500;
    const start = performance.now();

    function update(now) {
        const elapsed = now - start;
        const progress = Math.min(elapsed / duration, 1);
        const eased = 1 - Math.pow(1 - progress, 3);
        el.textContent = Math.floor(eased * target);

        if (progress < 1) {
            requestAnimationFrame(update);
        } else {
            el.textContent = target;
        }
    }

    requestAnimationFrame(update);
}

// ============================
// Toast
// ============================

function showToast(message) {
    const toast = document.getElementById("toast");
    document.getElementById("toastMessage").textContent = message;
    toast.classList.add("show");
    closeModal();

    setTimeout(() => {
        toast.classList.remove("show");
    }, 3000);
}

// ============================
// Generic Modal (Foster Apply)
// ============================

function openModal(type) {
    if (type === "fosterApply") {
        const overlay = document.getElementById("modalOverlay");
        const body = document.getElementById("modalBody");
        body.innerHTML = `
            <div class="modal-hero" style="background: linear-gradient(135deg, #8ECAE6, #5ba3d9);">
                <span class="species-icon">\uD83C\uDFE0</span>
                <span class="species-text">Foster Application</span>
            </div>
            <div class="modal-detail-content">
                <h2>Foster Application</h2>
                <p class="breed-text">Thank you for your interest in fostering!</p>
                <div class="detail-section">
                    <p>To get started, please reach out to The Pawsitive Project and we'll guide you through the process.</p>
                </div>
                <div class="detail-section">
                    <h3>Contact Us</h3>
                    <div style="display:flex;flex-direction:column;gap:12px;">
                        <div style="display:flex;align-items:center;gap:12px;">
                            <div style="width:36px;height:36px;border-radius:50%;background:rgba(142,202,230,0.12);display:flex;align-items:center;justify-content:center;">\u2709\uFE0F</div>
                            <div>
                                <div style="font-size:12px;color:#888;font-weight:600;">Email Us</div>
                                <div style="font-size:15px;font-weight:700;">pawsitiveproject@email.com</div>
                            </div>
                        </div>
                        <div style="display:flex;align-items:center;gap:12px;">
                            <div style="width:36px;height:36px;border-radius:50%;background:rgba(142,202,230,0.12);display:flex;align-items:center;justify-content:center;">\uD83C\uDF10</div>
                            <div>
                                <div style="font-size:12px;color:#888;font-weight:600;">Instagram</div>
                                <div style="font-size:15px;font-weight:700;">@thepawsitiveproject</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `;
        overlay.classList.add("active");
        document.body.style.overflow = "hidden";
    }
}
