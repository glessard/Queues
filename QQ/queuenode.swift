//
//  queuenode.swift
//  QQ
//
//  Created by Guillaume Lessard on 4/19/17.
//  Copyright © 2017 Guillaume Lessard. All rights reserved.
//

import struct CAtomics.AtomicOptionalMutableRawPointer

private let linkOffset = 0
private let nextOffset = linkOffset + MemoryLayout<AtomicOptionalMutableRawPointer>.stride

struct QueueNode<Element>: OSAtomicNode, StackNode, Equatable
{
  let storage: UnsafeMutableRawPointer

  private var dataOffset: Int {
    let a = MemoryLayout<Element>.alignment
    let d = (nextOffset + MemoryLayout<UnsafeMutableRawPointer?>.stride - a)/a
    return a*d+a
  }

  init(storage: UnsafeMutableRawPointer)
  {
    self.storage = storage
  }

  private init?(storage: UnsafeMutableRawPointer?)
  {
    guard let storage = storage else { return nil }
    self.storage = storage
  }

  private init()
  {
    let a = MemoryLayout<Element>.alignment
    let d = (nextOffset + MemoryLayout<UnsafeMutableRawPointer?>.stride - a)/a
    let size = a*d+a + MemoryLayout<Element>.stride
    let alignment = max(MemoryLayout<Element>.alignment, MemoryLayout<UnsafeMutableRawPointer?>.alignment)
    storage = UnsafeMutableRawPointer.allocate(byteCount: size, alignment: alignment)
    (storage+linkOffset).bindMemory(to: AtomicOptionalMutableRawPointer.self, capacity: 1)
    link.pointee = AtomicOptionalMutableRawPointer()
    link.pointee.initialize(nil)
    (storage+nextOffset).bindMemory(to: (UnsafeMutableRawPointer?).self, capacity: 1)
    nptr.pointee = nil
    (storage+dataOffset).bindMemory(to: Element.self, capacity: 1)
  }

  static var dummy: QueueNode { return QueueNode() }

  init(initializedWith element: Element)
  {
    self.init()
    let data = (storage+dataOffset).assumingMemoryBound(to: Element.self)
    data.initialize(to: element)
  }

  func deallocate()
  {
    storage.deallocate()
  }

  var link: UnsafeMutablePointer<AtomicOptionalMutableRawPointer> {
    get {
      return (storage+linkOffset).assumingMemoryBound(to: AtomicOptionalMutableRawPointer.self)
    }
  }

  private var nptr: UnsafeMutablePointer<UnsafeMutableRawPointer?> {
    get {
      return (storage+nextOffset).assumingMemoryBound(to: (UnsafeMutableRawPointer?).self)
    }
  }

  var next: QueueNode? {
    get {
      return QueueNode(storage: nptr.pointee)
    }
    nonmutating set {
      nptr.pointee = newValue?.storage
    }
  }

  func initialize(to element: Element)
  {
    link.pointee.store(nil, .relaxed)
    nptr.pointee = nil
    let data = (storage+dataOffset).assumingMemoryBound(to: Element.self)
    data.initialize(to: element)
  }

  func deinitialize()
  {
    (storage+dataOffset).assumingMemoryBound(to: Element.self).deinitialize(count: 1)
  }

  @discardableResult
  func move() -> Element
  {
    return (storage+dataOffset).assumingMemoryBound(to: Element.self).move()
  }
}
