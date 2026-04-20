Best Option: Capacitor (by Ionic)

Best for: converting the existing app with minimal rewriting

- Wraps your Next.js web app in a native shell — it's essentially a WebView with native API access
- Your existing React components, Tailwind, shadcn/ui all work as-is
- Adds native device APIs (camera, push notifications, filesystem, biometrics) via plugins
- Outputs real .ipa and .apk files for App Store / Play Store submission
- Convex's real-time subscriptions work fine inside it  


The catch: it's still a WebView under the hood, so it won't feel quite as native as a true native app, and performance on animation-heavy screens  
 can lag.

---

Best Long-Term Option: Expo (React Native)

Best for: a proper native app that shares business logic with the web app

- Your hooks, Convex queries/mutations, and auth logic are directly reusable
- You rewrite the UI layer only — swap HTML/Tailwind for React Native components
- Expo Router mirrors Next.js App Router closely, so the mental model transfers well
- Feels genuinely native on both platforms
- shadcn/ui has no direct equivalent but react-native-reusables or NativeWind + custom components fill the gap  


The catch: it's not a "conversion" tool — you're rebuilding the UI layer. It's a parallel codebase, not a wrapper.

---

Recommendation for Your Project

Given your stack, I'd suggest a two-stage approach:

1. Now: Add Capacitor to apps/web/. It takes a few hours, gets you on the App Store fast, and lets you validate mobile usage with zero UI rewriting.
2. Later (if mobile usage is significant): Build apps/mobile/ with Expo, sharing all your Convex backend logic from packages/backend/ as a shared  
   package — the Turborepo monorepo structure you already have is perfect for this.  


The monorepo setup you already have with apps/ and packages/ is exactly the right architecture to eventually support apps/web/, apps/mobile/, and  
 packages/backend/ all sharing the same Convex backend.
