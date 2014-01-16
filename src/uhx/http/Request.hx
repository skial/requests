package uhx.http;

import haxe.PosInfos;
import taurine.io.Uri;
import haxe.ds.StringMap;
import uhx.http.Response;
import uhx.http.impl.t.TData;
import uhx.http.impl.c.Cookie;
import uhx.http.impl.e.EMethod;
import uhx.http.impl.a.Headers;
import uhx.http.impl.c.StructRequest;
import uhx.http.impl.t.PlatformRequest;
import uhx.http.impl.c.PreparedRequest;

using StringTools;
using haxe.EnumTools;

/**
 * ...
 * @author Skial Bainn
 */
@:allow(uhx.http.Response)
class Request {
	
	private var callback:Response->Void;
	private var requestor:PreparedRequest;
	
	public var url(default, null):Uri;
	public var method(default, null):EMethod;
	public var response(default, null):Response;
	public var headers(get, set):StringMap<String>;
	public var cookies(get, set):StringMap<Cookie>;

	public function new(url:Uri, method:EMethod) {
		this.url = url;
		this.method = method;
		
		requestor = new PreparedRequest( 
			new StructRequest( 
				new PlatformRequest( #if !js url.toString() #end ), 
				url,
				method, 
				onData
			) 
		);
	}
	
	public function send(cb:Response->Void, ?params:StringMap<String>, ?data:String = ''):Void {
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
		return requestor.headers;
	}
	
	private function set_headers(v:StringMap<String>):StringMap<String> {
		return requestor.headers = v;
	}
	
	private function get_cookies():StringMap<Cookie> {
		return requestor.cookies;
	}
	
	private function set_cookies(v:StringMap<Cookie>):StringMap<Cookie> {
		return requestor.cookies = v;
	}
	
	// Events
	
	private function onData() {
		response = new Response( this );
		callback( response );
	}
	
}