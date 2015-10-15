package uhx.http;

/**
 * ...
 * @author Skial Bainn
 */
import haxe.io.Bytes;
import uhx.types.Uri;
import haxe.rtti.Meta;
import uhx.http.Status;
import uhx.http.Request;
import haxe.ds.StringMap;

/**
 * ...
 * @author Skial Bainn
 */

class Response {
	
	public var request(default, null):Request;
	public var url(get, null):Uri;
	public var text(get, null):String;
	public var status(get, null):Status;
	public var content(get, null):Bytes;
	//public var encoding(get, null):String;
	public var code(get, null):Int;
	public var history(get, null):Array<String>;
	public var headers(get, null):StringMap<String>;
	
	public function new(r:Request) {
		request = r;
		//requestor.prepare();
	}
	
	private function get_url():Uri {
		return request.url;
	}
	
	private function get_text():String {
		return '';
	}
	
	private inline function get_status():Status {
		return request.requestor.status;
	}
	
	private function get_content():Bytes {
		return Bytes.ofString( '' );
	}
	
	/*private function get_encoding():String {
		return '';
	}*/
	
	private function get_code():Int {
		return request.requestor.status;
	}
	
	private function get_history():Array<String> {
		return [''];
	}
	
	private function get_headers():StringMap<String> {
		return ;
	}

}