#!/bin/bash

# This script should be run inside the "characters" folder

# Define the folder categories
categories=("avatars" "civilians" "fantasy" "medics" "robots" "zombies" "npcs")

# Create folders if they don't exist
for folder in "${categories[@]}"; do
    [ -d "$folder" ] || mkdir "$folder"
done

# Loop over each model file
for model in *.glb; do
    case "$model" in
        *Adventurer*|*Animated\ Woman*|*Astronaut*|*Beach*|*Punk*|*Character\ Animated*)
            folder="avatars"
            ;;
        *Business*|*Farmer*|*Man*|*Worker*)
            folder="civilians"
            ;;
        *Hooded*|*King*|*Knight*|*Witch*)
            folder="fantasy"
            ;;
        *Male\ Officer*)
            folder="medics"
            ;;
        *Gundam*|*Sci\ Fi*)
            folder="robots"
            ;;
        *Zombie*)
            folder="zombies"
            ;;
        *Soldier*|*SWAT*)
            folder="npcs"
            ;;
        *)
            echo "⚠️  '$model' did not match any category."
            continue
            ;;
    esac

    echo "📦 Moving '$model' to '$folder/'"
    mv -v "$model" "$folder/"
done
