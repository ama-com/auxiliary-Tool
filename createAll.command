#!/bin/bash

cd \dirname $0\
# 仮想環境の作成
echo "Creating virtual environment..."
python3 -m venv venv
if [ $? -ne 0 ]; then
    echo "Failed to create virtual environment."
    exit 1
fi

# 仮想環境のアクティベート
echo "Activating virtual environment..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "Failed to activate virtual environment."
    exit 1
fi

# requirements.txtのインストール
echo "Installing requirements..."
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "Failed to install requirements."
    exit 1
fi

# プロジェクトディレクトリのリスト
projects=("autoGitConfig" "createEcdsaKey" "createSshConfig")

# 各プロジェクトのビルド
for project in "${projects[@]}"; do
    echo "Building $project..."
    cd $project
    python setup.py build
    if [ $? -ne 0 ]; then
        echo "Failed to build $project."
        exit 1
    fi
    cd ..
done

echo "All builds completed successfully."

# 仮想環境のディアクティベート
deactivate
