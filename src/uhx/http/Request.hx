package uhx.http;

import haxe.PosInfos;
import uhx.types.Uri;
import uhx.http.Method;
import haxe.ds.StringMap;
import uhx.http.PlatformRequest;

using StringTools;
using haxe.EnumTools;

/**
 * ...
 * @author Skial Bainn
 */
class Request {
	
	private var callback:PlatformResponse->Void;
	private var requestor:PlatformRequest;
	
	public var url(default, null):Uri;
	public var method(default, null):Method;
	public var response(default, null):PlatformResponse;
	public var headers(get, set):StringMap<String>;

	public function new(url:Uri, method:Method) {
		this.url = url;
		this.method = method;
		trace( url.toString() );
		requestor = new PlatformRequest( url, method, onData, function() { } );
	}
	
	public function send(cb:PlatformResponse->Void, ?params:StringMap<String>, ?data:String = ''):Void {
		prepare();
		
		callback = cb;
		
		requestor.send(params, data);
	}
	
	// Internal
	
	private function destory() {
		requestor.destroy();
	}
	
	private function prepare() {
		requestor.prepare();
	}
	
	private function get_headers():StringMap<String> {
		return ['' => ''];
	}
	
	private function set_headers(v:StringMap<String>):StringMap<String> {
		return v;
	}
	
	// Events
	
	private function onData() {
		trace( 'creating response' );
		response = new PlatformResponse( requestor );
		trace( 'calling callback' );
		callback( response );
	}
	
}