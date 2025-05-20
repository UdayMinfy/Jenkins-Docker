# Use an official Python image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy your app and tests into the container
COPY app/ app/
COPY tests/ tests/

# Install any needed packages (unittest is built-in, so no install needed)
# If you had requirements.txt, you'd add:
COPY requirements.txt .
RUN pip install -r requirements.txt

# Command to run the unit tests
CMD ["python", "-m", "unittest", "discover", "-s", "tests"]
