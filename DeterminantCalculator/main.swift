import Foundation
import Accelerate

var lines = [String]()


print("Welcome!")
print("Begin typing rows of matrix, numbers seperated by spaces. Type c to calculate.")

while let input = readLine(), input != "c" {
    lines.append(input)
}

var matrix: [[Double]] = []

for line in lines {
    var floatLine = [Double]()
    for number in line.split(separator: " ") {
        floatLine.append(Double(number) ?? 0)
    }
    matrix.append(floatLine)
}

// Our matricies need to be square.
// If not, panic.
let matrixSize = matrix.count
for row in matrix {
    if row.count != matrixSize {
        print("! Matrix is not square")
        exit(-1)
    }
}

print(det(matrix: matrix))
