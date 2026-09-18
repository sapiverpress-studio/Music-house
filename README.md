# Hen & Bea Music House

Source for the Hen & Bea Music House companion website:
https://henandbeas-musichouse.netlify.app/

The site follows the Grade 1 book curriculum and includes the interactive Music House Keyboard.

## Deployment

Netlify runs `bash build.sh` and publishes `dist/`.

The HTML source is stored directly in the repository. Larger JS/CSS files are stored in `src-chunks/` and reconstructed by the build so the GitHub connector can manage the site reliably. The 18 approved story images are copied into each build from the existing immutable Netlify deploy snapshot.
