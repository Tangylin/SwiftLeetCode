/**
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 */

import Foundation

public class Solution1 {
    
    /// 遍历数组，将每个已经遍历过的值存于字典中，key：目标值-当前遍历值，value：数组下标；当遍历到能够从字典中取出值，则说
    /// 明已经找到
    ///
    /// - Parameters:
    ///   - nums: 数组
    ///   - target: 目标值
    /// - Returns: 下标数组
    public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: Dictionary<Int, Int> = [:]
        for (tIndex, one) in nums.enumerated() {
            if let oIndex = dict[target - one] {
                return [oIndex, tIndex]
            }
            dict[one] = tIndex
        }
        return [0]
    }
}
