@echo off
REM ユーザー名の入力を求めるループ
:input_username
set /p git_username="Enter your Git username: "

REM ユーザー名が空でないことをチェック
if "%git_username%"=="" (
    echo Username cannot be empty. Please try again.
    goto input_username
)

REM メールアドレスの入力を求めるループ
:input_email
set /p git_email="Enter your Git email address: "

REM メールアドレスの形式をチェック
REM この例では、簡易的な形式のみをチェックしています。実際のメールアドレスの形式に合わせて適切に修正してください。
echo %git_email% | findstr /R /C:"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" > nul
if errorlevel 1 (
    echo Invalid email address format. Please enter a valid email address.
    goto input_email
)

REM Git の設定を変更する
git config --global user.name "%git_username%"
git config --global user.email "%git_email%"

echo Configuration complete.
