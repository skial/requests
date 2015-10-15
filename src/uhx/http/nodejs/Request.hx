package uhx.http.nodejs;

import js.node.Http;
import js.node.http.ClientRequest;
import js.node.http.IncomingMessage;
import uhx.types.Uri;
import uhx.http.Method;
import uhx.http.Status;
import haxe.ds.StringMap;

/**
 * ...
 * @author Skial Bainn
 */
@:forward abstract Request(RequestImpl) {

	public inline function new(url:Uri, method:Method, onData:Void->Void, onError:Void->Void) {
		this = new RequestImpl( url, method, onData, onError );
	}
	
}

class RequestImpl {

	public var url:Uri;
	public var method:Method;
	public var status:Status;
	public var underlying:ClientRequest;
	public var underlyingResponse:IncomingMessage;
	public var underlyingOptions:HttpRequestOptions;
	
	private var data:Void->Void;
	private var error:Void->Void;
	
	public inline function new(url:Uri, method:Method, callback:Void->Void, onError:Void->Void) {
		this.url = url;
		this.method = method;
		this.data = callback;
		this.error = onError;
	}
	
	public inline function prepare() {
		underlyingOptions = { };
		// TODO Make uhx.http.Method typedef js.node.http.Method for hxnodejs
		underlyingOptions.method = (method:String).toUpperCase();
		underlyingOptions.host = url.domain;
		underlyingOptions.port = url.port;
		underlyingOptions.path = url.path + '?' + [for (key in url.queries.keys()) for (value in url.queries.get( key )) '$key=$value'].join('&') + '#' + url.fragment;
		underlying = Http.request( underlyingOptions, this.onData );
		underlying.on( 'error', onError );
	}
	
	public inline function destroy() {
		
	}
	
	public inline function setHeader(key:String, value:String):Void {
		//underlying.setHeader( key, value );
	}
	
	public inline function setParameter(key:String, value:String):Void {
		//underlying.setParameter( key, value );
	}
	
	public inline function send(?params:StringMap<String>, ?data:String):Void {
		underlying.end();
	}
	
	// Internal
	
	private inline function onData(response:IncomingMessage):Void {
		status = response.statusCode;
		underlyingResponse = response;
		var result = '';
		response.on( 'data', function(chunk:String) result += chunk );
		response.on( 'end', data );
	}
	
	private inline function onError(e:String):Void {
		trace( e );
		error();
	}
	
	private inline function get_status():Status {
		return status;
	}
	
	private inline function set_status(v:Status):Status {
		return status = v;
	}
	
}