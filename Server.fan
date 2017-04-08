
using util
using concurrent
//interop
using [java]fanx.interop::Interop

//java stuff
using [java]java.net::Socket
using [java]java.net::ServerSocket

**
** Boot script for web hello world
**
class Server : AbstractMain
{
  @Opt { help = "http port" }
  Int port := 8080

  const ActorPool actorPool := ActorPool { maxThreads = 32 }
	
  override Int run()
  {
    serverSocket := ServerSocket(port)
    try {
      while(true) {
        socket := serverSocket.accept
        a := ServerActor(actorPool)
        //wrap a mutable socket to sign that we know what are we doing 
        a.send(Unsafe(socket))
      }
    }
    catch (Err e) {
      serverSocket.close
      return 1
    }
    throw Err("Shouldn't be here, above is an infinite loop or return. Consult the author :)")
    
  }
}

const class ServerActor : Actor {
  
	new make(ActorPool p) : super(p) {}
  
  override Obj? receive(Obj? msg) {
    Socket socket := ((Unsafe) msg).val
    //get streams
    InStream in := Interop.toFan(socket.getInputStream)
    OutStream out := Interop.toFan(socket.getOutputStream)
    try {
		out.write('H')
    }finally {
		out.close
    }
    return null
  }
}

