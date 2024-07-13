# Streamlit Calculator App

This is a simple calculator app built using Streamlit and containerized with Docker.

## Features

- Addition
- Subtraction
- Multiplication
- Division

## Requirements

- Python 3.10 or later
- Docker

## Getting Started

### Step 1: Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/Jeyadev-2071/VCC-Assignment-1.git

cd streamlit-calculator

docker build -t streamlit-calculator .

docker run -p 8501:8501 streamlit-calculator

