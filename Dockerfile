# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /appcode

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Adding a debug step
RUN ls -la /appcode

# Install any needed packages specified in requirements.txt
RUN pip install -r appcode/requirements.txt

# Make port 8501 available to the world outside this container
EXPOSE 8501

# Run streamlit when the container launches
CMD ["streamlit", "run", "appcode/app.py"]
