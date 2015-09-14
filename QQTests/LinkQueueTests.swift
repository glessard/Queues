//
//  LinkQueueTests.swift
//  QQTests
//
//  Created by Guillaume Lessard on 2014-09-09.
//  Copyright (c) 2014 Guillaume Lessard. All rights reserved.
//

import Foundation
import XCTest

@testable import QQ

class LinkQueueTests: QQTests
{
  func testQueue()
  {
    QueueTestCount(LinkQueue<Int>.self, element: 0)
  }

  func testQueueInt()
  {
    QueueIntTest(LinkQueue<UInt64>)
  }

  func testQueueRef()
  {
    QueueRefTest(LinkQueue<Thing>)
  }

  func testPerformanceFill()
  {
    let s = Thing()
    QueuePerformanceTestFill(LinkQueue<Thing>.self, element: s)
  }

  func testPerformanceSpin()
  {
    let s = Thing()
    QueuePerformanceTestSpin(LinkQueue<Thing>.self, element: s)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(LinkQueue<Thing>.self)
  }

  func testEmpty()
  {
    QueueInitEmptyTest(LinkQueue<Thing>.self, newElement: Thing())
  }

  func testMT()
  {
    MultiThreadedBenchmark(LinkQueue<UInt32>.self)
  }
}

class LinkOSQueueTests: QQTests
{
  func testQueue()
  {
    QueueTestCount(LinkOSQueue<Int>.self, element: 0)
  }

  func testQueueInt()
  {
    QueueIntTest(LinkOSQueue<UInt64>)
  }

  func testQueueRef()
  {
    QueueRefTest(LinkOSQueue<Thing>)
  }

  func testPerformanceFill()
  {
    let s = Thing()
    QueuePerformanceTestFill(LinkOSQueue<Thing>.self, element: s)
  }

  func testPerformanceSpin()
  {
    let s = Thing()
    QueuePerformanceTestSpin(LinkOSQueue<Thing>.self, element: s)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(LinkOSQueue<Thing>.self)
  }

  func testEmpty()
  {
    QueueInitEmptyTest(LinkOSQueue<Thing>.self, newElement: Thing())
  }

  func testMT()
  {
    MultiThreadedBenchmark(LinkOSQueue<UInt32>.self)
  }
}

class DoubleLockLinkQueueTests: QQTests
{
  func testQueue()
  {
    QueueTestCount(Link2LockQueue<Int>.self, element: 0)
  }

  func testQueueInt()
  {
    QueueIntTest(Link2LockQueue<UInt64>)
  }

  func testQueueRef()
  {
    QueueRefTest(Link2LockQueue<Thing>)
  }

  func testPerformanceFill()
  {
    let s = Thing()
    QueuePerformanceTestFill(Link2LockQueue<Thing>.self, element: s)
  }

  func testPerformanceSpin()
  {
    let s = Thing()
    QueuePerformanceTestSpin(Link2LockQueue<Thing>.self, element: s)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(Link2LockQueue<Thing>.self)
  }

  func testEmpty()
  {
    QueueInitEmptyTest(Link2LockQueue<Thing>.self, newElement: Thing())
  }

  func testMT()
  {
    MultiThreadedBenchmark(Link2LockQueue<UInt32>.self)
  }
}

class LockFreeLinkQueueTests: QQTests
{
  func testQueue()
  {
    QueueTestCount(LockFreeLinkQueue<Int>.self, element: 0)
  }

  func testQueueInt()
  {
    QueueIntTest(LockFreeLinkQueue<UInt64>)
  }

  func testQueueRef()
  {
    QueueRefTest(LockFreeLinkQueue<Thing>)
  }

  func testPerformanceFill()
  {
    let s = Thing()
    QueuePerformanceTestFill(LockFreeLinkQueue<Thing>.self, element: s)
  }

  func testPerformanceSpin()
  {
    let s = Thing()
    QueuePerformanceTestSpin(LockFreeLinkQueue<Thing>.self, element: s)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(LockFreeLinkQueue<Thing>.self)
  }

  func testEmpty()
  {
    QueueInitEmptyTest(LockFreeLinkQueue<Thing>.self, newElement: Thing())
  }
}

class OptimisticLinkQueueTests: QQTests
{
  func testQueue()
  {
    QueueTestCount(OptimisticLinkQueue<Int>.self, element: 0)
  }

  func testQueueInt()
  {
    QueueIntTest(OptimisticLinkQueue<UInt64>)
  }

  func testQueueRef()
  {
    QueueRefTest(OptimisticLinkQueue<Thing>)
  }

  func testPerformanceFill()
  {
    let s = Thing()
    QueuePerformanceTestFill(OptimisticLinkQueue<Thing>.self, element: s)
  }

  func testPerformanceSpin()
  {
    let s = Thing()
    QueuePerformanceTestSpin(OptimisticLinkQueue<Thing>.self, element: s)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(OptimisticLinkQueue<Thing>.self)
  }

  func testEmpty()
  {
    QueueInitEmptyTest(OptimisticLinkQueue<Thing>.self, newElement: Thing())
  }
}

class UnsafeLinkQueueTests: QQTests
{
  func testQueue()
  {
    QueueTestCount(UnsafeLinkQueue<Int>.self, element: 0)
  }

  func testQueueInt()
  {
    QueueIntTest(UnsafeLinkQueue<UInt64>)
  }

  func testQueueRef()
  {
    QueueRefTest(UnsafeLinkQueue<Thing>)
  }

  func testPerformanceFill()
  {
    let s = Thing()
    QueuePerformanceTestFill(UnsafeLinkQueue<Thing>.self, element: s)
  }

  func testPerformanceSpin()
  {
    let s = Thing()
    QueuePerformanceTestSpin(UnsafeLinkQueue<Thing>.self, element: s)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(UnsafeLinkQueue<Thing>.self)
  }

  func testEmpty()
  {
    QueueInitEmptyTest(UnsafeLinkQueue<Thing>.self, newElement: Thing())
  }
}
