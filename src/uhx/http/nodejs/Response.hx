package uhx.http.nodejs;

import haxe.io.Bytes;
import uhx.types.Uri;
import haxe.ds.StringMap;
import uhx.http.nodejs.Request;

/**
 * ...
 * @author Skial Bainn
 */
@:forward abstract Response(ResponseImpl) {
	
	public inline function new (request:Request) {
		this = new ResponseImpl( request );
	}
	
	@:from public static function fromRequest(request:Request):Response {
		return new Response( request );
	}
	
}

private class ResponseImpl {
	
	public var request:Request;
	public var url(get, null):Uri;
	public var code(get, null):Int;
	public var bytes(get, null):Bytes;
	public var text(get, null):String;
	public var status(get, null):Status;
	@:isVar public var headers(get, null):StringMap<String>;
	
	public inline function new(request:Request) {
		this.request = request;
	}
	
	private inline function get_url():Uri {
		return request.url;
	}
	
	private inline function get_code():Int {
		return request.status;
	}
	
	private inline function get_bytes():Bytes {
		return Bytes.ofString( request.body );
	}
	
	private inline function get_text():String {
		return request.body;
	}
	
	private inline function get_status():Status {
		return request.status;
	}
	
	private inline function get_headers():StringMap<String> {
		if (headers == null) {
			headers = [for (key in request.underlyingResponse.headers.keys()) {
				key.toLowerCase() => request.underlyingResponse.headers.get( key );
			}];
			
		}
		
		return headers;
	}
	
}