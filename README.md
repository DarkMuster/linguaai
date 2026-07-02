# 🌐 LinguaAI — Free Language Learning App

> A Duolingo-style static web app you can deploy for free and monetise with AdSense + Stripe.  
> **No backend. No API. No dependencies.** Just drop one folder on Netlify and go live.

![LinguaAI Preview](https://img.shields.io/badge/Status-Live-brightgreen) ![Languages](https://img.shields.io/badge/Languages-7-blue) ![Levels](https://img.shields.io/badge/CEFR-A1--C2-purple) ![License](https://img.shields.io/badge/License-MIT-yellow)

---

## ✨ Features

| Feature | Details |
|---|---|
| 🌍 **7 Languages** | English, Japanese, German, Spanish, French, Russian, Arabic |
| 📊 **CEFR Levels** | A1 → A2 → B1 → B2 → C1 → C2 (progressive unlock) |
| 🎮 **Exercise Types** | Multiple choice · Pair matching · Fill-in-the-blank |
| ❤️ **Game Mechanics** | Hearts · XP · Daily Streaks · Stars · Confetti |
| 🎨 **Animated BG** | Canvas particle network + floating language characters |
| 💰 **Monetisation** | Google AdSense slots + Stripe Premium paywall |
| 📱 **Responsive** | Mobile-first, works on all screens |
| 💾 **Offline-ready** | All progress saved in localStorage, no server needed |

---

## 🚀 Deploy in 60 seconds (free)

### Option 1 — Netlify Drop (easiest)
1. Download / clone this repo
2. Go to **[netlify.com/drop](https://netlify.com/drop)**
3. Drag the entire `linguaai/` folder onto the page
4. ✅ Live at a free `.netlify.app` URL

### Option 2 — GitHub Pages
```bash
git clone https://github.com/YOUR_USERNAME/linguaai.git
cd linguaai
git checkout -b gh-pages
git push origin gh-pages
```
Then: **Settings → Pages → Branch: gh-pages → Save**

### Option 3 — Vercel
```bash
npx vercel --prod
```

---

## 💰 Monetisation Setup

### 1. Google AdSense (passive income)
```html
<!-- In index.html <head>, uncomment and replace YOUR_ID: -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js
  ?client=ca-pub-YOUR_ADSENSE_ID" crossorigin="anonymous"></script>
```
Then replace the ad slot placeholders in `index.html` with real `<ins>` tags.

### 2. Stripe Premium ($4.99/month)
1. Create a subscription product at [dashboard.stripe.com](https://dashboard.stripe.com)
2. Copy the **Payment Link URL**
3. Open `js/main.js` and update:
```js
const CFG = {
  STRIPE_LINK: 'https://buy.stripe.com/YOUR_LINK_HERE',
  PRICE: '$4.99/month',
};
```

### 3. Free vs Premium
- **Free**: All A1 units for all 7 languages
- **Premium**: A2, B1, B2, C1, C2 units — gated behind Stripe paywall

---

## 📁 Project Structure

```
linguaai/
├── index.html          ← App shell (HTML skeleton)
├── README.md           ← This file
├── .gitignore
├── css/
│   ├── style.css       ← All UI styles (design system)
│   └── animations.css  ← Keyframes & transition CSS
└── js/
    ├── main.js         ← Config, state, boot
    ├── courses.js      ← All course content (A1–C2 database)
    ├── engine.js       ← Lesson logic (exercises, scoring, hearts)
    ├── ui.js           ← Screen rendering functions
    └── animations.js   ← Canvas particle + floating chars animation
```

---

## 🛠️ Adding Content

Open `js/courses.js`. Each language follows this structure:

```js
ja: {
  flag: '🇯🇵', name: 'Japanese', native: '日本語',
  levels: [
    {
      id: 'A1', label: 'Beginner', color: '#10B981', free: true,
      units: [
        {
          title: 'Greetings', icon: '👋',
          lessons: [
            {
              title: 'Hello & Goodbye', icon: '🌸', xp: 15,
              ex: [
                { t: 'choice', q: 'What does こんにちは mean?',
                  word: 'こんにちは', pron: 'Konnichiwa',
                  opts: ['Hello','Goodbye','Thanks','Sorry'], ans: 'Hello' },
                // more exercises...
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

Exercise types: `intro` · `choice` · `match` · `fill`

---

## 🎨 Design System

Built on the **UI UX Pro Max** skill — EdTech/AI-Native profile:
- **Font**: Baloo 2 (headings) + Inter (body)
- **Palette**: Deep Indigo space (`#07050f`) + Violet (`#4F46E5`) + Cyan (`#06B6D4`)
- **Style**: Glassmorphism cards on animated canvas background
- **Animation**: 60fps canvas — particle network + floating multilingual characters

---

## 📜 License

MIT — use freely, modify, sell. Attribution appreciated but not required.

---

## ⭐ Star this repo if it helped you!
