alias help := default

# Nix flake related commands.
mod flake './recipes/flake.just'

# List all the available recipes.
@default:
    just --list

# Format the entire source tree.
@format:
    nix fmt

# Serve the application.
@serve:
    npm run dev

# Build the application.
@build:
    npm run build
