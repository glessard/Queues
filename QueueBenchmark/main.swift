//
//  main.swift
//  QueueBenchmark
//
//  Created by Guillaume Lessard on 2014-12-30.
//  Copyright (c) 2014 Guillaume Lessard. All rights reserved.
//

import Foundation

var iterations: UInt64 = 100_000
var then = mach_absolute_time()
var dt = mach_absolute_time() - then
let ref = dispatch_semaphore_create(1)!

println("Swift-Only solutions")

println("Slow Queue:")
var queue1 = SlowQueue(iterations)

then = mach_absolute_time()
for i in 1...iterations
{
  queue1.dequeue()
  queue1.enqueue(i)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration")

var queue1ref = SlowQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  queue1ref.dequeue()
  queue1ref.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")


println("SimpleQueue:")
var queue2 = SimpleQueue(iterations)

then = mach_absolute_time()
for i in 1...iterations
{
  queue2.dequeue()
  queue2.enqueue(i)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration")

var queue2ref = SimpleQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  queue2ref.dequeue()
  queue2ref.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")


println("LinkQueue:")
var lqueue = LinkQueue(iterations)

then = mach_absolute_time()
for i in 1...iterations
{
  lqueue.dequeue()
  lqueue.enqueue(i)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration")


var lqueueref = LinkQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  lqueueref.dequeue()
  lqueueref.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")


println("FastQueue:")
var fqueue = FastQueue(iterations)

then = mach_absolute_time()
for i in 1...iterations
{
  fqueue.dequeue()
  fqueue.enqueue(i)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration")

var fqueueref = FastQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  fqueueref.dequeue()
  fqueueref.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")


println()
println("AnyObject queues")

println("SimpleRefQueue")
var srqueue = SimpleRefQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  srqueue.dequeue()
  srqueue.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")


println("RefLinkQueue")
var rlqueue = RefLinkQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  rlqueue.dequeue()
  rlqueue.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")

println("RefFastQueue")
var rfqueue = RefFastQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  rfqueue.dequeue()
  rfqueue.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")


println()
println("Swift with OSAtomicFifoQueue:")

println("LinkOSQueue:" )
var losqueue = LinkOSQueue(iterations)

then = mach_absolute_time()
for i in 1...iterations
{
  losqueue.dequeue()
  losqueue.enqueue(i)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration")

var losqueueref = LinkOSQueue(ref)
then = mach_absolute_time()
for i in 1...iterations
{
  losqueueref.dequeue()
  losqueueref.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")


println("FastOSQueue:" )
var fosqueue = FastOSQueue(iterations)

then = mach_absolute_time()
for i in 1...iterations
{
  fosqueue.dequeue()
  fosqueue.enqueue(i)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration")

var fosqueueref = FastOSQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  fosqueueref.dequeue()
  fosqueueref.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")


println()
println("RefLinkOSQueue:" )
var squeue2 = RefLinkOSQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  squeue2.dequeue()
  squeue2.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")


println("RefFastOSQueue:" )
var squeue2p = RefFastOSQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  squeue2p.dequeue()
  squeue2p.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with AnyObject references")

println()
println("SemaphoreQueue:" )
var semqueue = SemaphoreQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  semqueue.dequeue()
  semqueue.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with dispatch_semaphore_t references")

println("SemaphoreOSQueue:" )
var semosqueue = SemaphoreOSQueue(ref)

then = mach_absolute_time()
for i in 1...iterations
{
  semosqueue.dequeue()
  semosqueue.enqueue(ref)
}
dt = mach_absolute_time() - then
print(dt/iterations); println(" ns per iteration with dispatch_semaphore_t references")
