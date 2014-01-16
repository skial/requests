package uhx.http;

/**
 * ...
 * @author Skial Bainn
 */
import haxe.io.Bytes;
import haxe.rtti.Meta;
import taurine.io.Uri;
import uhx.http.impl.c.PreparedResponse;
import uhx.http.Request;
import haxe.ds.StringMap;
import uhx.http.impl.Status;
import uhx.http.impl.c.Cookie;
import uhx.http.impl.e.EStatus;
import uhx.http.impl.a.Headers;

/**
 * ...
 * @author Skial Bainn
 */

class Response {
	
	private var requestor:PreparedResponse;
	
	public var request(default, null):Request;
	public var url(get, null):Uri;
	public var text(get, null):String;
	public var status(get, null):EStatus;
	public var content(get, null):Bytes;
	//public var encoding(get, null):String;
	public var code(get, null):Int;
	public var history(get, null):Array<String>;
	public var headers(get, null):StringMap<String>;
	public var cookies(get, null):StringMap<Cookie>;
	
	public function new(r:Request) {
		request = r;
		
		requestor = new PreparedResponse( r.requestor.struct );
		requestor.prepare();
	}
	
	private function get_url():Uri {
		return request.url;
	}
	
	private function get_text():String {
		#if js
		return requestor.struct.underlying.responseText;
		#else
		return requestor.struct.underlying.responseData;
		#end
	}
	
	private function get_status():EStatus {
		return Status.fromInt.get( requestor.struct.status );
	}
	
	private function get_content():Bytes {
		return Bytes.ofString( '' );
	}
	
	/*private function get_encoding():String {
		return '';
	}*/
	
	private function get_code():Int {
		return requestor.struct.status;
	}
	
	private function get_history():Array<String> {
		return [''];
	}
	
	private function get_headers():StringMap<String> {
		return requestor.headers;
	}
	
	private function get_cookies():StringMap<Cookie> {
		return requestor.cookies;
	}
	
}