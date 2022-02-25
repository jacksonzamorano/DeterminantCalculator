import Foundation
import Accelerate


struct TwoMatrix {
    var a: Double
    var b: Double
    var c: Double
    var d: Double
    init(fromMatrixStructure: [[Double]]) {
        self.a = fromMatrixStructure[0][0]
        self.b = fromMatrixStructure[0][1]
        self.c = fromMatrixStructure[1][0]
        self.d = fromMatrixStructure[1][1]
    }
}

func det(matrix: [[Double]]) -> Double {
    let length = matrix.count
    if length == 2 {
        // Simple 2x2 matrix...
        let twoMatrix = TwoMatrix(fromMatrixStructure: matrix)
        return (twoMatrix.a*twoMatrix.d) - (twoMatrix.b*twoMatrix.c)
    } else {
        var totalDeterminent:Double = 0
        for column in 0..<matrix.count {
            let columVal = matrix[0][column]
            var secondaryMatrix = [[Double]]()
            // Generate secondary matrix
            for row in 1..<matrix.count {
                var newRow = [Double]()
                for newColumn in 0..<matrix.count {
                    if newColumn != column { newRow.append(matrix[row][newColumn]) }
                }
                secondaryMatrix.append(newRow)
            }

            let determinant = det(matrix: secondaryMatrix)
            
            // Formula goes add det, subtract det, add det, subtract det
            // on and on forever.
            let isEven = column%2 == 0
            if isEven {
                totalDeterminent -= columVal*determinant
            } else {
                totalDeterminent += columVal*determinant
            }
        }
        return totalDeterminent
    }
}
