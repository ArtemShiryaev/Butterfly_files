import os
import time
import re
import subprocess
import pandas as pd
import matplotlib.pyplot as plt

# Paths to the relevant files
CONTROLLER_H_PATH = "controller.h"
MAKE_SCRIPT = "./make.sh"
RUN_SCRIPT = "./runControl.sh"
DATA_FILE = "Data.txt"
LOG_FILE = "error_log.txt"

# Get user input
param_start = int(input("Enter start value for parameter: "))
param_end = int(input("Enter end value for parameter: "))
param_step = int(input("Enter step size: "))
recording_time = int(input("Enter duration for each experiment (in seconds): "))
min_data_length = int(input("Enter minimum required lines of data: "))
weight = int(input("Enter additional weight in grams (e.g., 100 for 100g): "))

param_values = range(param_start, param_end + 1, param_step)

# Create structured results folder
RESULTS_DIR = f"Results/{weight}g"
os.makedirs(RESULTS_DIR, exist_ok=True)

# Initialize error log
with open(LOG_FILE, "w") as log:
    log.write(f"Experiment Log for {weight}g\n")
    log.write("="*50 + "\n")


def modify_controller_param(param_value):
    """Modify controller.h to set the desired parameter value."""
    with open(CONTROLLER_H_PATH, "r") as file:
        content = file.read()
    
    # Update the parameter in the file
    new_content = re.sub(r"auto Kp = [0-9.]+;", f"auto Kp = {param_value};", content)

    with open(CONTROLLER_H_PATH, "w") as file:
        file.write(new_content)
    
    print(f"Updated Kp to {param_value} in {CONTROLLER_H_PATH}")


def compile_code():
    """Compile the C++ project using make.sh."""
    print("Compiling code...")
    result = subprocess.run(MAKE_SCRIPT, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode != 0:
        print("Compilation failed!")
        error_message = result.stderr.decode()
        with open(LOG_FILE, "a") as log:
            log.write(f"[ERROR] Compilation failed:\n{error_message}\n")
        return False
    print("Compilation successful!")
    return True


def run_controller(param_value):
    """Run the controller script and ensure sufficient data is recorded."""
    print(f"Running the controller for Kp={param_value} with {weight}g weight...")

    process = subprocess.Popen(RUN_SCRIPT, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    error_count = 0
    error_timestamps = []

    start_time = time.time()

    while time.time() - start_time < recording_time:
        time.sleep(1)  # Check every second
        if os.path.exists(DATA_FILE):
            with open(DATA_FILE, "r") as file:
                lines = file.readlines()
            
            if len(lines) < min_data_length:
                error_count += 1
                error_timestamps.append(time.time() - start_time)
                print(f"[WARNING] Possible break detected at {error_timestamps[-1]:.2f}s")
        
        if error_count >= 5:  # If too many breaks occur, restart experiment
            print("[ERROR] Too many breaks detected. Restarting experiment...")
            with open(LOG_FILE, "a") as log:
                log.write(f"[ERROR] Experiment failed for Kp={param_value} after {error_count} breaks.\n")
            return False

    # Terminate the process
    process.terminate()
    process.wait()

    # Check data validity
    if not os.path.exists(DATA_FILE) or os.stat(DATA_FILE).st_size == 0:
        print("Error: No data recorded. Retrying...")
        return False

    with open(DATA_FILE, "r") as file:
        lines = file.readlines()

    if len(lines) < min_data_length:
        print(f"Error: Insufficient data recorded ({len(lines)} lines). Retrying...")
        return False

    # Log errors if they occurred
    if error_count > 0:
        with open(LOG_FILE, "a") as log:
            log.write(f"[WARNING] Kp={param_value} encountered {error_count} breaks at times {error_timestamps}\n")

    return True


def preprocess_data(param_value):
    """Convert Data.txt to an Excel format with appropriate headers and generate plots."""
    df = pd.read_csv(DATA_FILE, header=None)

    # Assuming the structure is similar to what's shown in the file
    df.columns = ["Type", "Timestamp", "Value1", "Value2", "Flag"]
    
    # Create a descriptive filename
    output_name = f"data_{weight}g_{param_value}"
    excel_file = os.path.join(RESULTS_DIR, f"{output_name}.xlsx")
    txt_file = os.path.join(RESULTS_DIR, f"{output_name}.txt")
    plot_file = os.path.join(RESULTS_DIR, f"{output_name}.png")

    df.to_excel(excel_file, index=False)
    os.rename(DATA_FILE, txt_file)

    # Generate a plot
    plt.figure(figsize=(10, 5))
    plt.plot(df["Timestamp"], df["Value1"], label="Value1", marker="o", linestyle="-")
    plt.plot(df["Timestamp"], df["Value2"], label="Value2", marker="s", linestyle="--")
    plt.xlabel("Time (s)")
    plt.ylabel("Recorded Values")
    plt.title(f"Experiment Data (Kp={param_value}, {weight}g)")
    plt.legend()
    plt.grid(True)
    plt.savefig(plot_file)
    plt.close()

    print(f"Data processed and saved: {excel_file}, {txt_file}, {plot_file}")


# Main automation loop
for param in param_values:
    while True:
        modify_controller_param(param)
        
        if not compile_code():
            print("Skipping this parameter due to compilation error.")
            break  # Skip to the next parameter
        
        if run_controller(param):
            preprocess_data(param)
            break  # Proceed to the next parameter
        else:
            print(f"Retrying experiment for parameter {param} with weight {weight}g...")
