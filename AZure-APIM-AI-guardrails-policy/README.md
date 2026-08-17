## Azure AI Guardrails: The Policy and APIM XML Behind the Two-Layer Model

Azure Policy controls what can be deployed and how Azure resources are configured while API Management controls what happens when applications start consuming those resources.

I deliberately kept that post at the architecture level. I referred to controls such as llm-token-limit, model allow-lists and content safety without getting into the policy definitions or XML behind them.

This is the next layer down: the Azure Policy definitions I would look at first, the APIM policies behind some of the runtime controls, and a few details that are easy to miss when you move from an architecture diagram to an implementation.

This post sits between the architecture and the deeper APIM implementation. I’ll follow it with two posts that go further into the APIM side, covering rate limits, token quotas and observability first, then content safety and model control. Here, I want to focus on how the Azure Policy and APIM layers fit together and what the controls actually look like.

[Blog post here](https://thomasthornton.cloud/azure-ai-guardrails-the-policy-and-apim-xml-behind-the-two-layer-model/)
