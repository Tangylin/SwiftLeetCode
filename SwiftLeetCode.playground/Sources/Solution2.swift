/*   
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 *
 */




import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class Solution2 {
    
    /// 使用递归，每次相加取余，和大于10下一个节点加1，若下一个节点为nil，创建一个val为1的节点
    ///
    /// - Parameters:
    ///   - l1: 链表1
    ///   - l2: 链表2
    /// - Returns: 相加之后的链表
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let node1 = l1 else {
            guard let node2 = l2 else {
                return nil
            }
            let node: ListNode? = nodeSum(nil, node2)
            node?.next = addTwoNumbers(nil, node2.next)
            return node
        }
        guard let node2 = l2 else {
            guard let node1 = l1 else {
                return nil
            }
            let node: ListNode? = nodeSum(node1, nil)
            node?.next = addTwoNumbers(node1.next, nil)
            return node
        }
        let node: ListNode? = nodeSum(node1, node2)
        node?.next = addTwoNumbers(node1.next, node2.next)
        return node
    }
    
    
    /// 节点相加
    ///
    /// - Parameters:
    ///   - node1: 节点1
    ///   - node2: 节点2
    /// - Returns: 相加后的节点
    func nodeSum(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        let sum = (node1?.val ?? 0) + (node2?.val ?? 0)
        let node: ListNode? = ListNode(sum % 10)
        if let nextNode = node1?.next {
            nextNode.val = nextNode.val + sum / 10
        }else if sum >= 10 {
            let nextNode: ListNode? = ListNode(1)
            (node1 ?? node2)?.next = nextNode
        }
        return node
    }
}
