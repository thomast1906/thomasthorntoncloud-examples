## Creating reusable Terraform with Terraform modules

Claude Code, Codex and GitHub Copilot can all run commands and change files as they work. I want some control over the environment they do that in, including which tools are installed and what they can access.

VS Code dev containers let me define that environment in the repository. I can run the agents from a terminal inside the container, give them the project’s dependencies and keep their configuration across rebuilds.

This post walks through setting up all three tools in a local dev container, signing in and checking where their commands actually run. I’ll also cover what persists when you rebuild, and what the container can still access on your laptop.

[Blog post here](https://thomasthornton.cloud/github-copilot-claude-code-codex-vscode-dev-containers/)


