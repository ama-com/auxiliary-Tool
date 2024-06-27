#!/bin/bash

# 仮想環境をアクティベート
source venv/bin/activate

# pip freeze を使用して requirements.txt を生成
pip freeze > requirements.txt

# 仮想環境をディアクティベート
deactivate
