package uhx.http;

/**
 * ...
 * @author Skial Bainn
 */
import haxe.io.Bytes;
import haxe.rtti.Meta;
import taurine.io.Uri;
import uhx.http.Request;
import haxe.ds.StringMap;
import uhx.http.impl.Status;
import uhx.http.impl.e.EStatus;
import uhx.http.impl.a.Headers;

#if js
import js.html.XMLHttpRequest;
#else
import haxe.Http;
#end

/**
 * ...
 * @author Skial Bainn
 */

class Response implements Klas {
	
	public var request(default, null):Request;
	public var url(get, null):Uri;
	public var text(get, null):String;
	public var status(get, null):EStatus;
	public var content(get, null):Bytes;
	//public var encoding(get, null):String;
	public var status_code(get, null):Int;
	public var history(get, null):Array<String>;
	public var headers(default, null):Headers;
	
	#if js
	private var xhr:XMLHttpRequest;
	#else
	private var http:Http;
	#end
	
	public function new(r:Request) {
		request = r;
		
		#if js
		xhr = request.xhr;
		headers = request.headers;
		#else
		http = request.http;
		headers = request.headers;
		#end
		
		untyped console.log( 'new  response' );
		untyped console.log( xhr );
	}
	
	private function get_url():Uri {
		return request.url;
	}
	
	private function get_text():String {
		#if js
		return xhr.responseText;
		#else
		return http.responseData;
		#end
	}
	
	private function get_status():EStatus {
		#if js
		return Status.fromInt.get( xhr.status );
		#else
		return Status.fromInt.get( request.status );
		#end
	}
	
	private function get_content():Bytes {
		return Bytes.ofString( '' );
	}
	
	/*private function get_encoding():String {
		return '';
	}*/
	
	private function get_status_code():Int {
		#if js
		return xhr.status;
		#else
		return request.status;
		#end
	}
	
	private function get_history():Array<String> {
		return [''];
	}
	
}