# Build the image from the BerriAI/litellm repository
docker build -t litellm-local https://github.com/BerriAI/litellm.git

# Run the container  
docker run -d \
    --name litellm-container \
    -p 4000:4000 \
    -v $(pwd)/config.yaml:/app/config.yaml \
    --env-file .env \
    litellm-local \
    --config /app/config.yaml --port 4000