# Hen & Bea Music House

Source of truth for the Hen & Bea Music House companion website:
https://henandbeas-musichouse.netlify.app/

The site follows the Grade 1 book curriculum and includes the interactive Music House Keyboard.

## Build

`bash build.sh` creates the production site in `dist/`.

The HTML source is stored directly in this repository. Larger JS/CSS files are stored in `src-chunks/` and reconstructed by the build. The 18 approved story images are copied into each build from the immutable production snapshot that contains the approved web assets.

## Production deployment

Production deploys target the existing Netlify site `henandbeas-musichouse` (site ID `d7b046b2-235b-40ca-8dbc-427280eb1c5a`).

The working deployment bridge lives in `sapiverpress-studio/SapiverForge` at `.github/workflows/deploy-hen-bea-music-house.yml`. It checks out this repository's `main` branch, builds it, verifies the production bundle, and deploys the result to the existing Netlify production site using the established Netlify credential held by SapiverForge.

This keeps `Music-house/main` as the website source of truth without duplicating a Netlify secret into this repository.
