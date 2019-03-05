    
brace = '()()(((((())))'
count = 0
lenght = len(brace)
symbol = ""

if brace[0] == ')':
    print("First is )")
    quit()
if brace[-1] == '(':
    print("Last is (")
    quit()
if lenght % 2 != 0 :
    print("odd array : " + str(lenght) + " elements")
    quit()

for i in range(lenght) :
    symbol = brace[i]
    if symbol == "(":
        count += 1
        #print(count)
    elif symbol == ")":
        count = count - 1
        #print(count)

if count != 0 :
    print(" Not OK")
else:
    print("OK")