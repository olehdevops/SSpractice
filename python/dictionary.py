def dictionary():
#string = "aabbccaacbasszzxx"
    print("Input string :")
    string = input()
    slovarik = {}
    for key in string :
        if key not in slovarik :
            slovarik[key] = 1
        else:
            slovarik[key] += 1

    print(slovarik)

dictionary()