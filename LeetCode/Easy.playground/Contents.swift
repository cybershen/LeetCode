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

//MARK: - Task 20. Valid Parentheses

/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 
 Open brackets must be closed in the correct order.
 
 Every close bracket has a corresponding open bracket of the same type.
 */

/*

Example 1:

Input: s = "()"
Output: true
 
Example 2:

Input: s = "()[]{}"
Output: true
 
Example 3:

Input: s = "(]"
Output: false

*/

func isValid(_ s: String) -> Bool {
    var array: [Character] = []
    
    var openCurve: Character = "{"
    var closeCurve: Character = "}"
    
    var secondOpenCurve: Character = "("
    var secondCloseCurve: Character = ")"
    
    var quadratirOpenCurve: Character = "["
    var quadraticCloseCurve: Character = "]"
    
    for element in s {
        if array.last == openCurve,
           element == closeCurve {
            array.removeLast()
        } else if array.last == secondOpenCurve,
                  element == secondCloseCurve {
            array.removeLast()
        } else if array.last == quadratirOpenCurve,
                  element == quadraticCloseCurve {
            array.removeLast()
        } else {
            if element == openCurve || element == secondOpenCurve || element == quadratirOpenCurve {
                array.append(element)
            } else {
                return false
            }
        }
    }
    return array.isEmpty
}

let testSTR = "{{}}"
let testSTR2 = "{{}"
let testSTR3 = "(]"

isValid(testSTR)
isValid(testSTR2)
isValid(testSTR3)

//MARK: - Task 58. Length of Last Word

/*
 
 Given a string s consisting of words and spaces, return the length of the last word in the string.

 A word is a maximal substring consisting of non-space characters only.

 Example 1:

 Input: s = "Hello World"
 Output: 5
 Explanation: The last word is "World" with length 5.
 
 Example 2:

 Input: s = "   fly me   to   the moon  "
 Output: 4
 Explanation: The last word is "moon" with length 4.
 
 Example 3:

 Input: s = "luffy is still joyboy"
 Output: 6
 Explanation: The last word is "joyboy" with length 6.
 
 */

func lengthOfLastWord(_ s: String) -> Int {
    var newS = s
    var words: [String] = []
    var tempWord: String = ""
    var finalWords: [String] = []
    
    var index = 0
    
    newS += " "
    
    while index != newS.count {
        for element in newS {
            index += 1
            if element == " " {
                words.append(tempWord)
                tempWord = ""
            } else {
                tempWord.append(String(element))
            }
        }
    }
    
    for word in words {
        if word != "" {
            finalWords.append(word)
        }
    }
        
    return finalWords.last?.count ?? 0
}

let str = " banan aaple  asdascxzvsdaxz      "
let str2 = "luffy is still joyboy"

lengthOfLastWord(str)
lengthOfLastWord(str2)

//MARK: - Task 125. Valid Palindrome

/*
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.

 Example 1:

 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 
 Example 2:

 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 
 Example 3:

 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
 
 */

func isPalindrome(_ s: String) -> Bool {
    var arrayOfChars: [Character] = []
    
    for char in s {
        if char.isLetter || char.isNumber {
            arrayOfChars.append(Character(String(char.lowercased())))
        }
    }
    
    return arrayOfChars == arrayOfChars.reversed()
}

//MARK: - Task 27. Remove Element

/*
 
 Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.

 Consider the number of elements in nums which are not equal to val be k, to get accepted, you need to do the following things:

 Change the array nums such that the first k elements of nums contain the elements which are not equal to val. The remaining elements of nums are not important as well as the size of nums.
 Return k.
 Custom Judge:

 The judge will test your solution with the following code:
 
 int[] nums = [...]; // Input array
 int val = ...; // Value to remove
 int[] expectedNums = [...]; // The expected answer with correct length.
                             // It is sorted with no values equaling val.

 int k = removeElement(nums, val); // Calls your implementation

 assert k == expectedNums.length;
 sort(nums, 0, k); // Sort the first k elements of nums
 for (int i = 0; i < actualLength; i++) {
     assert nums[i] == expectedNums[i];
 }
 
 If all assertions pass, then your solution will be accepted.

  

 Example 1:

 Input: nums = [3,2,2,3], val = 3
 Output: 2, nums = [2,2,_,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 2.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 Example 2:

 Input: nums = [0,1,2,2,3,0,4,2], val = 2
 Output: 5, nums = [0,1,4,0,3,_,_,_]
 
 Explanation: Your function should return k = 5, with the first five elements of nums containing 0, 0, 1, 3, and 4.
 Note that the five elements can be returned in any order.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 */

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    let count = nums.count
    
    nums.removeAll { num in
        num == val
    }
    
    let resultCount = nums.count
    
    let newCount = count - nums.count
    
    for _ in 0...max(newCount - 1, 0) {
        nums.append(val)
    }
    
    return resultCount
}

var array55 = [55, 2432, 34, 523, 2]

removeElement(&array55, 0)
