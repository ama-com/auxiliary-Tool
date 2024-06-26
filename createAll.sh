#!/bin/bash

# autoGitConfig のビルド
echo "Building autoGitConfig..."
cd autoGitConfig
python setup.py build
cd ..

# createEcdsaKey のビルド
echo "Building createEcdsaKey..."
cd createEcdsaKey
python setup.py build
cd ..

# createSshConfig のビルド
echo "Building createSshConfig..."
cd createSshConfig
python setup.py build
cd ..

echo "All builds completed."
