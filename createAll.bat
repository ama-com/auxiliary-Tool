:: 仮想環境の作成
echo Creating virtual environment...
python -m venv venv
if %errorlevel% neq 0 (
    echo Failed to create virtual environment.
    exit /b %errorlevel%
)

:: 仮想環境のアクティベート
echo Activating virtual environment...
call venv\Scripts\activate
if %errorlevel% neq 0 (
    echo Failed to activate virtual environment.
    exit /b %errorlevel%
)

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

:: 仮想環境のディアクティベート
deactivate
