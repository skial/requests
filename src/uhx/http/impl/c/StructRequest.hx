package uhx.http.impl.c;

import haxe.ds.StringMap;
import taurine.io.Uri;
import uhx.http.Response;
import uhx.http.impl.e.EMethod;
import uhx.http.impl.t.PlatformRequest;

/**
 * ...
 * @author Skial Bainn
 */
class StructRequest {
	
	public var url:Uri;
	public var method:EMethod;
	public var underlying:PlatformRequest;
	
	@:noCompletion public var status:Int = 0;
	@:noCompletion public var reqHeaders:StringMap<String>;
	@:noCompletion public var resHeaders:StringMap<String>;
	@:noCompletion public var callback:Void->Void;

	public function new(r:PlatformRequest, u:Uri, m:EMethod, c:Void->Void) {
		url = u;
		method = m;
		underlying = r;
		callback = c;
		reqHeaders = new StringMap<String>();
		resHeaders = new StringMap<String>();
		
		initialize();
	}
	
	// Internal
	
	private function initialize() {
		#if js
		underlying.open( method, url.toString(), true );
		underlying.onloadend = onData;
		#else
		
		#end
	}
	
	// Callbacks
	
	private function onData(e) {
		#if js
		status = underlying.status;
		#end
		
		callback();
	}
	
	#if !js
	private function onStatus(s) {
		status = s;
	}
	#end
	
}