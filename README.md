# DyslexicViewer

> Point your camera at any text and experience what reading with dyslexia feels like.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## What Is DyslexicViewer?

DyslexicViewer is a free, open-source web application that lets non-dyslexic readers experience what it is like to read with different types and severities of dyslexia. Open the app on your phone or tablet, point the camera at any printed text — a book, a leaflet, a sign — and select from Instagram-style filters that simulate real dyslexia conditions in real time.

Dyslexia affects 3–7% of the population, yet most people have little understanding of what reading with dyslexia actually looks and feels like. DyslexicViewer bridges that gap by turning your device into an empathy tool.

## Why Does This Exist?

This project started as a collaboration between a parent and their daughter. The goal is simple: help people understand dyslexia — not by reading about it, but by *experiencing* it.

Whether you're a teacher preparing a lesson on learning differences, a colleague wanting to understand a teammate's experience, or simply curious, DyslexicViewer gives you a window into a world that millions navigate every day.

## How It Works

1. **Open the app** — visit the URL on your mobile device or tablet
2. **Camera activates** — the rear camera starts a live feed
3. **Choose a filter** — swipe through dyslexia type filters at the bottom of the screen
4. **Adjust severity** — use the slider to increase or decrease the intensity
5. **Read and experience** — hold your device over any printed text and try to read it
6. **Learn** — tap the info icon to learn about each type of dyslexia

No installation. No account. No data collected. Just point and experience.

## Dyslexia Filters

| Filter | What It Simulates |
|---|---|
| **Visual Stress** | Letters jitter, blur, swap (b↔d, p↔q), and crowd together — the most commonly depicted form of dyslexia |
| **Phonological** | Inner letters in words scramble; text becomes progressively harder to decode the longer you look |
| **Surface** | Words break apart into individual letters with exaggerated spacing, simulating letter-by-letter decoding |
| **Attentional** | Letters migrate between neighbouring words; only a narrow band of text is readable at any time |

Each filter includes an adjustable severity slider and brief educational information about the dyslexia type it represents.

> **Note:** Dyslexia is a complex neurological condition that affects each person differently. These filters simulate commonly reported visual experiences to build understanding and empathy — they are not clinically exact representations.

## Tech Stack

| Component | Technology |
|---|---|
| App Type | Progressive Web App (PWA) |
| Language | TypeScript |
| Build Tool | Vite |
| Camera | MediaDevices API |
| Text Recognition | Tesseract.js (WebAssembly, on-device) |
| Visual Effects | HTML5 Canvas API |
| Offline Support | Service Workers |
| Hosting | Azure Static Web Apps |

### Why a PWA?

- **Zero friction** — no app store download, just open a URL
- **Single codebase** — works on iOS, Android, and desktop browsers
- **Fully offline** — works without internet after first visit
- **Privacy first** — all processing happens on your device; no images leave your phone

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) (v18 or later)
- A modern browser with camera support

### Installation

```bash
# Clone the repository
git clone https://github.com/YourUsername/DyslexicViewer.git
cd DyslexicViewer

# Install dependencies
npm install

# Start the development server
npm run dev
```

The app will be available at `https://localhost:5173` (HTTPS is required for camera access).

### Building for Production

```bash
npm run build
npm run preview
```

## Project Structure

```
DyslexicViewer/
├── Docs/
│   └── prd.md              # Product Requirements Document
├── src/
│   ├── camera/              # Camera access and frame capture
│   ├── ocr/                 # Tesseract.js OCR integration
│   ├── filters/             # Dyslexia simulation effects
│   ├── ui/                  # Filter selector, slider, info panel
│   └── sw/                  # Service Worker for offline support
├── public/                  # Static assets
├── README.md
├── .gitignore
└── package.json
```

## Contributing

We welcome contributions from developers, designers, educators, accessibility experts, and anyone passionate about making dyslexia better understood.

### Ways to Contribute

- 🐛 **Report bugs** — open an issue describing what went wrong
- 💡 **Suggest features** — have an idea for a new filter or improvement? Let us know
- 🔬 **Improve accuracy** — if you have expertise in dyslexia, help us make the simulations more representative
- 🧑‍💻 **Write code** — pick up an issue and submit a pull request
- 📖 **Improve docs** — help make the project more approachable

Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting a pull request.

## Privacy

DyslexicViewer takes privacy seriously:

- 📷 Camera feed is processed **entirely on your device**
- 🚫 **No images** are stored, uploaded, or transmitted
- 🔒 **No accounts**, no login, no tracking
- 🍪 **No cookies** or third-party analytics by default

## Roadmap

- [x] Core PWA with camera activation
- [x] Real-time text detection (OCR)
- [ ] Visual Stress filter
- [ ] Phonological Dyslexia filter
- [ ] Surface Dyslexia filter
- [ ] Attentional Dyslexia filter
- [ ] Severity slider per filter
- [ ] Educational info panel
- [ ] Offline support (Service Worker)
- [ ] Rapid Naming Deficit filter
- [ ] Double Deficit filter
- [ ] Screenshot and share functionality
- [ ] Text input mode (no camera needed)
- [ ] Non-English language support

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

- [British Dyslexia Association](https://www.bdadyslexia.org.uk/) — dyslexia research and definitions
- [Tesseract.js](https://tesseract.projectnaptha.com/) — on-device OCR engine
- [dsxyliea by Victor Widell](https://geon.github.io/programming/2016/03/03/dsxyliea) — inspiration for letter-scrambling effects
- [Dyslexie Font by Christian Boer](https://dyslexiefont.com/) — pioneering work in dyslexia-aware typography
- Everyone who has shared their experience of reading with dyslexia

---

<p align="center">
  Built with ❤️ to build understanding.
</p>