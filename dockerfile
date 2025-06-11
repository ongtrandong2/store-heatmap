# Use an official Python 3.9 slim image as the base
FROM python:3.10-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Ho_Chi_Minh
ENV CUDA_VISIBLE_DEVICES=-1
ENV NVIDIA_VISIBLE_DEVICES=-1

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies in one layer to keep it clean and small
RUN apt-get update && apt-get install -y libpq-dev build-essential

# Copy only the requirements.txt first to optimize build cache
COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY App /app/

# Expose the port that the app will run on
EXPOSE 8082

# Command to run the application
CMD ["python", "app.py"]
