
:: requirements.txtのインストール
echo Installing requirements...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo Failed to install requirements.
    exit /b %errorlevel%
)

:: プロジェクトディレクトリのリスト
set projects=autoGitConfig createEcdsaKey createSshConfig

:: 各プロジェクトのビルド
for %%p in (%projects%) do (
    echo Building %%p...
    cd %%p
    python setup.py build
    if %errorlevel% neq 0 (
        echo Failed to build %%p.
        exit /b %errorlevel%
    )
    cd ..
)

echo All builds completed successfully.
