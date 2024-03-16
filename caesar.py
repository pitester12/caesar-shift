# Function to encrypt text using Caesar cipher
def caesar_encrypt(text, shift):
    encrypted_text = ""

    for char in text:
        if char.isalpha():
            ascii_val = ord(char)
            if char.isupper():
                encrypted_text += chr((ascii_val - 65 + shift) % 26 + 65)
            elif char.islower():
                encrypted_text += chr((ascii_val - 97 + shift) % 26 + 97)
        else:
            encrypted_text += char

    return encrypted_text

# Function to decrypt text using Caesar cipher
def caesar_decrypt(text, shift):
    decrypted_text = ""

    for char in text:
        if char.isalpha():
            ascii_val = ord(char)
            if char.isupper():
                decrypted_text += chr((ascii_val - 65 - shift + 26) % 26 + 65)
            elif char.islower():
                decrypted_text += chr((ascii_val - 97 - shift + 26) % 26 + 97)
        else:
            decrypted_text += char

    return decrypted_text

# Main function
def main():
    choice = input("Enter 1 to encrypt or 2 to decrypt: ")

    if choice == "1":
        plaintext = input("Enter text to encrypt: ")
        shift = int(input("Enter shift value (integer): "))
        encrypted = caesar_encrypt(plaintext, shift % 26)
        print("Encrypted text:", encrypted)
    elif choice == "2":
        ciphertext = input("Enter text to decrypt: ")
        shift = int(input("Enter shift value (integer): "))
        decrypted = caesar_decrypt(ciphertext, shift % 26)
        print("Decrypted text:", decrypted)
    else:
        print("Invalid choice. Please enter 1 for encrypt or 2 for decrypt.")

# Entry point
if __name__ == "__main__":
    main()
