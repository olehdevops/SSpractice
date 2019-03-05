def cesar_enc(text, shift=3) :
    newWord = ""
    for l in range(len(text)) :
        newLit = (ord(text[l]))+shift
        newWord += (chr(newLit))
    return newWord

def cesar_dec(newWord, shift=3) :
    oldWord = ""
    for l in range(len(newWord)) :
        newLit = (ord(newWord[l]))-shift
        oldWord += (chr(newLit))
    return print("Decryption : " + oldWord)

text = "Some words for encryption function"
result = cesar_enc(text)
print("\nCaesar cipher\n"+ "Encryption : " + result)
cesar_dec(cesar_enc(text))
