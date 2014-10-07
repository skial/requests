package uhx.http.impl.c;

import haxe.ds.StringMap;
import uhx.http.impl.e.EMethod;
import uhx.http.impl.c.StructRequest;
import uhx.http.impl.t.PlatformRequest;

using StringTools;

/**
 * ...
 * @author Skial Bainn
 */
class PreparedRequest {
	
	public var method(get, null):EMethod;
	public var cookies:StringMap<Cookie>;
	public var headers(get, set):StringMap<String>;
	@:noCompletion public var struct(default, null):StructRequest;

	public function new(v:StructRequest) {
		struct = v;
		cookies = new StringMap<Cookie>();
	}
	
	public function prepare() {
		#if js
		if (struct.underlying.readyState == 0) struct.underlying.open( method, struct.url.toString(), true );
		#else
		if (struct.underlying == null) struct.underlying = new PlatformRequest( struct.url.toString() );
		#end
		
		for (key in cookies.keys()) {
			#if js
			struct.underlying.withCredentials = true;
			js.Browser.document.cookie = cookies.get( key ).toString();
			#else
			headers.set( 'Set-Cookie', cookies.get( key ).toString() );
			#end
		}
	}
	
	public function destroy() {
		#if js
		if (struct.underlying.readyState != 0) struct.underlying.abort();
		#else
		struct.underlying = null;
		#end
	}
	
	public function send(?params:StringMap<String>, ?data:String = '') {
		switch (method) {
			case GET if (params != null):
				for (key in params.keys()) {
					struct.url.query.set( key, [ params.get( key ) ] );
				}
				
				destroy();
				prepare();
				
			case POST:
				if (params != null) for (key in params.keys()) {
					data += (data != '' ? '&' : '') + key.urlEncode() + '=' + params.get( key ).urlEncode();
				}
				
				headers.set('content-type', 'application/x-www-form-urlencoded');
				
				#if !js
				struct.underlying.setPostData( data );
				#end
				
			case _:
		}
		
		for (key in headers.keys()) {
			#if js
			struct.underlying.setRequestHeader(key.toLowerCase(), headers.get( key ));
			#else
			
			#end
		}
		
		#if js
		struct.underlying.send( data );
		#else
		struct.underlying.request( method == POST ? true : false );
		#end
	}
	
	// Internal
	
	private function get_method():EMethod {
		return struct.method;
	}
	
	private function get_headers():StringMap<String> {
		return struct.reqHeaders;
	}
	
	private function set_headers(v:StringMap<String>):StringMap<String> {
		return struct.reqHeaders = v;
	}
	
}