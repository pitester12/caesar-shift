#!/bin/bash

# Function to encrypt text using Caesar cipher
caesar_encrypt() {
    local text="$1"
    local shift="$2"
    local encrypted_text=""

    for (( i=0; i<${#text}; i++ )); do
        char="${text:$i:1}"
        ascii_val=$(printf '%d' "'$char")
        if [[ "$ascii_val" -ge 65 && "$ascii_val" -le 90 ]]; then
            ascii_val=$(( (ascii_val - 65 + shift + 26) % 26 + 65 ))
        elif [[ "$ascii_val" -ge 97 && "$ascii_val" -le 122 ]]; then
            ascii_val=$(( (ascii_val - 97 + shift + 26) % 26 + 97 ))
        fi
        encrypted_text+="$(printf \\$(printf '%03o' "$ascii_val"))"
    done

    echo "$encrypted_text"
}

# Function to decrypt text using Caesar cipher
caesar_decrypt() {
    local text="$1"
    local shift="$2"
    local decrypted_text=""

    for (( i=0; i<${#text}; i++ )); do
        char="${text:$i:1}"
        ascii_val=$(printf '%d' "'$char")
        if [[ "$ascii_val" -ge 65 && "$ascii_val" -le 90 ]]; then
            ascii_val=$(( (ascii_val - 65 - shift + 52) % 26 + 65 ))
        elif [[ "$ascii_val" -ge 97 && "$ascii_val" -le 122 ]]; then
            ascii_val=$(( (ascii_val - 97 - shift + 52) % 26 + 97 ))
        fi
        decrypted_text+="$(printf \\$(printf '%03o' "$ascii_val"))"
    done

    echo "$decrypted_text"
}

# Main function
main() {
    if [ "$1" == "1" ]; then
        echo "Enter text to encrypt:"
        read -r plaintext
        echo "Enter shift value (integer):"
        read -r shift

        encrypted=$(caesar_encrypt "$plaintext" "$((shift % 26))")
        echo "Encrypted text: $encrypted"
    elif [ "$1" == "2" ]; then
        echo "Enter text to decrypt:"
        read -r ciphertext
        echo "Enter shift value (integer):"
        read -r shift

        decrypted=$(caesar_decrypt "$ciphertext" "$((shift % 26))")
        echo "Decrypted text: $decrypted"
    else
        echo "Invalid argument. Usage: ceaser.sh [1 for encrypt / 2 for decrypt]"
        exit 1
    fi
}

# Check for argument
if [ "$#" -ne 1 ]; then
    echo "Usage: ceaser.sh [1 for encrypt / 2 for decrypt]"
    exit 1
fi

main "$1"
