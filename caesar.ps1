# Function to encrypt text using Caesar cipher
function caesar_encrypt {
    param($text, $shift)
    $encrypted_text = ""

    foreach ($char in $text) {
        if ($char -cmatch '[A-Za-z]') {
            $ascii_val = [int][char]$char
            if ($char -cmatch '[A-Z]') {
                $encrypted_text += [char](((($ascii_val - 65 + $shift) % 26) + 65))
            }
            elseif ($char -cmatch '[a-z]') {
                $encrypted_text += [char](((($ascii_val - 97 + $shift) % 26) + 97))
            }
        }
        else {
            $encrypted_text += $char
        }
    }

    return $encrypted_text
}

# Function to decrypt text using Caesar cipher
function caesar_decrypt {
    param($text, $shift)
    $decrypted_text = ""

    foreach ($char in $text) {
        if ($char -cmatch '[A-Za-z]') {
            $ascii_val = [int][char]$char
            if ($char -cmatch '[A-Z]') {
                $decrypted_text += [char](((($ascii_val - 65 - $shift + 26) % 26) + 65))
            }
            elseif ($char -cmatch '[a-z]') {
                $decrypted_text += [char](((($ascii_val - 97 - $shift + 26) % 26) + 97))
            }
        }
        else {
            $decrypted_text += $char
        }
    }

    return $decrypted_text
}

# Main function
function main {
    $choice = Read-Host "Enter 1 to encrypt or 2 to decrypt: "

    if ($choice -eq "1") {
        $plaintext = Read-Host "Enter text to encrypt: "
        $shift = Read-Host "Enter shift value (integer): "
        $encrypted = caesar_encrypt $plaintext ($shift % 26)
        Write-Host "Encrypted text: $encrypted"
    }
    elseif ($choice -eq "2") {
        $ciphertext = Read-Host "Enter text to decrypt: "
        $shift = Read-Host "Enter shift value (integer): "
        $decrypted = caesar_decrypt $ciphertext ($shift % 26)
        Write-Host "Decrypted text: $decrypted"
    }
    else {
        Write-Host "Invalid choice. Please enter 1 for encrypt or 2 for decrypt."
    }
}

# Entry point
if ($MyInvocation.InvocationName -eq $null) {
    main
}
