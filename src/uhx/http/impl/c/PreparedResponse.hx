package uhx.http.impl.c;

import byte.ByteData;
import haxe.ds.StringMap;
import uhx.http.impl.e.EMethod;
import uhx.lexer.HttpMessageParser;
import uhx.http.impl.t.PlatformRequest;

/**
 * ...
 * @author Skial Bainn
 */
class PreparedResponse {
	
	private var parser:HttpMessageParser;

	public var method(get, null):EMethod;
	@:isVar public var cookies(get, null):StringMap<Cookie>;
	public var headers(get, set):StringMap<String>;
	@:noCompletion public var struct(default, null):StructRequest;
	
	public function new(v:StructRequest) {
		struct = v;
		
		parser = new HttpMessageParser();
	}
	
	public function prepare() {
		#if js
		headers = parser.toMap( parser.tokenise( byte.ByteData.ofString( struct.underlying.getAllResponseHeaders() ), '' ) );
		#else
		headers = struct.underlying.responseHeaders;
		#end
	}
	
	public inline function destroy() {
		#if js
		struct.underlying.abort();
		#else
		struct.underlying = null;
		#end
	}
	
	// Internal
	
	private function get_method():EMethod {
		return struct.method;
	}
	
	private function get_cookies():StringMap<Cookie> {
		if (cookies == null) { 
			var data = 
			#if js
			js.Browser.document.cookie
			#else
			''
			#end
			;
			data = data == null ? '' : data;
			cookies = Cookie.fromString( data );
		}
		return cookies;
	}
	
	private function get_headers():StringMap<String> {
		return struct.resHeaders;
	}
	
	private function set_headers(v:StringMap<String>):StringMap<String> {
		return struct.resHeaders = v;
	}
	
}