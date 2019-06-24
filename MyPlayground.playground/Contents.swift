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

//13.组合之和
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    candidates.sorted()
    if candidates[0] > target || candidates.count == 0 {
        return result
    }
    var temp = [Int]()
    getRemainTarget(nums: candidates, result: &result, tmp: &temp, start: 0, remain: target)
    
    return result
}

func getRemainTarget(nums: [Int], result: inout [[Int]], tmp: inout [Int], start: Int, remain: Int) {
    if remain < 0 {
        return
    } else if remain == 0 {
        result.append(tmp)
    } else {
        for i in start ..< nums.count {
            tmp.append(nums[i])
            getRemainTarget(nums: nums, result: &result, tmp: &tmp, start: i, remain: remain - nums[i])
            tmp.remove(at: tmp.count - 1)
        }
    }
}

//14.全排列
func backtrack(n: Int, nums: inout [Int], output: inout [[Int]], first: Int) {
    //排列结束
    if first == n {
        output.append(nums)
    }
    
    for i in first ..< n {
        nums.swapAt(first, i)
        backtrack(n: n, nums: &nums, output: &output, first: first+1)
        nums.swapAt(first, i)
    }
    
}

func permute(_ nums: [Int]) -> [[Int]] {
    let n = nums.count
    var tempNums = nums
    var output = [[Int]]()
    backtrack(n: n, nums: &tempNums, output: &output, first: 0)
    return output
}


//15.在排序数组中查找元素的第一个和最后一个位置(线性查找，时间复杂度O(n))
//func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
//    var p1 = 0
//    let n = nums.count
//    var result = [Int]()
//    while p1 < n {
//        if nums[p1] == target {
//            result.append(p1)
//        }
//        p1 += 1
//    }
//    return result
//}

//二分查找，时间复杂度O(log(n))
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var res = [-1, -1]
    let n = nums.count
    var left = 0
    var right = n - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            left = mid
            right = mid
            while left > 0 && nums[left] == nums[left-1] {
                left -= 1
            }
            while right < n - 1 && nums[right] == nums[right+1] {
                right += 1
            }
            res = [left, right]
            return res
        } else if nums[mid] > target {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return res
}


//官方解法：二分查找
func extremeInsertionindex(nums: [Int], target: Int, left: Bool) -> Int {
    var lo = 0
    var hi = nums.count
    
    while lo < hi {
        let mid = (lo + hi) / 2
        if nums[mid] > target || (left && target == nums[mid]) {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    
    return lo
}

func searchRange(nums: [Int], target: Int) -> [Int] {
    var targetRange = [-1, -1]
    let leftIndex = extremeInsertionindex(nums: nums, target: target, left: true)
    
    if leftIndex == nums.count || nums[leftIndex] != target {
        return targetRange
    }
    
    targetRange[0] = leftIndex
    targetRange[1] = extremeInsertionindex(nums: nums, target: target, left: false) - 1
    
    return targetRange
}

print(searchRange([5,7,7,8,8,10], 8))
