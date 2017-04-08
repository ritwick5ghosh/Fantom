//
// Copyright (c) 2011 xored software, Inc.
// Licensed under Eclipse Public License version 1.0
//
// History:
//   rghosh Apr 6, 2017 - Initial Contribution
//
using concurrent

class Test {

	Void main() {
		pool := ActorPool()
		a := Actor(pool) |msg|
		{
		  count := 1 + (Int)Actor.locals.get("count", 0)
		  Actor.locals["count"] = count
		  return count
		}
		t1 := Duration.now
		1000_000.times { a.send("ignored") }
		t2 := Duration.now
		echo("It took ${(t2-t1).toMillis} ms to run")
	}
}
