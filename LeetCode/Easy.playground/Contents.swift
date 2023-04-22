import UIKit

//MARK: - 1. Two Sum

/*
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

 --------------------------------------------------------------

 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 
 --------------------------------------------------------------
 
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 
 --------------------------------------------------------------

 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
 
 --------------------------------------------------------------

 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    
    for (index, value) in nums.enumerated() {
        dict[value] = index
    }
    
    for (index, value) in nums.enumerated() {
        if let otherIndex = dict[target - value], otherIndex != index {
            return [index, otherIndex]
        }
    }
    
    return [0, 0]
}

let array1 = [2, 10, 7]
let array2 = [-3, 4, 3, 90]

twoSum(array1, 9)
twoSum(array2, 0)

//MARK: - 9. Palindrome Number

/*
 
 Given an integer x, return true if x is a
 palindrome, and false otherwise.
 
 --------------------------------------------------------------
 
 Example 1:

 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 
 --------------------------------------------------------------
 
 Example 2:

 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
 --------------------------------------------------------------
 
 */

func isPalindrome(_ x: Int) -> Bool {
    var array: [String] = []
    
    for a in String(x) {
        array.append(String(a))
    }
    
    return array.reversed() == array
}

let xInt = 12321
isPalindrome(xInt)

//MARK: - Task 14. Longest Common Prefix

/*
 
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty string "".

 --------------------------------------------------------------


 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 
 --------------------------------------------------------------
 
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 
 Explanation: There is no common prefix among the input strings.
 
 --------------------------------------------------------------

 */

// Solution 1

func longestCommonPrefix1(_ strs: [String]) -> String {
    guard strs.count > 0 else { return "" }
    
    let minStr = strs.min()!
    var counter = minStr.count
    let minStrArr = Array(minStr)
    
    for str in strs {
        if str != minStr {
            let tempArr = Array(str)
            var tempCounter = 0
            for i in 0..<minStrArr.count {
                if minStrArr[i] == tempArr[i] {
                    tempCounter += 1
                } else {
                    break
                }
            }
            
            if tempCounter == 0 {
                return ""
            }
            
            if tempCounter < counter {
                counter = tempCounter
            }
        }
    }
    return String(minStr.prefix(counter))
}

let array = ["flqt", "flqwas", "flqerrr"]
longestCommonPrefix1(array)

// Solution 2

func longestCommonPrefix2(_ strs: [String]) -> String {
    guard strs.count > 0 else { return "" }
    var result = strs[0]
    
    for word in strs.dropFirst() {
        var newPrefix = ""
        for (el1, el2) in zip(result, word) {
            if el1 == el2 {
                newPrefix += String(el1)
            } else {
                break
            }
        }
        result = newPrefix
    }
    return result
}

longestCommonPrefix2(array)
