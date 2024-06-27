#!/bin/bash

# requirements.txtのインストール
if ! pip install -r requirements.txt; then
    echo "Failed to install requirements."
    exit 1
fi

# プロジェクトディレクトリのリスト
projects=("autoGitConfig" "createEcdsaKey" "createSshConfig")

# 各プロジェクトのビルド
for project in "${projects[@]}"; do
    echo "Building $project..."
    cd "$project"
    if ! python setup.py build; then
        echo "Failed to build $project."
        exit 1
    fi
    cd ..
done

echo "All builds completed successfully."
