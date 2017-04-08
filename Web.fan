using web

class Web {
	Void main() {
		//res := WebClient(`http://fantom.org/doc/examples/web-client`).writeReq.readRes
		c := WebClient(`https://www.google.com/`)
		c.reqMethod = "GET"
		c.reqHeaders["Content-Type"] = "application/json; charset=UTF-8"
		res := c.writeReq.readRes
		echo(res.resCode.toStr)
		echo(res.resHeaders) 
		echo(res.resStr)
		pipelining()
	}
	
	Void pipelining()
	{
	    echo("\n--- pipelining ---")
		// pipelining: write 2 requests, then read 2 responses
		c := WebClient()
		c.reqUri = `http://fantom.org/`
		c.writeReq
		c.reqUri = `http://fantom.org/doc/`
		c.writeReq
		c.readRes
		echo(c.resStr[0..100] + "...") // process path1 response
		c.readRes
		echo(c.resStr[0..100] + "...") // process path2 response
	  }
	
}
