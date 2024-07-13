FROM python:3.10

WORKDIR /question-2

# Copy the current directory contents into the container at 
COPY . .

# Adding a debug step
RUN ls -la /question-2

# Install any needed packages specified in requirements.txt
RUN pip install -r question-2/requirements.txt

# Make port 8501 available to the world outside this container
EXPOSE 8501

# Run streamlit when the container launches
CMD ["streamlit", "run", "question-2/app.py"]
