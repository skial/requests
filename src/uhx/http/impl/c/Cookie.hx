package uhx.http.impl.c;

import haxe.ds.StringMap.StringMap;
import taurine.io.Uri;
import taurine.io.QueryString;

using StringTools;

/**
 * ...
 * @author Skial Bainn
 */
class Cookie {
	
	public var name:String = null;
	public var value:String = null;
	public var expires:String = null;
	public var path:String = null;
	public var domain:Uri = null;
	public var httpOnly:Bool = false;
	public var secure:Bool = false;
	
	public function new() {
		// om nom nom
	}
	
	public function toString() {
		var result = '';
		
		if (name != null && value != null) {
			
			result = '$name=${value.urlEncode()}';
			if (expires != null) result += ' ;expires=$expires';
			if (domain != null) result += ' ;domain=${domain.toString()}';
			if (path != null) result += ' ;path=$path';
			if (httpOnly) result += ' ;HttpOnly';
			if (secure) result += ' ;Secure';
			if (!result.endsWith(';')) result += '; ';
			
		}
		
		return result;
	}
	
	public static function fromString(data:String):StringMap<Cookie> {
		var jar = new StringMap<Cookie>();
		
		if (data != null && data != '' && data.trim() != '') {
			
			var map = QueryString.parse( data, ';' );
			
			for (key in map.keys()) {
				var cookie = new Cookie();
				
				switch( key ) {
					case 'expires': cookie.expires = map.get( key )[0];
					case 'domain': cookie.domain = new Uri( map.get( key )[0] );
					case 'path': cookie.path = map.get( key )[0];
					case 'httpOnly': cookie.httpOnly = map.get( key )[0] == 'true' ? true : false;
					case 'secure': cookie.secure = map.get( key )[0] == 'true' ? true : false;
					case _:
						cookie.name = key.trim();
						cookie.value = map.get( key )[0].urlDecode();
						jar.set( cookie.name, cookie );
				}
			}
			
		}
		
		return jar;
	}
	
}