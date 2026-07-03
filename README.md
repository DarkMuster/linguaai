# 🌸 LinguaAI — Language Learning App

> Duolingo-style CEFR language courses with **Sakura Classic** design,  
> Supabase authentication and cloud progress sync.

![Live](https://img.shields.io/badge/Live-darkmuster.github.io%2Flinguaai-pink?style=flat-square)
![Languages](https://img.shields.io/badge/Languages-7-blueviolet?style=flat-square)
![CEFR](https://img.shields.io/badge/CEFR-A1--C2-purple?style=flat-square)
![Auth](https://img.shields.io/badge/Auth-Supabase-green?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

---

## 🌐 Live Demo

👉 **[darkmuster.github.io/linguaai](https://darkmuster.github.io/linguaai)**

---

## ✨ Features

| Feature | Details |
|---|---|
| 🌍 **7 Languages** | English · Japanese · German · Spanish · French · Russian · Arabic |
| 📊 **CEFR Levels** | A1 → A2 → B1 → B2 → C1 → C2 with tab navigation |
| 🔐 **Authentication** | Sign up / Sign in / Sign out via Supabase |
| ☁️ **Cloud Sync** | XP, streaks & lesson progress saved per user |
| 🎮 **Game Mechanics** | Hearts · XP · Daily streaks · Stars · Confetti |
| 🌸 **Sakura Canvas** | Animated falling cherry blossom petals + floating characters |
| 💰 **Monetisation** | Google AdSense slots + Stripe Pro paywall |
| 📱 **Responsive** | Mobile-first, works on all screen sizes |

---

## 🚀 Deploy

### GitHub Pages (current)
Settings → Pages → Branch: main → Save  
→ Live at `https://darkmuster.github.io/linguaai`

### Netlify
Drag `index.html` to **[netlify.com/drop](https://netlify.com/drop)** for instant deploy.

---

## 🔐 Supabase Setup (Auth + Database)

### 1 · Create a free project
Go to **[supabase.com](https://supabase.com)** → New project

### 2 · Run this SQL in the SQL Editor

```sql
create table profiles (
  id uuid references auth.users primary key,
  email text,
  display_name text default 'Learner',
  xp int default 0,
  streak int default 1,
  last_day text default '',
  done jsonb default '{}'::jsonb,
  created_at timestamptz default now()
);

alter table profiles enable row level security;

create policy "Users manage own profile"
  on profiles for all
  using (auth.uid() = id)
  with check (auth.uid() = id);

create or replace function handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email)
  values (new.id, new.email);
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure handle_new_user();
```

### 3 · Copy your credentials
**Project Settings → API** → copy:
- Project URL
- anon / public key

### 4 · Paste into index.html
Find these two lines near the top of the `<script>` section:

```js
const SUPA_URL = 'https://YOUR_PROJECT.supabase.co';
const SUPA_KEY = 'YOUR_ANON_KEY';
```

Replace with your real values, save, push → done! ✅

---

## 💰 Monetisation

**Google AdSense** — uncomment the `<script>` tag in `<head>`, add your `ca-pub-XXXX`

**Stripe** — find `STRIPE_LINK` in the `<script>` block, paste your payment link

---

## 🎨 Design

**Sakura Classic** — traditional Japanese aesthetic:
- **Fonts**: Noto Serif JP (headings) · Inter (body)
- **Palette**: Deep ink `#120808` · Sakura `#D4627A` · Gold `#C9993A`
- **Canvas**: Falling petals physics + floating multilingual glyphs

---

## 📜 License

MIT — use freely, modify, sell. ⭐ Star the repo if it helped!
