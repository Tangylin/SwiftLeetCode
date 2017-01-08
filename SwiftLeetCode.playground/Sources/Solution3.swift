/**
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 */


import Foundation

public class Solution3 {
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        var dict: Dictionary<Character, Int> = [:]
        var result = 0
        var j: Int = 0
        for (i, c) in s.characters.enumerated() {
            if let currentIndex = dict[c] {
                j = max(j, currentIndex + 1)
            }
            dict[c] = i
            result = max(result, i - j + 1)
        }
        return result
    }
    
}
