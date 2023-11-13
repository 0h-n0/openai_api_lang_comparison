#!/bin/bash

curl "https://business-transformation-office-faq-chatbot-with-gpt.openai.azure.com/openai/deployments/gpt35t16k/chat/completions?api-version=2023-07-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $AZURE_OPENAI_API_KEY" \
  -d '{
     "messages": [{"role": "user", "content": "hello"}],
     "temperature": 0.0,
     "max_tokens": 800,
     "frequency_penalty": 0.0,
     "presence_penalty": 0.0,
     "top_p": 1.0,
     "stop": null 
   }'