from msvcrt import getch
import random
print("Press any key to start the game...\n")
key = ord(getch())
generate = random.randrange(0, 100, 1)
print("Number generated! Please try to guess")
my_num = int
while my_num != generate :
    my_num = int(input())
    if key == 27 :
        print("Only digits! Try again \n")
        break
    elif my_num == 'q':
        quit()
    if my_num > generate :
        print("Generate number less. Try again \n")
    elif my_num < generate :
        print("Generate number more. Try again \n")
    
    else:
        print("The number was : " + str(generate))
    True
print("Guessed right!\nYou Win")