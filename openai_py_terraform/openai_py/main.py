#!/usr/bin/env python
import os

import openai


if __name__ == '__main__':
    OPENAI_API_KEY = os.environ.get('OPENAI_API_KEY')
    content = "hello"
    chat_completion = openai.ChatCompletion.create(model="gpt-3.5-turbo", messages=[{"role": "user", "content": content}])    
    print(chat_completion.choices[0].message.content)