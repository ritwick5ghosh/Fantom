using util
using afJson

class File {
	Void main() {
		dir := `/Users/rghosh/notespump/queue/`.toFile
		files := dir.list.findAll |f| { !f.isDir && f.pathStr.contains(".txt")}
		
		//f := `/Users/rghosh/notespump/queue/20160307165621_000001_000002_000002.txt`.toFile

		
		jsonService := Json()
		json := (Payload) jsonService.readJson(files[0].readAllLines[0], Payload#)
		echo(json.payload.customerNotesBatch[0].customerAccountId)
	}
}

class Payload {
	@JsonProperty CustomerNotesBatch payload
	
	new make(|This| f) { f(this) }
}

class CustomerNotesBatch {
	@JsonProperty CustomerNote[] customerNotesBatch
	
	new make(|This| f) { f(this) }
}

class CustomerNote {
    @JsonProperty Str    tenantCustomerId
    @JsonProperty Str    tenantId
    @JsonProperty Str    csAgent
    @JsonProperty Str  	 note
    @JsonProperty Str    reasonCode
    @JsonProperty Str  	 reasonDescription
    @JsonProperty Str    customerAccountId
    @JsonProperty Str  	 noteId
    @JsonProperty Str    createdDate
	
	new make(|This| f) { f(this) }
}
