palindrome_check = ["level", "word", "LOL", "()()()", "())("]

def palindrom(tmp) :
    print("\nPalindrome checking : \n")
    #tmp = []
    for word in palindrome_check :
        if word == word[::-1] :
            print(word + " : palindrome - True")
        else : 
            print(word + " : palindrome - False")
        
palindrom(palindrome_check)