matrix = []
count = 1
for row in range(3):
    matrix.append([])
    for col in range(3):
        matrix[row].append(count)
        count += 1

for i in range(len(matrix)):
    for j in range(len(matrix[i])):
        print(matrix[i][j], end = ' ')
    print()
print("\n")
for i in range(len(matrix)):
    for j in range(len(matrix[i])):
        print(matrix[j][i], end = ' ')
    print()