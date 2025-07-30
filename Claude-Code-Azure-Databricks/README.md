# LiteLLM with Databricks Claude Models

This repository provides a containerised setup for running [LiteLLM](https://github.com/BerriAI/litellm) with Databricks-hosted Claude models. LiteLLM acts as a unified proxy server that provides OpenAI-compatible API endpoints for various LLM providers, including Databricks.

## What is LiteLLM?

LiteLLM is a lightweight proxy server that translates requests between different LLM providers using OpenAI's API format. This allows you to:

- Use a unified API interface across different LLM providers
- Switch between models without changing your code
- Monitor and log LLM usage
- Implement rate limiting and authentication

## Features

- **Databricks Claude Models**: Access to Claude 3.7 Sonnet and Claude 4 Sonnet etc through Databricks
- **OpenAI-Compatible API**: Use standard OpenAI SDK/API format
- **Containerized Deployment**: Easy setup with Docker or Docker Compose
- **Configuration Management**: YAML-based model configuration
- **Debug Mode**: Built-in debugging for troubleshooting

## Prerequisites

- Docker and Docker Compose installed
- Databricks workspace with Claude models enabled
- Databricks API key and base URL

## Quick Start

### 1. Clone or Download

Clone this repository or download the files to your local machine.

### 2. Configure Environment Variables

Update the `.env` file with your Databricks credentials:

```bash
DATABRICKS_API_KEY=your_databricks_api_key_here
DATABRICKS_API_BASE=https://your-databricks-workspace.azuredatabricks.net/serving-endpoints/
```

### 3. Start with Docker Compose (Recommended)

```bash
docker-compose up -d
```

### 4. Alternative: Use Docker Run Script

```bash
./docker-run.sh
```

### 5. Verify Installation

Check if the service is running:

```bash
curl -X GET http://localhost:4000/v1/models \
  -H "Authorization: Bearer sk-1234"
```

## Configuration

### Model Configuration

The `config.yaml` file defines the available models:

```yaml
model_list:
  - model_name: databricks-claude-sonnet-4
    litellm_params:
      model: databricks/databricks-claude-sonnet-4
      api_key: os.environ/DATABRICKS_API_KEY
      api_base: os.environ/DATABRICKS_API_BASE
  - model_name: databricks-claude-3-7-sonnet
    litellm_params:
      model: databricks/databricks-claude-3-7-sonnet
      api_key: os.environ/DATABRICKS_API_KEY
      api_base: os.environ/DATABRICKS_API_BASE
```

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `DATABRICKS_API_KEY` | Your Databricks personal access token | Yes |
| `DATABRICKS_API_BASE` | Databricks serving endpoints URL | Yes |

## Usage

### Making API Calls

Once the service is running, you can make OpenAI-compatible API calls:

#### Chat Completions

```bash
curl -X POST http://localhost:4000/v1/chat/completions \
  -H "Authorization: Bearer sk-1234" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "databricks-claude-3-7-sonnet",
    "messages": [{"role": "user", "content": "Hello, Claude!"}]
  }'
```

#### List Available Models

```bash
curl -X GET http://localhost:4000/v1/models \
  -H "Authorization: Bearer sk-1234"
```

### Using with OpenAI SDK

You can use the standard OpenAI Python SDK:

```python
from openai import OpenAI

client = OpenAI(
    api_key="sk-1234",  # This can be any string when using LiteLLM
    base_url="http://localhost:4000/v1"
)

response = client.chat.completions.create(
    model="databricks-claude-3-7-sonnet",
    messages=[
        {"role": "user", "content": "Hello, Claude!"}
    ]
)

print(response.choices[0].message.content)
```

## File Structure

```
├── README.md                 # This file
├── docker-compose.yaml       # Docker Compose configuration
├── docker-run.sh            # Alternative Docker run script
├── config.yaml              # LiteLLM model configuration
├── .env                     # Environment variables
├── commands.sh              # Example API calls
└── exports/                 # Additional exports (if any)
```

## Deployment Options

### Option 1: Docker Compose (Recommended)

```bash
# Start the service
docker-compose up -d

# View logs
docker-compose logs -f

# Stop the service
docker-compose down
```

### Option 2: Docker Run

```bash
# Make the script executable
chmod +x docker-run.sh

# Run the script
./docker-run.sh
```

## Troubleshooting

### Common Issues

1. **Container fails to start**: Check your Databricks credentials in `.env`
2. **API calls fail**: Verify the Databricks API base URL format
3. **Models not available**: Ensure Claude models are enabled in your Databricks workspace

### Debug Mode

The service runs in debug mode by default. Check logs for detailed information:

```bash
# For Docker Compose
docker-compose logs -f litellm

# For Docker run
docker logs litellm-container-berriainew
```

### Testing Connection

Use the provided test commands in `commands.sh`:

```bash
# Test model availability
curl -X GET http://localhost:4000/v1/models -H "Authorization: Bearer sk-1234"

# Test chat completion
curl -X POST http://localhost:4000/v1/chat/completions \
  -H "Authorization: Bearer sk-1234" \
  -H "Content-Type: application/json" \
  -d '{"model": "databricks-claude-3-7-sonnet", "messages": [{"role": "user", "content": "Hello!"}]}'
```

## Security Notes

- The API key in examples (`sk-1234`) is a placeholder - LiteLLM doesn't validate this when proxying to Databricks
- Keep your Databricks API key secure and never commit it to version control
- Consider using Docker secrets or external secret management in production

## License

This project uses the open-source LiteLLM proxy. Please refer to the [LiteLLM repository](https://github.com/BerriAI/litellm) for licensing information.

## Related Links

- [LiteLLM Documentation](https://docs.litellm.ai/)
- [Databricks LLM Documentation](https://docs.databricks.com/en/machine-learning/foundation-models/index.html)
- [OpenAI API Documentation](https://platform.openai.com/docs/api-reference)
