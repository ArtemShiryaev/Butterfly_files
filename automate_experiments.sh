#!/bin/bash

# Set weight from command-line argument (default: 40g)
WEIGHT=${1:-40g}

# Create a folder for the weight if it doesn’t exist
mkdir -p "$WEIGHT"

# Absolute paths
CONTROLLER_PATH="/home/butterfly/Desktop/Course_2025/src/controller.h"
MAKE_SCRIPT="/home/butterfly/Desktop/Course_2025/make.sh"
RUN_SCRIPT="/home/butterfly/Desktop/Course_2025/runControl.sh"

# Handle CTRL+C gracefully
trap 'echo -e "\nExperiment interrupted. Cleaning up..."; exit 1' SIGINT


# Loop over w values
for w in $(seq 3 0.5 15); do
    echo "Running experiment with w=$w"

    # Update 'controller.h' with the new w value
    sed -i "s/auto w = [0-9]*\(\.[0-9]*\)\?;/auto w = $w;/" "$CONTROLLER_PATH"

    # Recompile the code
    echo "Compiling code..."
    "$MAKE_SCRIPT" || { echo "Compilation failed!"; exit 1; }

    # Run the experiment and save data inside the folder
    FILENAME="${WEIGHT}/Data_$(printf "%.1f" $w).txt"
    echo "Running experiment for 75 seconds..."
    timeout 75s sudo "$RUN_SCRIPT" > "$FILENAME"

    echo "Experiment completed for w=$w, data saved in $FILENAME"
done

echo "All experiments for weight $WEIGHT completed."
