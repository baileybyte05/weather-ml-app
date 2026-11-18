FROM python:3.11-slim

# Keep Python output visible in container logs and avoid writing .pyc files.
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies first for better Docker layer caching.
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy only the files needed to run the Flask application.
COPY app.py ./
COPY templates/ ./templates/
COPY model/ ./model/

# Run as a non-root user.
RUN useradd --create-home appuser && chown -R appuser:appuser /app
USER appuser

EXPOSE 5000

# Serve the Flask application with a production WSGI server.
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
