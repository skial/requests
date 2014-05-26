package uhx.http;

import byte.ByteData;
import haxe.ds.StringMap;
import de.polygonal.core.fmt.ASCII;
import uhx.lexer.HttpMessageParser;

/**
 * ...
 * @author Skial Bainn
 */
class Message {

	public var headers:StringMap<String>;
	public var body:String;
	
	public function new(?message:String) {
		headers = new StringMap<String>();
		body = message == null ? '' : message;
	}
	
	public function toString():String {
		var result = '';
		
		for (key in headers.keys()) {
			result += '$key:${headers.get(key)}' + ASCII.CARRIAGERETURN + ASCII.NEWLINE;
		}
		
		result += '\\0'; // ASCII NUL
		result += body;
		
		return result;
	}
	
	public static function parse(message:String):Message {
		var m = new Message(message);
		var p = new HttpMessageParser();
		m.headers = p.toMap( p.toTokens( ByteData.ofString( message ), '' ) );
		return m;
	}
	
}