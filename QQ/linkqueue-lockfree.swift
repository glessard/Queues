//
//  linkqueue-lockfree.swift
//  QQ
//
//  Created by Guillaume Lessard on 2014-08-16.
//  Copyright (c) 2014 Guillaume Lessard. All rights reserved.
//

/// Lock-free queue
///
/// Note that this algorithm is not designed for tri-state memory as used in Swift.
/// This means that it does not work correctly in multi-threaded situations (as in, accesses memory in an incorrect state.)
/// It was an interesting experiment.
///
/// Lock-free queue algorithm adapted from Maged M. Michael and Michael L. Scott.,
/// "Simple, Fast, and Practical Non-Blocking and Blocking Concurrent Queue Algorithms",
/// in Principles of Distributed Computing '96 (PODC96)
/// See also: http://www.cs.rochester.edu/research/synchronization/pseudocode/queues.html

final public class LockFreeLinkQueue<T>: QueueType
{
  public typealias Element = T

  private var head = AtomicTP<LockFreeNode<T>>()
  private var tail = AtomicTP<LockFreeNode<T>>()

  public init()
  {
    let node = LockFreeNode<T>()
    head.store(TaggedPointer(node))
    tail.store(TaggedPointer(node))
  }

  deinit
  {
    // empty the queue
    while let node = head.load()?.node
    {
      defer { node.deallocate() }

      if let next = node.next.pointee.load()
      {
        next.node.deinitialize()
        head.store(next)
      }
      else { break }
    }
  }

  public var isEmpty: Bool { return head.load()?.pointer == tail.load()?.pointer }

  public var count: Int {
    var i = 0
    let current = head.load()!.node
    var pointer = current.next.pointee.load()
    while let current = pointer?.node
    { // Iterate along the linked nodes while counting
      pointer = current.next.pointee.load()
      i += 1
    }
    return i
  }

  public func enqueue(_ newElement: T)
  {
    let node = LockFreeNode(initializedWith: newElement)

    while true
    {
      let tail = self.tail.load()!

      if let next = tail.node.next.pointee.load()?.node
      { // tail wasn't pointing to the actual last node; try to fix it.
        _ = self.tail.CAS(old: tail, new: next)
      }
      else
      { // try to link the new node to the end of the list
        if tail.node.next.pointee.CAS(old: nil, new: node)
        { // success. try to have tail point to the inserted node.
          _ = self.tail.CAS(old: tail, new: node)
          break
        }
      }
    }
  }

  public func dequeue() -> T?
  {
    while true
    {
      let head = self.head.load()!
      let tail = self.tail.load()!
      let next = head.node.next.pointee.load()?.node

      if head.pointer == tail.pointer
      { // either the queue is empty, or the tail is lagging behind
        if let next = next
        { // tail was behind the actual last node; try to advance it.
          _ = self.tail.CAS(old: tail, new: next)
        }
        else
        { // queue is empty
          return nil
        }
      }
      else
      { // no need to deal with tail
        // read element before CAS, otherwise another dequeue racing ahead might free the node too early.
        if let newhead = next,
           let element = newhead.read(), // must happen before deinitialize in another thread
           self.head.CAS(old: head, new: newhead)
        {
          newhead.deinitialize()
          head.node.deallocate()
          return element
        }
      }
    }
  }
}
