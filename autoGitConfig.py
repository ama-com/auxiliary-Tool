from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization
import os
import pyperclip

def generate_ecdsa_keypair(bits=256):
    # ECDSA 鍵の生成
    curve = ec.SECP521R1()  # ここで楕円曲線の選択
    private_key = ec.generate_private_key(curve, default_backend())

    # 秘密鍵のシリアライズ
    private_key_bytes = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.TraditionalOpenSSL,
        encryption_algorithm=serialization.NoEncryption()
    )

    # 秘密鍵の保存
    private_key_path = os.path.expanduser("~/.ssh/id_ecdsa")
    with open(private_key_path, "wb") as f:
        f.write(private_key_bytes)

    # 公開鍵の取得
    public_key = private_key.public_key().public_bytes(
        encoding=serialization.Encoding.OpenSSH,
        format=serialization.PublicFormat.OpenSSH
    )

    # クリップボードに公開鍵の内容をコピーする
    pyperclip.copy(public_key.decode('utf-8'))

    return private_key_path, public_key.decode('utf-8')

if __name__ == "__main__":
    private_key_path, public_key = generate_ecdsa_keypair()
    
    print("Generated ECDSA keypair successfully.")
    print(f"Private key saved to: {private_key_path}")
    print("Public key copied to clipboard.")
    print("\nPublic key:")
    print(public_key)
