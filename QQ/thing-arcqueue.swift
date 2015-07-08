//
//  Thing-arcqueue.swift
//  QQ
//
//  Created by Guillaume Lessard on 2014-08-16.
//  Copyright (c) 2014 Guillaume Lessard. All rights reserved.
//

import Darwin.libkern.OSAtomic

final public class ThingARCQueue: QueueType
{
  private var head: Node? = nil
  private var tail: Node! = nil

  private var lock = OS_SPINLOCK_INIT

  public init() { }

  public var isEmpty: Bool { return head == nil }

  public var count: Int {
    // Not thread safe.
    var i = 0
    var node = head
    while let n = node
    { // Iterate along the linked nodes while counting
      node = n.next
      i++
    }
    return i
  }

  public func enqueue(newElement: Thing)
  {
    let node = Node(newElement)

    OSSpinLockLock(&lock)
    if head == nil
    {
      head = node
      tail = node
    }
    else
    {
      tail.next = node
      tail = node
    }
    OSSpinLockUnlock(&lock)
  }

  public func dequeue() -> Thing?
  {
    OSSpinLockLock(&lock)
    if let node = head
    {
      // Promote the 2nd node to 1st
      head = node.next

      // Logical housekeeping
      if head == nil { tail = nil }

      OSSpinLockUnlock(&lock)
      return node.elem
    }

    // queue is empty
    OSSpinLockUnlock(&lock)
    return nil
  }
}

/**
  A simple Node for the Queue implemented above.
  Clearly an implementation detail.
*/

private class Node
{
  var next: Node? = nil
  let elem: Thing

  init(_ e: Thing)
  {
    elem = e
  }
}
