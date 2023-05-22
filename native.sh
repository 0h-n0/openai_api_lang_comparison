#!/bin/bash
TARGET="https://api.openai.com/v1/chat/completions"
CONTENTS_TYPE="Content-Type: application/json"
AUTH="Authorization: Bearer $OPENAI_API_KEY"
BODY='{
     "model": "gpt-3.5-turbo",
     "messages": [{"role": "user", "content": "hello"}],
     "temperature": 0.0
   }'

curl -X POST $TARGET -H "$CONTENTS_TYPE" -H "$AUTH" -d "$BODY"
