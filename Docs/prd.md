# DyslexicViewer — Product Requirements Document

## 1. Executive Summary

**DyslexicViewer** is a free, open-source application that allows non-dyslexic readers to experience what it is like to read with different types and severities of dyslexia. The app activates the device camera and applies real-time visual filters — similar to Instagram-style filters — that simulate various forms of dyslexia over printed text such as books, leaflets, websites, or any physical document.

The project is a collaboration between a parent and their daughter, with the goal of building empathy and understanding around dyslexia for both educational and general public audiences.

---

## 2. Problem Statement

Dyslexia affects 3–7% of the population, with up to 20% experiencing some degree of symptoms (Wikipedia/Lancet 2012). Despite its prevalence, most non-dyslexic people have little understanding of what reading with dyslexia actually looks and feels like. Existing tools are limited — most are simple web demos that scramble pre-rendered text on a screen. There is no widely available tool that lets a user point their phone at real-world text and experience dyslexia in situ, in the way an augmented reality filter would.

DyslexicViewer fills this gap.

---

## 3. Market Research & Competitive Analysis

### 3.1 Existing Solutions

| Product / Project | Type | What It Does | Limitations |
|---|---|---|---|
| **dsxyliea** (geon.github.io) | Web demo | JavaScript that scrambles letters within words on a webpage to simulate the "jumping letters" experience | Only works on its own webpage text; no camera; single effect; not mobile-optimised |
| **Dyslexie Font** (dyslexiefont.com) | Typeface + Chrome Extension | A specially designed font by Christian Boer (who has dyslexia) that makes text *easier* for dyslexic readers — heavier bottoms, wider openings | Opposite goal — helps dyslexic readers rather than simulating dyslexia for others |
| **Victor Reader / OpenDyslexic** | Fonts | Accessibility fonts designed to aid dyslexic readers | Not simulators |
| **"What Reading Is Like with Dyslexia" viral posts** | Social media / images | Static images showing blurred, moving, or reversed text | Not interactive; not personalised; no camera |
| **AR-based reading aids** | Research / academic | University research projects using AR to assist dyslexic readers (e.g., colour overlays, text spacing) | Assist rather than simulate; not publicly available apps |

### 3.2 Key Insight

**No existing product combines real-time camera-based text detection with dyslexia simulation filters.** This is a genuinely novel approach. The closest experiences are:
- Web demos that scramble text already on screen (dsxyliea)
- Static images shared on social media
- Academic AR research that helps rather than simulates

DyslexicViewer's Instagram-filter approach over live camera is a first-of-its-kind consumer product.

### 3.3 Opportunities Identified

1. **Education market**: Teachers, SENCOs (Special Educational Needs Coordinators), educational psychologists, and schools could use this for training and awareness
2. **Corporate DEI training**: Diversity, equity, and inclusion programmes often lack practical tools for understanding invisible disabilities
3. **Advocacy & charity**: Dyslexia charities (e.g., British Dyslexia Association, International Dyslexia Association) may want to promote or co-brand
4. **Social media viral potential**: The Instagram-filter paradigm is inherently shareable

---

## 4. Types of Dyslexia & Corresponding Visual Filters

Based on research from Wikipedia, the British Dyslexia Association, and clinical literature, the following are the key types and subtypes of dyslexia. Each maps to a set of visual simulation effects.

### 4.1 Visual Stress / Visual Dyslexia

**Description**: Letters and words appear to move, blur, double, or shimmer. Text may appear to float on the page. Certain colour/contrast combinations (e.g., black on white) exacerbate symptoms. This is the most commonly depicted form in popular media.

**Simulation Effects**:
- Letters randomly shift position (jitter/wobble)
- Characters intermittently swap with visually similar letters (b↔d, p↔q, m↔w)
- Text appears to blur and refocus periodically
- "River" effect — white spaces between words appear to form rivers running down the page
- Crowding — letters appear to compress together, reducing spacing
- Lines of text appear to merge or overlap

**Severity Control**: Frequency and amplitude of movement, degree of blur, swap probability

### 4.2 Phonological Dyslexia

**Description**: The most common form. Difficulty mapping letters to sounds (grapheme-to-phoneme conversion). Unfamiliar words and non-words are particularly difficult. Familiar words can often be read by sight.

**Simulation Effects**:
- Unfamiliar or longer words appear scrambled (inner letters rearranged)
- Certain letter combinations appear to merge or become indistinct
- Simulated "cognitive load" — overlay that progressively obscures text the longer you look at it
- Words occasionally replaced with phonetically similar but incorrect alternatives

**Severity Control**: Percentage of words affected, degree of scrambling, delay before cognitive load effect

### 4.3 Surface Dyslexia

**Description**: Difficulty recognising whole words; readers must sound out every word letter-by-letter. Irregular words (e.g., "yacht", "colonel") are particularly problematic.

**Simulation Effects**:
- Words are broken into individual letters with exaggerated spacing
- Each letter appears sequentially with a slight delay (simulating letter-by-letter decoding)
- Irregular words are highlighted or distorted more than regular words
- Reading speed simulation — text reveals slowly

**Severity Control**: Delay between letter reveals, spacing multiplier, percentage of words affected

### 4.4 Rapid Naming Deficit

**Description**: Difficulty quickly retrieving the names of letters, numbers, colours, and objects. The reader knows what they're looking at but cannot quickly attach the right label.

**Simulation Effects**:
- Text appears normal but with a progressive reveal/fade delay
- Words momentarily appear as blurred shapes before resolving
- Occasional word-finding "gaps" where words temporarily disappear
- Numbers and letters occasionally swap

**Severity Control**: Reveal delay duration, frequency of disappearances

### 4.5 Double Deficit Dyslexia

**Description**: A combination of phonological difficulties AND rapid naming deficit. Considered the most severe form.

**Simulation Effects**:
- Combines effects from both Phonological and Rapid Naming filters
- Additional overall visual noise/static overlay
- Increased overall intensity of all effects

**Severity Control**: Combined sliders from both constituent types, plus additional noise control

### 4.6 Attentional Dyslexia

**Description**: Letters from adjacent words migrate and combine. The reader can identify individual letters correctly but they appear in the wrong word.

**Simulation Effects**:
- Letters visually migrate from one word to neighbouring words
- Words at the periphery of focus appear more scrambled than words at the centre
- Visual "tunnel" effect — only a narrow band of text is readable at any time

**Severity Control**: Migration distance, tunnel width, scramble radius

---

## 5. User Experience & Design

### 5.1 Core User Flow

```
1. Open app → Camera activates immediately (rear-facing)
2. Point device at any printed text
3. Bottom of screen: horizontal scrollable filter strip (Instagram-style)
4. Tap a filter → Effect is applied in real-time over the camera feed
5. Severity slider appears above the filter strip
6. Tap info icon (ℹ️) → Brief educational overlay about the selected dyslexia type
7. Optional: Screenshot/record to share
```

### 5.2 UI Layout

```
┌──────────────────────────────┐
│                              │
│                              │
│      Live Camera Feed        │
│     (with filter overlay)    │
│                              │
│                              │
│                              │
├──────────────────────────────┤
│ ℹ️ Educational info panel    │
│ (expandable/collapsible)     │
├──────────────────────────────┤
│  ◄── Severity Slider ──►    │
├──────────────────────────────┤
│ [None][Visual][Phono][Surf]► │
│  ◄── Swipeable Filter Strip  │
└──────────────────────────────┘
```

### 5.3 Design Principles

1. **Immediate engagement**: Camera should activate on launch with minimal friction
2. **Familiar UX**: Instagram/Snapchat filter paradigm — users already know how to use this
3. **Educational but not preachy**: Brief, clear info about each dyslexia type; not a textbook
4. **Accessible**: Ironic but important — the app itself must be accessible (high contrast UI, screen reader support for the interface elements)
5. **Shareable**: Easy screenshot/video recording to encourage social sharing

### 5.4 Educational Content Per Filter

Each filter should include:
- **Name** of the dyslexia type
- **One-sentence description** (what it is)
- **What the reader experiences** (2-3 bullet points)
- **Prevalence** (how common it is)
- **Learn more** link to a reputable source (BDA, IDA, NHS)

---

## 6. Technical Architecture

### 6.1 Technology Recommendation: Progressive Web App (PWA)

After evaluating all cross-platform options, **a Progressive Web App (PWA) is the recommended approach**, with a secondary consideration for Flutter.

#### Options Evaluated

| Technology | Single Codebase | Camera Access | On-Device OCR | Offline | App Store | Pros | Cons |
|---|---|---|---|---|---|---|---|
| **PWA** | ✅ | ✅ (MediaDevices API) | ✅ (Tesseract.js / local ML) | ✅ (Service Workers) | ❌ (but installable) | Zero friction, no app store needed, web-native, easy hosting | Limited iOS camera performance, no native AR APIs |
| **Flutter** | ✅ | ✅ (camera plugin) | ✅ (google_mlkit_text_recognition) | ✅ | ✅ | Excellent performance, single codebase, native feel | Dart language (less common), larger binary size |
| **React Native (Expo)** | ✅ | ✅ (expo-camera) | ✅ (ML Kit via libraries) | ✅ | ✅ | JavaScript/TypeScript, large ecosystem | Bridge overhead for real-time processing, Expo limitations |
| **.NET MAUI** | ✅ | ⚠️ (limited) | ⚠️ (manual integration) | ✅ | ✅ | C# / Azure ecosystem fit | Camera/AR support immature, smaller community |

#### Why PWA (Primary Recommendation)

1. **Zero installation friction**: Users scan a QR code or tap a link → instant access. No app store download, no approval process, no updates to push
2. **True single codebase**: HTML/CSS/JavaScript works identically on iOS Safari, Android Chrome, and desktop browsers
3. **Offline capability**: Service Workers cache the app shell and ML models for offline use
4. **Free hosting**: Azure Static Web Apps free tier or Cloudflare Pages (both free for static sites)
5. **Camera access**: `navigator.mediaDevices.getUserMedia()` provides camera access on all modern mobile browsers
6. **On-device OCR**: Tesseract.js (WebAssembly-compiled) runs entirely in the browser — no server needed, no internet needed after initial load
7. **Real-time canvas processing**: HTML5 Canvas API allows frame-by-frame manipulation of the camera feed to apply visual effects
8. **Open source friendly**: Web technologies have the broadest contributor base
9. **Shareable**: A URL is the most shareable format — works in any messaging app

#### PWA Limitations & Mitigations

| Limitation | Mitigation |
|---|---|
| iOS Safari restricts background camera processing | Use `requestAnimationFrame` loop; test extensively on iOS |
| No native AR framework access | Use canvas overlay rather than true AR; sufficient for text effects |
| Cannot publish to App Store as-is | Use PWABuilder or Capacitor to wrap as native app if needed later |
| WebAssembly OCR slower than native ML Kit | Optimise by processing every Nth frame; downscale image before OCR |

#### Flutter (Secondary Recommendation)

If PWA performance proves insufficient for real-time camera processing (particularly on iOS), **Flutter** is the recommended fallback:
- Compiles to native iOS and Android from a single Dart codebase
- Google ML Kit plugin provides fast on-device text recognition
- Can also compile to web (flutter web) for broader reach
- Strong community and plugin ecosystem

### 6.2 Architecture Diagram

```
┌─────────────────────────────────────────────┐
│                  PWA Client                  │
│                                              │
│  ┌──────────┐   ┌───────────┐   ┌────────┐ │
│  │  Camera   │──►│ OCR Engine│──►│ Filter │ │
│  │  Feed     │   │(Tesseract │   │ Engine │ │
│  │(getUserMe-│   │   .js)    │   │(Canvas)│ │
│  │ dia API)  │   └───────────┘   └────┬───┘ │
│  └──────────┘                         │     │
│       │                               ▼     │
│       │                    ┌──────────────┐ │
│       └───────────────────►│  Composited  │ │
│                            │  Output      │ │
│                            │ (Camera +    │ │
│                            │  Effects)    │ │
│                            └──────────────┘ │
│                                              │
│  ┌──────────────────────────────────────┐   │
│  │  UI Layer                             │   │
│  │  - Filter selector strip              │   │
│  │  - Severity slider                    │   │
│  │  - Educational info panel             │   │
│  │  - Screenshot/Share                   │   │
│  └──────────────────────────────────────┘   │
│                                              │
│  ┌──────────────────────────────────────┐   │
│  │  Service Worker (Offline Cache)       │   │
│  │  - App shell                          │   │
│  │  - Tesseract WASM + trained data      │   │
│  │  - Educational content                │   │
│  └──────────────────────────────────────┘   │
└─────────────────────────────────────────────┘
```

### 6.3 Key Technical Components

#### 6.3.1 Camera Module
- Use `navigator.mediaDevices.getUserMedia({ video: { facingMode: 'environment' } })` to access rear camera
- Stream to a hidden `<video>` element
- Capture frames to an offscreen `<canvas>` at target FPS (aim for 15–30 FPS)

#### 6.3.2 OCR Engine
- **Tesseract.js** (v5+) compiled to WebAssembly for in-browser text recognition
- Process every 3rd–5th frame to balance performance vs accuracy
- Cache recognised text regions and update incrementally
- Language packs cached by Service Worker for offline use
- Alternative: Consider **onnxruntime-web** with a lightweight text detection model for better performance

#### 6.3.3 Filter/Effect Engine
- Receives OCR output (bounding boxes + recognised text)
- Applies dyslexia-specific transformations to the canvas:
  - **Character manipulation**: Swap, scramble, mirror characters within detected text regions
  - **Motion effects**: Apply CSS transforms or canvas transforms to simulate letter movement
  - **Blur effects**: Selective Gaussian blur on text regions
  - **Timing effects**: Progressive reveal, fade in/out, disappearance
  - **Spacing effects**: Modify letter-spacing and line-height within detected regions
- Each filter is a composable function: `(frame, ocrData, severity) => transformedFrame`

#### 6.3.4 Service Worker
- Caches: App shell, Tesseract WASM binary, trained language data, educational content
- Enables fully offline operation after first visit
- Background sync for analytics (optional, privacy-respecting)

### 6.4 Performance Targets

| Metric | Target |
|---|---|
| Time to interactive | < 3 seconds (cached), < 8 seconds (first load) |
| Frame rate with filter active | ≥ 15 FPS on mid-range devices |
| OCR latency per frame | < 200ms |
| Offline cache size | < 30 MB (app + Tesseract WASM + English language pack) |
| Lighthouse PWA score | > 90 |

---

## 7. Hosting & Deployment

### 7.1 Primary: Azure Static Web Apps

Given the existing Azure subscription:
- **Azure Static Web Apps** (Free tier) — perfect for PWAs
- Built-in CI/CD from GitHub
- Custom domain support
- Global CDN
- Free SSL
- Serverless API functions if needed later (Azure Functions backend)

### 7.2 Alternative: Cloudflare Pages

If Azure proves limiting or for redundancy:
- **Cloudflare Pages** — free tier, global edge network
- Excellent performance (edge caching)
- Simple GitHub integration
- Workers for serverless logic if needed

### 7.3 Deployment Pipeline

```
GitHub (main branch)
    │
    ├──► Azure Static Web Apps (production)
    │     └── Custom domain: dyslexicviewer.com (or similar)
    │
    └──► PR Preview deployments (automatic)
```

---

## 8. Technical Considerations & Risks

### 8.1 Risks

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| iOS Safari camera performance insufficient for real-time processing | Medium | High | Test early on iOS; fall back to snapshot mode; consider Flutter as backup |
| Tesseract.js too slow for real-time OCR | Medium | High | Process fewer frames; use lightweight text detection model; cache OCR results |
| Users don't understand the filters represent real conditions | Low | Medium | Educational info panel; clear labelling; link to medical sources |
| OCR accuracy poor on handwritten or stylised text | High | Low | Document limitation; focus on printed text; improve over time |
| WebAssembly not supported on older devices | Low | Low | Modern browser requirement; progressive enhancement |

### 8.2 Approach to Simulating Dyslexia: Accuracy vs Impact

**Important note**: Dyslexia is a neurological condition — not a visual condition. The visual simulations are approximations designed to create empathy, not clinical accuracy. Many dyslexic individuals describe their experience differently. The app should clearly communicate that these are *simulations* that approximate common reported experiences, not exact representations.

The app should include a disclaimer:
> "These filters simulate commonly reported visual experiences associated with different types of dyslexia. Dyslexia is a complex neurological condition that affects each person differently. These simulations are designed to build understanding and empathy, not to provide a clinically exact representation."

---

## 9. Accessibility & Inclusivity

Despite being a dyslexia simulator, the app's own interface must be fully accessible:

- All UI controls must be operable via screen reader
- High contrast mode for interface elements
- No essential information conveyed by colour alone
- Touch targets minimum 44×44px
- Semantic HTML throughout
- WCAG 2.1 AA compliance for all interface elements
- Consider using OpenDyslexic or Dyslexie-inspired font for the app's own UI text

---

## 10. Privacy & Data

- **No user data collection**: The camera feed is processed entirely on-device
- **No images stored**: Frames are processed in memory and discarded
- **No accounts**: No login, no registration
- **No analytics by default**: Optional, privacy-respecting analytics (e.g., Plausible, Umami) can be added with consent
- **Camera permission**: Clearly explain why camera access is needed before requesting

---

## 11. Open Source Strategy

- **License**: MIT License (permissive, encourages adoption)
- **Repository**: GitHub (public)
- **Contribution guidelines**: CONTRIBUTING.md with clear setup instructions
- **Code of conduct**: Standard Contributor Covenant
- **Issue templates**: Bug reports, feature requests, dyslexia type suggestions
- **Documentation**: README with screenshots, setup guide, architecture overview

---

## 12. Future Considerations (Out of Scope for MVP)

These are not part of the initial build but are documented for future planning:

1. **Snapshot mode**: Take a photo and apply filters (fallback for performance issues)
2. **Video recording**: Record the filtered view for sharing
3. **Text input mode**: Type or paste text and see it with dyslexia filters (no camera needed)
4. **Additional languages**: OCR language packs for non-English text
5. **Guided experiences**: Step-by-step scenarios (e.g., "Try reading this paragraph for homework")
6. **Classroom mode**: Teacher controls multiple devices for group exercises
7. **Accessibility audit tool**: Reverse mode — test if your document is dyslexia-friendly
8. **Native app wrapper**: Use Capacitor or PWABuilder to publish to App Store / Google Play
9. **Dyslexia-friendly mode**: Toggle that makes the app's UI optimised for dyslexic users (ironic but useful for testing)
10. **AI-powered text complexity analysis**: Highlight words that would be particularly challenging for each dyslexia type

---

## 13. Success Metrics

| Metric | Target |
|---|---|
| Unique visitors (first 3 months) | 1,000+ |
| Average session duration | > 2 minutes |
| Filters used per session | ≥ 2 |
| Social shares | Tracking via share API usage |
| GitHub stars | 100+ (first year) |
| Lighthouse PWA score | > 90 |
| User feedback sentiment | > 80% positive |

---

## 14. MVP Scope

### In Scope (v1.0)
- [x] PWA with camera activation
- [x] Real-time text detection (OCR)
- [x] 4 dyslexia filters: Visual Stress, Phonological, Surface, Attentional
- [x] Instagram-style filter selector strip
- [x] Severity slider per filter
- [x] Brief educational info per filter
- [x] Offline support (Service Worker)
- [x] Responsive design (mobile-first, tablet-friendly)
- [x] Azure Static Web Apps deployment
- [x] Open source (GitHub, MIT License)
- [x] Disclaimer about simulation accuracy

### Out of Scope (v1.0)
- [ ] Rapid Naming Deficit filter (complex timing-based — defer to v1.1)
- [ ] Double Deficit filter (defer to v1.1, depends on above)
- [ ] Video recording / sharing
- [ ] Text input mode
- [ ] Non-English language support
- [ ] App Store / Play Store publishing
- [ ] Analytics
- [ ] User accounts

---

## 15. Technology Stack Summary

| Layer | Technology | Rationale |
|---|---|---|
| **Frontend Framework** | Vanilla JS or lightweight framework (Svelte/Preact) | Minimal bundle size; PWA performance |
| **Camera Access** | MediaDevices API (`getUserMedia`) | Web standard; works on iOS + Android |
| **OCR** | Tesseract.js (WebAssembly) | On-device; offline; open source |
| **Visual Effects** | HTML5 Canvas API + WebGL (if needed) | Frame-by-frame manipulation |
| **Offline** | Service Worker + Cache API | Full offline capability |
| **Build Tool** | Vite | Fast builds, excellent PWA plugin |
| **Language** | TypeScript | Type safety, better DX |
| **Hosting** | Azure Static Web Apps | Free tier, CI/CD from GitHub |
| **Fallback Hosting** | Cloudflare Pages | Free, edge-cached |
| **Source Control** | GitHub | Public repo, open source |
| **License** | MIT | Permissive open source |

---

## 16. References & Resources

### Dyslexia Research
- British Dyslexia Association: https://www.bdadyslexia.org.uk/dyslexia/about-dyslexia/what-is-dyslexia
- Wikipedia — Dyslexia: https://en.wikipedia.org/wiki/Dyslexia
- Wikipedia — Surface Dyslexia: https://en.wikipedia.org/wiki/Surface_dyslexia
- Wikipedia — Phonological Dyslexia: https://en.wikipedia.org/wiki/Phonological_dyslexia
- Dyslexia Delphi Study (2025): Carroll et al., Journal of Child Psychology and Psychiatry

### Existing Simulators
- dsxyliea by Victor Widell: https://geon.github.io/programming/2016/03/03/dsxyliea
- Dyslexie Font by Christian Boer: https://dyslexiefont.com/

### Technology
- Flutter Multi-platform: https://flutter.dev/multi-platform
- React Native: https://reactnative.dev/
- Tesseract.js: https://tesseract.projectnaptha.com/
- MDN MediaDevices API: https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia
- Azure Static Web Apps: https://azure.microsoft.com/en-us/products/app-service/static
- Cloudflare Pages: https://pages.cloudflare.com/

---

*Document created: 2026-03-30*
*Authors: DyslexicViewer Team*
*Status: Draft — Awaiting Review*
