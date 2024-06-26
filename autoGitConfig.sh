#!/bin/bash

# ユーザー名の入力を求めるループ
while true; do
    read -p "Enter your Git username: " git_username

    # ユーザー名が空でないことをチェック
    if [ -z "$git_username" ]; then
        echo "Username cannot be empty. Please try again."
    else
        break
    fi
done

# メールアドレスの入力を求めるループ
while true; do
    read -p "Enter your Git email address: " git_email

    # メールアドレスの形式をチェック
    # この例では、簡易的な形式のみをチェックしています。実際のメールアドレスの形式に合わせて適切に修正してください。
    if ! [[ "$git_email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Invalid email address format. Please enter a valid email address."
    else
        break
    fi
done

# Git の設定を変更する
git config --global user.name "$git_username"
git config --global user.email "$git_email"

echo "Configuration complete."
