# DyslexicViewer — Your Learning Plan

> This is your personal guide to building DyslexicViewer. You don't need to understand everything before you start. The best way to learn is to make something real, break it, fix it, and understand a little more each time.

---

## How to use this plan

Work through the phases in order. Each session is about **30–60 minutes**. At the end of every session, you should have changed at least one visible thing — even if it's tiny. That feeling of "I made that happen" is what keeps you going.

When you get stuck (and you will — everyone does), paste your problem or error message into Claude and ask it to explain in plain English. Always ask *why* something works, not just whether it works.

---

## Phase 1 — Get the project on your screen
**Weeks 1–2 · Goal: see something working and feel like it's yours**

### Session 1 · Install your tools

- [ ] Download and install [VS Code](https://code.visualstudio.com/) — this is the app you'll write code in
- [ ] Create a free account at [github.com](https://github.com) — this is where the project lives
- [ ] Tell a parent or helper your GitHub username so they can add you to the repo

> 💬 **Ask Claude:** "Explain what GitHub is to a 12-year-old who has never coded before"

---

### Session 2 · Get the project onto your computer

Open VS Code, then open the built-in Terminal (menu: Terminal → New Terminal) and type these commands one at a time, pressing Enter after each:

```bash
git clone https://github.com/YourUsername/DyslexicViewer.git
cd DyslexicViewer
npm install
```

- `git clone` copies the project from GitHub to your computer
- `cd` moves you into the project folder
- `npm install` downloads all the tools the project needs to run

> 💬 **Ask Claude:** "What does `npm install` actually do? Explain it simply"

---

### Session 3 · Run the app for the first time

In the Terminal, type:

```bash
npm run dev
```

Then open your browser and go to `https://localhost:5173`

You should see the DyslexicViewer app. **This is your app now.** You're going to build it.

> 💬 **Ask Claude:** "What does `npm run dev` do and why do I need it?"

---

### Session 4 · Explore the project folders

In VS Code, look at the folder panel on the left. Open the `src/` folder and click through the files inside. You don't need to understand them yet — just get a feel for where things live.

Here's what each folder does:

| Folder | What it contains |
|---|---|
| `src/camera/` | Code that turns on your camera |
| `src/ocr/` | Code that reads text through the camera |
| `src/filters/` | Code for each dyslexia filter effect |
| `src/ui/` | Code for the buttons, slider, and info panel |
| `src/sw/` | Code that makes the app work offline |
| `Docs/` | Documents about the project (including this file!) |
| `public/` | Images and icons |

> 💬 **Ask Claude:** "I'm looking at a TypeScript file for the first time. Can you explain what I'm looking at?" (then paste in a file you're curious about)

---

## Phase 2 — Make your first real change
**Weeks 3–6 · Goal: change something visible and understand the edit → save → see cycle**

### Session 5 · Change some text in the app

Find a file in `src/ui/` that contains words you can see in the app — a button label, a heading, or a description. Change the text to something of your own. Save the file. Watch the browser update automatically.

This teaches you the most important thing in coding: **code is just text, and changing text changes what people see.**

> 💬 **Ask Claude:** "I changed some text in my TypeScript file but the browser isn't updating. What might be wrong?"

---

### Session 6 · Change a colour

Find where a colour is set in one of the UI files (look for words like `background`, `color`, or a hex code like `#3B82F6`). Change it to a colour you like.

> 💬 **Ask Claude:** "I want to change this button to purple. Here is the code: [paste it]. What do I change and why?"

---

### Session 7 · Write the educational info for one filter

The app shows a short explanation for each dyslexia type when you tap the info icon. This content needs to be written — and it should be written by you, because this is your project.

Find where the filter descriptions live (look in `src/ui/` or `src/filters/`). Write your own description for one of the filters. Use the PRD (`Docs/prd.md`) as a reference for what each dyslexia type actually is.

> 💡 **Tip:** This is a great early win because your own words will appear in the real app.

---

### Session 8 · Learn the basics of TypeScript

You don't need to memorise everything. Just get comfortable with these five ideas:

1. **Variables** — a named box that holds a value: `const name = "DyslexicViewer"`
2. **Functions** — a set of instructions you can reuse: `function doSomething() { ... }`
3. **If statements** — make decisions: `if (severity > 5) { applyStrongEffect() }`
4. **Arrays** — a list of things: `const filters = ["Visual", "Phonological", "Surface"]`
5. **Types** — TypeScript's superpower — describing what a variable is allowed to be: `const severity: number = 3`

> 💬 **Ask Claude:** "Teach me the 5 most important things about TypeScript for a complete beginner, with tiny examples"

---

## Phase 3 — Own one feature end to end
**Weeks 7–12 · Goal: build something new, not just edit something existing**

### Session 9 · Understand how a filter works

Open the `src/filters/` folder and read through one of the existing filter files. You won't understand everything — that's fine. Try to identify:

- Where the filter starts doing its effect
- What the `severity` variable controls
- What happens when the effect is applied to the canvas

> 💬 **Ask Claude:** "Can you walk me through what this filter code does, step by step, as if I'm 12?" (paste the file)

---

### Session 10–12 · Build the Visual Stress filter

The Visual Stress filter is the best one to build first because the effects are satisfying to see immediately. It includes:

- **Letter jitter** — letters randomly shift position slightly
- **Letter swapping** — b↔d, p↔q occasionally swap
- **Blur** — text periodically goes in and out of focus

Work on one effect at a time. For each one:

1. Ask Claude to help you write the code
2. Test it — does it look right?
3. Ask Claude to explain what each line does
4. Adjust it until you're happy

> 💬 **Ask Claude:** "I'm building a visual stress dyslexia filter using the HTML5 Canvas API. Can you help me write the letter jitter effect? Explain each line as you go."

---

### Session 13 · Wire up the severity slider

The severity slider already exists in the UI. Now make it actually do something — connect it to your filter so that moving the slider changes how intense the effect is.

This introduces one of the most important ideas in programming: **a variable that changes what the code does.** When the slider moves, it updates a number. Your filter reads that number and adjusts itself.

> 💬 **Ask Claude:** "How do I connect an HTML range slider to a variable in TypeScript so that moving the slider changes how intense my effect is?"

---

### Session 14 · Find a bug and fix it yourself

Something will have broken by now. That's completely normal — bugs are just part of coding.

1. Press **F12** in your browser to open Developer Tools
2. Click the **Console** tab
3. Look for any red error messages
4. Copy the error text and paste it to Claude

> 💬 **Ask Claude:** "What does this error mean in plain English, and how do I fix it? [paste error]"

> 💡 **The goal here isn't just to fix the bug — it's to understand *why* it happened so it doesn't trip you up again.**

---

## Phase 4 — Ship it to the world
**Month 4 onwards · Goal: real people can use something you built**

### Session 15 · Make your first commit

A commit is like saving your work with a message explaining what you changed. In the Terminal:

```bash
git add .
git commit -m "Add Visual Stress filter with severity slider"
git push
```

After you push, GitHub Actions will automatically build the app and deploy it to Cloudflare Pages. Check the **Actions** tab on GitHub to watch it run.

> 💬 **Ask Claude:** "Explain what git add, git commit, and git push do — simply"

---

### Session 16 · Open a pull request and get a preview link

Instead of pushing straight to `main`, try this:

```bash
git checkout -b my-new-filter
# make some changes
git add .
git commit -m "Start Phonological filter"
git push origin my-new-filter
```

Then go to GitHub and open a Pull Request. The CI/CD pipeline will post a preview link in the PR comments — a real URL you can send to friends and family to try your changes before they go live.

---

### Session 17 onwards · Add more filters

Each new filter you add independently is proof you can build things yourself. By now you'll know the pattern:

1. Create a new file in `src/filters/`
2. Write the effect logic
3. Connect it to the UI filter strip
4. Wire up the severity slider
5. Write the educational info
6. Commit and push

Work through the remaining filters from the PRD:
- [ ] Phonological Dyslexia
- [ ] Surface Dyslexia
- [ ] Attentional Dyslexia
- [ ] Rapid Naming Deficit *(stretch goal)*
- [ ] Double Deficit *(stretch goal)*

---

## How to use Claude as your tutor

Claude is available any time you're stuck. Here are the best ways to use it:

**Do this:**
- "Explain what this code does line by line, as if I'm 12"
- "I got this error: [paste error]. What does it mean and how do I fix it?"
- "Help me write [specific thing] and explain each part as you go"
- "Why does this work? I don't just want the answer, I want to understand it"

**Avoid this:**
- "Write the whole filter for me" *(you won't learn anything)*
- Just copying code without reading it *(always read what Claude gives you)*

The difference between someone who uses AI as a shortcut and someone who uses it to actually get better is asking *why*.

---

## You're a contributor to an open source project

Every time you push a commit, your name appears in the project history. This is a real open-source project, built for a real reason — to help people understand what it's like to read with dyslexia.

When it's live and people are using it, that's something you built. 🎉

---

*Plan written for DyslexicViewer · Last updated April 2026*
