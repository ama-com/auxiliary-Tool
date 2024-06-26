@echo off
cd autoGitConfig
python setup.py build
cd ..
cd createEcdsaKey
python setup.py build
cd ..
cd createSshConfig
python setup.py build
cd ..