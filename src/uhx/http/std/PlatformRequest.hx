package uhx.http.std;

import haxe.Http;
import uhx.http.Status;
import uhx.http.Method;
import haxe.ds.StringMap;

/**
 * ...
 * @author Skial Bainn
 */
class PlatformRequest {
	
	public var url:String;
	public var method:Method;
	@:isVar public var status(get, set):Status;
	
	private var http:Http;
	private var data:Void->Void;
	private var error:Void->Void;
	
	public inline function new(url:String, method:Method, callback:Void->Void, onError:Void->Void) {
		this.url = url;
		this.method = method;
		this.data = callback;
		this.error = onError;
		
		http = new Http( url );
		http.onStatus = this.onStatus;
		http.onData = this.onData;
		http.onError = this.onError;
	}
	
	public inline function setHeader(key:String, value:String):Void {
		http.setHeader( key, value );
	}
	
	public inline function setParameter(key:String, value:String):Void {
		http.setParameter( key, value );
	}
	
	public inline function send():Void {
		http.request( method == POST );
	}
	
	// Internal
	
	private inline function get_status():Status {
		return status == null ? -1 : status;
	}
	
	private inline function set_status(v:Int):Status {
		return status = v;
	}
	
	private inline function onStatus(s:Int):Void {
		status = s;
	}
	
	private inline function onData(e:String):Void {
		data();
	}
	
	private inline function onError(e:String):Void {
		error();
	}
	
}