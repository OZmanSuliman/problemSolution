import UIKit



// time complexity O(N)
// space complexity O(N)

func getMinFlips(pwd: String) -> Int {
    // Write your code here
    var pwdArray = Array(pwd)
    var res = 0

    let zerosStr = getSubstringPerType(pwdArray, type: "0")
    let onesStr = getSubstringPerType(pwdArray, type: "1")
    let zerosCountInOnesStr = countFlipsType(onesStr, type: "0")
    let onesCountInZerosStr = countFlipsType(zerosStr, type: "1")

    res = min(zerosCountInOnesStr, onesCountInZerosStr)

    return res
}


func getSubstringPerType(_ str: [Character], type: Character) -> [Character] {
    var firstElementIndex: Int?
    var lastElementIndex: Int?
    
    for (index, char) in str.enumerated() {
        if char == type {
            if firstElementIndex == nil {
                firstElementIndex = index
            }
            lastElementIndex = index
        }
    }
    
    if let firstElementIndex, let lastElementIndex {
        return Array(str[firstElementIndex...lastElementIndex])
    }
    return [Character]()
}


func countFlipsType(_ str: [Character], type: Character) -> Int {
    var count = 0
    for char in str {
        if char == type {
            count += 1
        }
    }
    if str.count % 2 == 0 {
        return count
    } else {
        return count + 1
    }
}

getMinFlips(pwd: "1110011000")
getMinFlips(pwd: "110101")
getMinFlips(pwd: "000000")
getMinFlips(pwd: "111111")

