-- LinguaAI — Supabase Database Setup
-- Run this in your Supabase project's SQL Editor

create table if not exists profiles (
  id uuid references auth.users primary key,
  email text,
  display_name text default 'Learner',
  xp int default 0,
  streak int default 1,
  last_day text default '',
  done jsonb default '{}'::jsonb,
  created_at timestamptz default now()
);

-- Row Level Security: users can only touch their own row
alter table profiles enable row level security;

create policy "Users manage own profile"
  on profiles for all
  using (auth.uid() = id)
  with check (auth.uid() = id);

-- Auto-create profile row when user signs up
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
