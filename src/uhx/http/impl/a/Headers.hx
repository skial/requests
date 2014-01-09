package uhx.http.impl.a;

private typedef PlatformHeaders = 
#if js
js.html.XMLHttpRequest;
#else
haxe.Http;
#end

/**
 * ...
 * @author Skial Bainn
 * http://stackoverflow.com/questions/7462968/restrictions-of-xmlhttprequests-getresponseheader
 */
/*abstract Headers(PlatformHeaders) from PlatformHeaders to PlatformHeaders {

	public function new(v:PlatformHeaders) {
		this = v;
	}
	
	@:access(haxe.Http) public function get(key:String):String {
		#if js
		return this.getResponseHeader( key );
		#else
		return this.headers.get( key );
		#end
	}
	
	@:access(haxe.Http) public function exists(key:String):Bool {
		#if js
		return this.getResponseHeader( key ) != null;
		#else
		return this.headers.exists( key );
		#end
	}
	
	@:access(haxe.Http) public function set(key:String, value:String):Void {
		#if js
		this.setRequestHeader( key, value );
		#else
		this.headers.set( key, value );
		#end
	}
	
}*/

class Headers {
	
	private var http:PlatformHeaders;
	
	public function new(v:PlatformHeaders) {
		this.http = v;
	}
	
	@:access(haxe.Http) public function get(key:String):String {
		#if js
		return this.http.getResponseHeader( key );
		#else
		return this.http.headers.get( key );
		#end
	}
	
	@:access(haxe.Http) public function exists(key:String):Bool {
		#if js
		return this.http.getResponseHeader( key ) != null;
		#else
		return this.http.headers.exists( key );
		#end
	}
	
	@:access(haxe.Http) public function set(key:String, value:String):Void {
		#if js
		this.http.setRequestHeader( key, value );
		#else
		this.http.headers.set( key, value );
		#end
	}
	
}