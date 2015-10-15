package uhx.http.std;

import haxe.Http;
import uhx.http.Method;
import uhx.http.Status;
import haxe.ds.StringMap;

/**
 * ...
 * @author Skial Bainn
 */
@:forward abstract Request(RequestImpl) {

	public inline function new(url:String, method:Method, onData:Void->Void, onError:Void->Void) {
		this = new RequestImpl( url, method, onData, onError );
	}
	
}

private class RequestImpl {
	
	public var url:String;
	public var body:String;
	public var method:Method;
	public var status:Status;
	public var underlying:Http;
	
	private var data:Void->Void;
	private var error:Void->Void;
	
	public inline function new(url:String, method:Method, callback:Void->Void, onError:Void->Void) {
		this.url = url;
		this.method = method;
		this.data = callback;
		this.error = onError;
	}
	
	public inline function prepare() {
		underlying = new Http( this.url );
		underlying.onStatus = this.onStatus;
		underlying.onData = this.onData;
		underlying.onError = this.onError;
	}
	
	public inline function destroy() {
		
	}
	
	public inline function setHeader(key:String, value:String):Void {
		underlying.setHeader( key, value );
	}
	
	public inline function setParameter(key:String, value:String):Void {
		underlying.setParameter( key, value );
	}
	
	public inline function send(?params:StringMap<String>, ?data:String):Void {
		underlying.request( method == POST );
	}
	
	// Internal
	
	private inline function onStatus(s:Int):Void {
		status = s;
		trace( status );
	}
	
	private inline function onData(e:String):Void {
		body = e;
		data();
	}
	
	private inline function onError(e:String):Void {
		trace( e );
		error();
	}
	
}