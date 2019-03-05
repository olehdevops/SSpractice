def bin_convert(num) :
    print("Enter the number : ")
    num = int(input())
    binary = ''
    if num == 0:
            print("Binary representation : 0")
            quit()
    while num > 0:
        binary = str(num % 2) + binary
        num = num // 2
    print("Binary representation : " + binary)

bin_convert(int)