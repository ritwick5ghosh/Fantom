using concurrent

class First {
	Void main() {
		echo(fib(30))
	}
	
	Int fib(Int num) {
		if (num == 0) return 0
		if(num == 1) return 1
		return fib(num -1) + fib(num - 2) 
	}
}

		/*pool := ActorPool
		a := Actor(pool) |msg|
		{
		  count := 1 + (Int)Actor.locals.get("count", 0)
		  Actor.locals["count"] = count
		  return count
		}
		
		100.times { a.send("ignored") }
		echo("Count is now " + a.send("ignored").get)*/		
