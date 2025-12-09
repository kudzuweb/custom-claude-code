---
name: frontend-design
description: Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, or applications. Generates creative, polished code that avoids generic AI aesthetics.
license: Complete terms in LICENSE.txt
---

You tend to converge toward generic, "on distribution" outputs. In frontend design, this creates what users call the "AI slop" aesthetic. Avoid this: make creative, distinctive frontends that surprise and delight.

## Design Thinking Process

Before coding, understand the context and commit to a BOLD aesthetic direction:
- **Purpose**: What problem does this interface solve? Who uses it?
- **Tone**: Pick an extreme: brutally minimal, maximalist chaos, retro-futuristic, organic/natural, luxury/refined, playful/toy-like, editorial/magazine, brutalist/raw, art deco/geometric, soft/pastel, industrial/utilitarian. Use these for inspiration but design one that is true to the aesthetic direction.
- **Constraints**: Technical requirements (framework, performance, accessibility).
- **Differentiation**: What makes this UNFORGETTABLE? What's the one thing someone will remember?

**CRITICAL**: Choose a clear conceptual direction and execute it with precision. Bold maximalism and refined minimalism both work - the key is intentionality, not intensity.

Then implement working code (HTML/CSS/JS, React, Vue, etc.) that is:
- Production-grade and functional
- Visually striking and memorable
- Cohesive with a clear aesthetic point-of-view
- Meticulously refined in every detail

## Typography (Critical Dimension)

Typography instantly signals quality. This is where generic AI designs fail most.

**Never use these fonts:**
- Inter, Roboto, Open Sans, Lato, system fonts
- Space Grotesk (overused across generations)
- Arial, Helvetica, or any web-safe defaults

**Impact choices by aesthetic:**
- **Code aesthetic**: JetBrains Mono, Fira Code, IBM Plex Mono
- **Editorial**: Playfair Display, Crimson Pro, Fraunces, Newsreader
- **Startup/Modern**: Clash Display, Satoshi, Cabinet Grotesk, Bricolage Grotesque
- **Technical**: IBM Plex Sans, Source Sans 3, Courier Prime
- **Distinctive**: Obviously, Epilogue, Neue Machina

**Pairing principle**: High contrast = interesting
- Display + monospace (e.g., Playfair Display + JetBrains Mono)
- Serif + geometric sans (e.g., Crimson Pro + Satoshi)
- Avoid pairing similar typeface families

**Use extremes:**
- Weight contrast: 100/200 vs 800/900 (NOT 400 vs 600)
- Size jumps: 3x+ scaling (NOT 1.5x increments)
- Pick ONE distinctive font and use it decisively
- Load from Google Fonts and state your choice before coding

## Color & Theme

Commit to a cohesive aesthetic with intention and depth.

**Best practices:**
- Use CSS variables for consistency across the design
- Dominant colors with sharp accents > timid, evenly-distributed palettes
- Draw from IDE themes (VS Code, JetBrains) and cultural aesthetics for inspiration
- Avoid purple gradients on white backgrounds (clichéd)
- Vary between light and dark themes across different projects

**Approach:** Pick a dominant color, add 1-2 sharp accent colors, build the entire palette around these decisions.

## Motion & Animations

Focus on high-impact, orchestrated moments rather than scattered micro-interactions.

**Best practices:**
- One well-coordinated page load with staggered reveals (using `animation-delay`) creates more delight than dozens of small animations
- Use scroll-triggering and hover states that surprise
- Prioritize CSS-only solutions for HTML/vanilla JS
- Use Motion library for React when available
- Smooth transitions between states

## Backgrounds & Visual Details

Create atmosphere and depth rather than defaulting to solid colors.

**Techniques:**
- Layer CSS gradients
- Use geometric patterns and textures
- Add contextual effects matching the overall aesthetic
- Apply dramatic shadows, decorative borders, grain overlays
- Custom cursors for small delight moments
- Layered transparencies for depth

## Spatial Composition

Break predictable layouts.

**Techniques:**
- Asymmetry and unexpected balance
- Overlap and layering
- Diagonal flow and grid-breaking elements
- Generous negative space OR controlled density (commit to one)
- Rule-of-thirds violations for visual interest

## What to Avoid

Generic AI-generated aesthetics that lack context-specific character:
- Overused font families (Inter, Roboto, Arial, Space Grotesk)
- Clichéd color schemes (especially purple gradients)
- Predictable, cookie-cutter layouts and component patterns
- Scattered, unfocused design decisions
- Convergence on common choices across different projects

## Implementation

**Match complexity to vision:**
- Maximalist designs need elaborate code with extensive animations and effects
- Minimalist designs need restraint, precision, and careful attention to spacing and typography
- Elegance comes from executing the vision well, not from adding more

**Technology stack:**
- Vanilla HTML, CSS, JavaScript
- Tailwind CSS for styling and CSS variables
- Google Fonts for distinctive typography
- CSS animations with `animation-delay` for orchestrated effects

## Remember

You are capable of extraordinary creative work. Don't hold back. Show what can truly be created when thinking outside the box and committing fully to a distinctive vision. Every design should be different, intentional, and memorable.