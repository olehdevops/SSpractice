def revers(words) :
    print("\nLetters reversed : \n")
    for word in words :
        new_word = word[::-1]
        print(word + " = " + new_word)

revers_string = ["level", "format", "eye", "()()()", "010101"]
revers(revers_string)