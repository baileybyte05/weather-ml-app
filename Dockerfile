FROM python:3.9-slim

# Set the working directory in the container


# Install dependencies

# Copy the rest of the application code

# Run the app

<<<<<<< HEAD
FROM python:3.11-slim

# Keep Python output visible in container logs and avoid writing .pyc files.
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install Python dependencies first to take advantage of Docker layer caching.
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt Flask gunicorn

# Copy the Flask application, templates, and trained model.
COPY . .

# Run as a non-root user.
RUN useradd --create-home appuser && chown -R appuser:appuser /app
USER appuser

EXPOSE 5000

# Start the Flask app with a production WSGI server.
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
=======
>>>>>>> 43b3315ce40bee2ce5f27d5c4ba5758b2fe9ad9f
