package uhx.http.impl.a;

import haxe.ds.StringMap;
import uhx.http.impl.t.PlatformRequest;

private class HiddenRequest {
	public var r:PlatformRequest;
	public var h:StringMap<String>;
	public function new(r:PlatformRequest, h:StringMap<String>) {
		this.r = r;
		this.h = h;
	}
}

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

abstract Headers(HiddenRequest) {
	
	public function new(v:HiddenRequest) this = v;
	
	public function set(key:String, value:String):Void this.h.set( key, value );
	public function get(key:String):Null<String> return this.h.get( key );
	public function exists(key:String):Bool return this.h.exists( key );
	public function remove(key:String):Bool return this.h.remove( key );
	public function keys():Iterator<String> return this.h.keys();
	public function iterator():Iterator<String> return this.h.iterator();
	public function toString():String return this.h.toString();
	
	/*@:noCompletion public function completeHeaders():PlatformRequest {
		for (key in this.h.keys()) {
			
		}
	}*/
}

/*class Headers {
	
	private var http:PlatformHeaders;
	
	public function new(v:PlatformHeaders) {
		this.http = v;
	}
	
	@:access(haxe.Http) public function get(key:String):String {
		#if js
		return this.http.getResponseHeader( key );
		#else
		var result = '';
		
		for (header in this.http.headers) if (header.header == key) {
			result = header.value;
			break;
		}
		
		return result;
		#end
	}
	
	@:access(haxe.Http) public function exists(key:String):Bool {
		#if js
		return this.http.getResponseHeader( key ) != null;
		#else
		var result = false;
		
		for (header in this.http.headers) if (header.header == key) {
			result = true;
			break;
		}
		
		return result;
		#end
	}
	
	@:access(haxe.Http) public function set(key:String, value:String):Void {
		#if js
		this.http.setRequestHeader( key, value );
		#else
		this.http.headers.remove( { header:key, value:value } );
		this.http.headers.add( { header:key, value:value } );
		#end
	}
	
}*/