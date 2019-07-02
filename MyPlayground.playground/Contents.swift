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

/*16.接雨水
 暴力解法
 由题可以看出每一格可以接的雨水为左边最大数以及右边最大数中较小的数字减去元素本身的格子
 此解法用双循环，依次找出每一个元素左右最大的数，求本身可以接的雨水量，累加到结果中
 第一个元素以及最后一个元素由于左边/右边没有柱子，所接雨水量
 时间复杂度：O(N的平方)
 Leet Code: 2012ms
 */
func trap(_ height: [Int]) -> Int {
    var ans = 0
    for i in 1 ..< height.count - 1 {
        var max_left = 0
        var max_right = 0
        var j = i
        while j >= 0 {
            max_left = max(height[j], max_left)
            j -= 1
        }
        var k = i
        while k < height.count {
            max_right = max(height[k], max_right)
            k += 1
        }
        ans += (min(max_left, max_right) - height[i])
    }
    return ans
}

/*
 优化:动态规划
 以上解法我们可以新建一个临时变量，来保存当前元素中的最大值，以及当前位置
 在对下一个元素进行遍历时，我们可以从当前位置开始
  Leet Code: 600ms
 */
func trap1(_ height: [Int]) -> Int {
    if height.count <= 2 { return 0 }
    var ans = 0
    var max_left_index = 0
    var max_right_index = 0
    for i in 1 ..< height.count - 1 {
        var max_left = 0
        var max_right = 0
        var j = max(max_left_index, i)
        while j >= 0 {
            if height[j] > max_left {
                max_left = height[j]
                max_left_index = j
            }
            j -= 1
        }
        var k = max(max_right_index, i)
        while k < height.count {
            if height[k] > max_right {
                max_right = height[k]
                max_right_index = k
            }
            k += 1
        }
        ans += (min(max_left, max_right) - height[i])
    }
    return ans
}

/*
 官方动态规划swift版
 时间复杂度O(n)
 Leet code: 68ms
 */
func trap2(_ height: [Int]) -> Int {
    if height.count <= 2 { return 0 }
    var ans = 0
    let size = height.count
    var left_max = Array(repeating: 0, count: size)
    var right_max = Array(repeating: 0, count: size)
    
    left_max[0] = height[0]
    for i in 1 ..< size {
        left_max[i] = max(height[i], left_max[i-1])
    }
    
    right_max[size - 1] = height[size - 1]
    var i = size - 2
    while i >= 0 {
        right_max[i] = max(height[i], right_max[i+1])
        i -= 1
    }
    
    for i in 1 ..< size - 1 {
        ans += min(left_max[i], right_max[i]) - height[i]
    }
    
    return ans
}

/*
 Leet Code官方解题，双指针法
 
 */
func trap3 (_ height: [Int]) -> Int {
    if height.count <= 2 { return 0 }
    var left = 0
    var right = height.count - 1
    var ans = 0
    var left_max = 0
    var right_max = 0
    while left < right {
        if height[left] < height[right] {
            if height[left] >= left_max {
                left_max = height[left]
            } else {
                ans += left_max - height[left]
            }
            left += 1
        } else {
            if height[right] >= right_max {
                right_max = height[right]
            } else {
                ans += right_max - height[right]
            }
            right -= 1
        }
    }
    return ans
}


//17.跳跃游戏
func canJump(_ nums: [Int]) -> Bool {
    return canJumpFromPosition(position: 0, nums: nums)
}

func canJumpFromPosition(position: Int, nums: [Int]) -> Bool {
    if position >= nums.count - 1 {
        return true
    }
    
    let furthesJump = min(position + nums[position], nums.count - 1)
    for nextPostion in position + 1 ... furthesJump {
        if canJumpFromPosition(position: nextPostion, nums: nums) {
            return true
        }
    }
    return false
}

//18.快速排序
func partition(low: Int, high: Int, nums: inout [Int]) -> Int {
    var low = low
    var high = high
    let temp = nums[low]
    var mid = 0
    while low < high {
        
        while low < high && nums[high] >= temp {
            high -= 1
        }
        nums[low] = nums[high]
        while low < high && nums[low] <= temp {
            low += 1
        }
        nums[high] = nums[low]
    }
    nums[low] = temp
    mid = low
    
    return mid
}

func quickSourted(low: Int, high:Int, nums: inout [Int]) {
    if low < high {
        let mid = partition(low: low, high: high, nums: &nums)
        quickSourted(low: low, high: mid-1, nums: &nums)
        quickSourted(low: mid+1, high: high, nums: &nums)
    }
}

public class ListNode {
   public var val: Int
   public var next: ListNode?
   public init(_ val: Int) {
       self.val = val
       self.next = nil
   }
}
 

//19.两数之和
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummyHead = ListNode(0)
    var p: ListNode? = l1
    var q: ListNode? = l2
    var current: ListNode = dummyHead
    var carry = 0
    while p != nil || q != nil {
        let x = (p != nil) ? p!.val : 0
        let y = (q != nil) ? q!.val : 0
        
        let sum = carry + x + y
        carry = sum / 10
        current.next = ListNode(sum % 10)
        current = current.next!
        if p != nil { p = p!.next }
        if q != nil { q = q!.next }
    }
    if carry > 0 {
        current.next = ListNode(carry)
    }
    return dummyHead.next
}

//20.链表反转
func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var curr = head
    while curr != nil {
        let nextTemp = curr?.next
        curr?.next = prev
        prev = curr
        curr = nextTemp
    }
    return prev
}


//21.反转链表II：反转从位置m到n的链表（要求一趟循环完成反转）
func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    if head == nil || m > n {
        return nil
    }
    
    //申请节点指向头节点
    let fake = ListNode(0)
    fake.next = head
    var prve = fake
    
    //走到将要翻转节点的前一个节点 prev
    for _ in 0 ..< m-1 {
        prve = prve.next!
    }
    
    //cur 第m个节点，也就是将要翻转的节点
    let curr = prve.next
    for _ in m ..< n {
        let tmp = curr?.next      //保存要反转节点的下一个节点
        curr?.next = tmp?.next   //当前节点指向 要放转节点的next节点，最终指向第m个节点的next
        tmp?.next = prve.next    //第n个节点的next指向前一个节点
        prve.next = tmp          // 第m个节点指向后面一个节点
    }
    
    return prve
}


//22.合并两个有序链表
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    } else if l2 == nil {
        return l1
    } else if l1!.val < l2!.val {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    } else {
        l2?.next = mergeTwoLists(l1, l2?.next)
        return l2
    }
}

func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let prehead = ListNode(-1)
    var _l1 = l1
    var _l2 = l2
    
    var prev = prehead
    
    while _l1 != nil && _l2 != nil {
        if _l1!.val <= _l2!.val {
            prev.next = _l1
            _l1 = _l1?.next
        } else {
            prev.next = _l2
            _l2 = _l2?.next
        }
        prev = prev.next!
    }
    
    prev.next = l1 == nil ? l2 : l1
    
    return prehead.next
    
}

//23.个位相加(递归)
func addDigits(_ num: Int) -> Int {
    var tempNum = num
    var sum = 0
    if tempNum >= 10 {
        while tempNum != 0 {
            sum += tempNum % 10
            tempNum /= 10
        }
    } else {
        return tempNum
    }
    return addDigits(sum)
}

//循环
func addDigits1(_ num: Int) -> Int {
    var tempNum = num
    while tempNum >= 10{
        var sum = 0
        while tempNum > 0 {
            let temp = tempNum % 10
            sum += temp
            tempNum /= 10
        }
        tempNum = sum
    }
    return tempNum
}

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }


//24.对称二叉树(递归)
func isSymmetric(_ root: TreeNode?) -> Bool {
    return isMirror(t1: root?.left, t2: root?.right)
}


func isMirror(t1: TreeNode?, t2: TreeNode?) -> Bool {
    if t1 == nil && t2 == nil { return true }
    if t1 == nil || t2 == nil { return false }
    return (t1?.val == t2?.val) && isMirror(t1: t1?.left, t2: t2?.right) && isMirror(t1: t1?.right, t2: t2?.left)
}

//25.合并区间(284ms)
func merge(_ intervals: [[Int]]) -> [[Int]] {
    var newIntervals = intervals.sorted { (a, b) -> Bool in
        return a[0] < b[0] ? true : false
    }
    
    var i = 0
    while i < newIntervals.count - 1 {
        if newIntervals[i][1] >= newIntervals[i+1][0] {
            if newIntervals[i][1] < newIntervals[i+1][1] {
                newIntervals.insert([newIntervals[i][0], newIntervals[i+1][1]], at: i)
            } else {
                newIntervals.insert([newIntervals[i][0], newIntervals[i][1]], at: i)
            }
            newIntervals.remove(at: i+1)
            newIntervals.remove(at: i+1)
        } else {
            i += 1
        }
    }
    return newIntervals
}


//27.移除链表的某个元素
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    var prev: ListNode? = ListNode(0)
    prev?.next = head
    let result = prev
    while prev?.next != nil {
        if prev?.next?.val == val {
            print("移除：\(prev!.next!.val)")
            prev?.next = prev?.next?.next
            
        } else {
            print("不移除：\(prev!.next!.val)")
            prev = prev?.next
        }
    }
    return result?.next
}

//28.长度最小的子数组
func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    let n = nums.count
    var result = n + 1
    for i in 0 ..< n {
        for j in i ..< n {
            var sum = 0
            for k in i ... j {
                sum += nums[k]
            }
            if sum >= s {
                result = min(result, j - i + 1)
                break
            }
        }
    }
    return result == n + 1 ? 0 : result
}

//29.最大间距
func maximumGap(_ nums: [Int]) -> Int {
    let n = nums.count
    if n < 2 {
        return 0
    }
    var result = 0
    var tempNums = nums.sorted()
    for i in 0 ..< n {
        result = max(result, tempNums[i+1]-tempNums[i])
    }
    return result
}

//30.最大数
func largestNumber(_ nums: [Int]) -> String {
    var numsString = [String]()
    for i in 0 ..< nums.count {
        numsString.append(String(nums[i]))
    }
    numsString.sorted { (a, b) -> Bool in
        if a < b {
            return false
        }
        return true
    }
    var result = ""
    for i in 0 ..< numsString.count {
        result += numsString[i]
    }
    return result
}

//31.有效的井字游戏
func validTicTacToe(_ board: [String]) -> Bool {
    return true
}
