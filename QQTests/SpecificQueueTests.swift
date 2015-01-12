//
//  QueueTests.swift
//  QQTests
//
//  Created by Guillaume Lessard on 2014-09-09.
//  Copyright (c) 2014 Guillaume Lessard. All rights reserved.
//

import Darwin
import Foundation
import XCTest
import QQ

class IntQueueTests: QQTests
{
  func testQueueCount()
  {
    QueueTestCount(IntQueue.self, element: 0)
  }

  func testQueueInt()
  {
    QueueIntTest(IntQueue)
  }

  func testPerformanceFill()
  {
    QueuePerformanceTestFill(IntQueue.self, element: 0)
  }

  func testPerformanceSpin()
  {
    QueuePerformanceTestSpin(IntQueue.self, element: 0)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(IntQueue.self)
  }
}

class IntOSQueueTests: QQTests
{
  func testQueueCount()
  {
    QueueTestCount(IntOSQueue.self, element: 0)
  }

  func testQueueInt()
  {
    QueueIntTest(IntOSQueue)
  }

  func testPerformanceFill()
  {
    QueuePerformanceTestFill(IntOSQueue.self, element: 0)
  }

  func testPerformanceSpin()
  {
    QueuePerformanceTestSpin(IntOSQueue.self, element: 0)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(IntOSQueue.self)
  }
}

class IntARCQueueTests: QQTests
{
  func testQueueCount()
  {
    QueueTestCount(IntARCQueue.self, element: 0)
  }

  func testQueueInt()
  {
    QueueIntTest(IntARCQueue)
  }

  func testPerformanceFill()
  {
    QueuePerformanceTestFill(IntARCQueue.self, element: 0)
  }

  func testPerformanceSpin()
  {
    QueuePerformanceTestSpin(IntARCQueue.self, element: 0)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(IntARCQueue.self)
  }
}

class ThingQueueTests: QQTests
{
  func testQueueCount()
  {
    QueueTestCount(ThingQueue.self, element: Thing())
  }

  func testQueueRef()
  {
    QueueRefTest(ThingQueue)
  }

  func testPerformanceFill()
  {
    var s = Thing()
    QueuePerformanceTestFill(ThingQueue.self, element: s)
  }

  func testPerformanceSpin()
  {
    var s = Thing()
    QueuePerformanceTestSpin(ThingQueue.self, element: s)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(ThingQueue.self)
  }
}


class ThingOSQueueTests: QQTests
{
  func testQueueCount()
  {
    QueueTestCount(ThingOSQueue.self, element: Thing())
  }

  func testQueueRef()
  {
    QueueRefTest(ThingOSQueue)
  }

  func testPerformanceFill()
  {
    var s = Thing()
    QueuePerformanceTestFill(ThingOSQueue.self, element: s)
  }

  func testPerformanceSpin()
  {
    var s = Thing()
    QueuePerformanceTestSpin(ThingOSQueue.self, element: s)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(ThingOSQueue.self)
  }
}


class ThingARCQueueTests: QQTests
{
  func testQueueCount()
  {
    QueueTestCount(ThingARCQueue.self, element: Thing())
  }

  func testQueueRef()
  {
    QueueRefTest(ThingARCQueue)
  }

  func testPerformanceFill()
  {
    var s = Thing()
    QueuePerformanceTestFill(ThingARCQueue.self, element: s)
  }

  func testPerformanceSpin()
  {
    var s = Thing()
    QueuePerformanceTestSpin(ThingARCQueue.self, element: s)
  }

  func testPerformanceEmpty()
  {
    QueuePerformanceTestEmpty(ThingARCQueue.self)
  }
}
