#!/usr/bin/env python
import os

from openai import AzureOpenAI


if __name__ == '__main__':
    client = AzureOpenAI(
        api_version="2023-07-01-preview",
        azure_endpoint=os.environ.get('AZURE_OPENAI_ENDPOINT')
    )   
    completion = client.chat.completions.create(
        model="gpt35t16k",
        messages=[
            {
                "role": "user", 
                "content": "hello"
            },
        ],        
    )
    print(completion.choices[0].message.content)