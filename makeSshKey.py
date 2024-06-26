import paramiko
import pyperclip

def generate_ssh_keypair():
    # SSH キーの生成
    key = paramiko.RSAKey.generate(bits=2048)
    
    # 公開鍵の内容を取得
    public_key = key.get_base64()
    
    # クリップボードに公開鍵の内容をコピーする
    pyperclip.copy(public_key)
    
    print("Generated SSH keypair successfully.")
    print("Public key copied to clipboard.")
    print("\nPublic key:")
    print(public_key.decode('utf-8'))  # バイト列を文字列にデコードして表示する

if __name__ == "__main__":
    generate_ssh_keypair()
