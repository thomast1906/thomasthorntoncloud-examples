  curl -X POST http://localhost:4000/v1/chat/completions \
  -H "Authorization: Bearer sk-1234" \
  -H "Content-Type: application/json" \
  -d '{
        "model": "databricks-claude-3-7-sonnet",
        "messages": [{"role": "user", "content": "Hello, Claude!"}]
      }'


  curl -X POST http://localhost:4000/v1/chat/completions \
  -H "Authorization: Bearer sk-1234" \
  -H "Content-Type: application/json" \
#   -H "editor-version: vscode/1.85.1" \
#   -H "Copilot-Integration-Id: vscode-chat" \
  -d '{
    "model": "github_copilot/gpt-4",
    "messages": [{"role": "user", "content": "Explain this error message"}]
  }'


  curl -X GET http://localhost:4000/v1/models \             
  -H "Authorization: Bearer sk-1234"   