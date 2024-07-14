# Streamlit Calculator App

This is a simple calculator app built using Streamlit and containerized with Docker.

## Features

- Addition
- Subtraction
- Multiplication
- Division

## Requirements

- Python 3.10 or later
- Docker Desktop

## Getting Started

### Step 1: Clone the Repository

- Clone this repository to your local machine: git clone https://github.com/Jeyadev-2071/VCC-Assignment-1.git

### Step 2: Enter into folder

- cd VCC-Assignment-1

### Step 3: Open Docker Desktop

- Open Docker Desktop application

### Step 4: Creating Docker Image by running the below command

- docker build -t streamlit-calculator .

### Step 5: Running the Docker image by running the below command

- docker run -p 8501:8501 streamlit-calculator

#### Authored by - JD - G23AI2071