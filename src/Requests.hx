package ;

import taurine.io.Uri;
import uhx.http.Request;
import uhx.http.Response;
import uhx.http.impl.e.EMethod;

/**
 * ...
 * @author Skial Bainn
 */
class Requests {

	public static function get(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), GET );
		rq.send( function() { callback(rq.response); } );
	}
	
	public static function post(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), POST );
		rq.send( function() { callback(rq.response); } );
	}
	
	public static function put(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), PUT );
		rq.send( function() { callback(rq.response); } );
	}
	
	public static function delete(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), DELETE );
		rq.send( function() { callback(rq.response); } );
	}
	
	public static function head(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), HEAD );
		rq.send( function() { callback(rq.response); } );
	}
	
	public static function options(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), OPTIONS );
		rq.send( function() { callback(rq.response); } );
	}
	
	public static function patch(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), PATCH );
		rq.send( function() { callback(rq.response); } );
	}
	
}

abstract Res(Response) from Response to Response {
	
	
	
}