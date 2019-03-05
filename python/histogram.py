
def histogram(nums):
    for num in nums :
        i = num
        print(str(i) + " transform : ")
        while i > 0 :
            print("#", end='')
            i = i - 1    
        print("\n")

nums = [1,2,10,5,0]
histogram(nums)