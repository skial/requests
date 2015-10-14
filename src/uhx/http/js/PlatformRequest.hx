package uhx.http.js;

import uhx.http.Status;
import haxe.ds.StringMap;
import js.html.EventListener;
import js.html.XMLHttpRequest;

using StringTools;

/**
 * ...
 * @author Skial Bainn
 */
class PlatformRequest {
	
	public var url:String;
	public var method:Method;
	@:isVar public var status(get, set):Status;
	
	private var data:Void->Void;
	private var error:Void->Void;
	private var http:XMLHttpRequest;
	private var parameters:StringMap<String>;

	public inline function new(url:String, method:Method, callback:Void->Void, onError:Void->Void) {
		this.url = url;
		this.method = method;
		this.data = callback;
		this.error = onError;
		
		parameters = new StringMap();
		http = new XMLHttpRequest();
		http.open( method.toUpperCase(), url, true );
		http.onload = onData;
		http.onerror = this.onError;
	}
	
	public inline function setHeader(key:String, value:String):Void {
		http.setRequestHeader( key, value );
	}
	
	public inline function setParameter(key:String, value:String):Void {
		parameters.set( key, value );
	}
	
	public inline function send():Void {
		var data = '';
		data += (data != '' ? '&' : '') + key.urlEncode() + '=' + params.get( key ).urlEncode();
		setHeader('content-type', 'application/x-www-form-urlencoded');
		http.send( data );
	}
	
	// Internal
	
	private inline function get_status():Status {
		return status == null ? status = ;
	}
	
	private inline function set_status(v:Int):Status {
		return status = v;
	}
	
	private inline function onData(e:EventListener):Void {
		status = http.status;
		data();
	}
	
	private inline function onError(e:EventListener):Void {
		error();
	}
	
}