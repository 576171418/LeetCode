//1.两数之和
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0 ..< nums.count {
        for j in i+1 ..< nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

//2.无重复字符的最长子串
func lengthOfLongestSubstring(_ s: String) -> Int {
    var left = 0
    var right = 1
    var i = 0
    var result = 0
    
    if s.count > 0 {
        result = right - left
        var chars = Array(s)
        while right < chars.count {
            i = left
            while i < right {
                if chars[i] == chars[right]  {
                    left = i + 1
                    break
                }
                i = i + 1
            }
            result = max(result, right - left + 1)
            right += 1
        }
    }
    return result
}

//3.寻找两个有序数组的中位数
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let newNum = nums1 + nums2
    let sortNum = newNum.sorted()
    
    if sortNum.count % 2 == 0 {
        return Double((sortNum[sortNum.count / 2] + sortNum[sortNum.count / 2 - 1])) / 2
    } else {
        return Double(sortNum[sortNum.count / 2])
    }
}

//4.整数反转
func reverse(_ x: Int) -> Int {
    var num = x
    var rev = 0
    while num != 0 {
        let p = num % 10
        num = num / 10
        rev = rev * 10 + p
    }
    if rev > Int32.max || rev < Int32.min {
        return 0
    } else {
        return rev
    }
}

//5.回文数
func isPalindrome(_ x: Int) -> Bool {
    if x >= 0 {
        var num = x
        var rev = 0
        while num != 0 {
            let p = num % 10
            num = num / 10
            rev = rev * 10 + p
        }
        if rev == x {
            return true
        }
        return false
    } else {
        return false
    }
}

//6.盛水最多的容器
//双指针法
func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var result = 0
    while left < right {
        result = max(result, min(height[left], height[right]) * (right - left))
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    return result
}

//7.三数之和
func threeSum(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var p1 = 0
    
    var sortNum = nums.sorted()
    
    while p1 < sortNum.count - 2 && sortNum[p1] <= 0 {
        var p2 = p1 + 1
        var p3 = nums.count - 1
        while p2 < p3 {
            if sortNum[p1] + sortNum[p2] + sortNum[p3] < 0 {
                p2 += 1
            } else if sortNum[p1] + sortNum[p2] + sortNum[p3] > 0 {
                p3 -= 1
            } else {
                result.append([sortNum[p1],sortNum[p2],sortNum[p3]])
                while p2 < p3 && sortNum[p2] == sortNum[p2 + 1] {
                    p2 += 1
                }
                while p2 < p3 && sortNum[p3] == sortNum[p3 - 1] {
                    p3 -= 1
                }
                p2 += 1
                p3 -= 1
            }
        }
        while p1 < sortNum.count - 2 && sortNum[p1] == sortNum[p1+1] {
            p1 += 1
        }
        p1 += 1
    }
    return result
}

//8.最接近的三数之和
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    var p1 = 0
    var sortNums = nums.sorted()
    var answer = sortNums[0] + sortNums[1] + sortNums[2]
    
    while p1 < sortNums.count - 2 {
        var p2 = p1 + 1
        var p3 = sortNums.count - 1
        while p2 < p3 {
            let sum = sortNums[p1] + sortNums[p2] + sortNums[p3]
            
            if abs(target-sum) < abs(target-answer) {
                answer = sum
            }
            if sum < target {
                p2 += 1
            } else if sum > target {
                p3 -= 1
            } else {
                return sum
            }
        }
        p1 += 1
    }
    return answer
}

//9.删除排序数组中的重复项
func removeDuplicates(_ nums: inout [Int]) -> Int {
    //移除元素法
    // var p1 = 0
    // var p2 = p1 + 1
    // while p1 < nums.count - 1 {
    //     p2 = p1 + 1
    //     while p2 < nums.count {
    //         if nums[p1] == nums[p2] {
    //             nums.remove(at: p2)
    //             continue
    //         }
    //         p2 += 1
    //     }
    //     p1 += 1
    // }
    // return nums.count
    //不需要移除元素（leet code官方解法）
    if nums.count == 0 { return 0 }
    var i = 0
    for j in 1 ..< nums.count {
        if nums[j] != nums[i] {
            i += 1
            nums[i] = nums[j]
        }
    }
    return i+1
}

//10.移除元素
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var i = 0
    var numsCount = nums.count
    while i < numsCount {
        if val == nums[i] {
            nums.remove(at: i)
            numsCount -= 1
        } else {
            i += 1
        }
    }
    return numsCount
}

//11.爬楼梯
func climbStairs(_ n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    var nums = [Int](repeating: 0, count: n+1)
    nums[1] = 1
    nums[2] = 2
    for i in 3 ... n {
        nums[i] = nums[i - 1] + nums[i - 2]
        print(nums[i])
    }
    
    return nums[n]
}

//12.颜色分类
func sortColors(_ nums: inout [Int]) {
    var left = 0
    var right = nums.count - 1
    var i = 0
    while i <= right {
        if nums[i] == 0 {
            nums.swapAt(i, left)
            i += 1
            left += 1
        } else if nums[i] == 1 {
            i += 1
        } else {
            nums.swapAt(i, right)
            right -= 1
        }
    }
}
