using web
using wisp

class MainServer {
	Void main() {
		WispService {
			port = 8080
			root = HelloMod()
		}.start
	}
}

const class HelloMod : WebMod
{
  override Void onGet()
  {
    res.headers["Content-Type"] = "text/plain; charset=utf-8"
    res.out.print("hello world")
  }
}