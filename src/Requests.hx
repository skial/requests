package ;

import taurine.io.Uri;
import uhx.http.Request;
import uhx.http.Response;
import uhx.http.impl.e.EMethod;

#if macro
import haxe.macro.Expr;

using haxe.macro.ExprTools;
#end

/**
 * ...
 * @author Skial Bainn
 */
class Requests {
	
	public static macro function get(url:ExprOf<String>, cb:ExprOf< Response->Void >, rest:Array<Expr>) {
		return transformRequest( url, cb, macro GET, rest );
	}
	
	public static macro function post(url:ExprOf<String>, cb:ExprOf< Response->Void >, rest:Array<Expr>) {
		return transformRequest( url, cb, macro POST, rest );
	}
	
	#if macro
	private static var counter:Int = 0;
	
	private static function transformRequest(url:Expr, cb:Expr, method:ExprOf<EMethod>, rest:Array<Expr>) {
		var id = 'rq' + counter++;
		var es = [];
		
		es.push( macro var $id = new Request( new Uri( $url ), $method ) );
		
		for (r in rest) switch (r) {
			case macro headers = $expr:
				
			case macro data = $expr if (method == macro POST):
				
			case _:
				
		}
		
		es.push( macro $i{ id }.send( $cb ) );
		
		var block = { expr: EBlock( es ), pos: url.pos };
		return macro @:mergeBlock $block;
	}
	#end

	/*public static function get(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), GET );
		rq.send( callback );
	}
	
	public static function post(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), POST );
		rq.send( callback );
	}
	
	public static function put(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), PUT );
		rq.send( callback );
	}
	
	public static function delete(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), DELETE );
		rq.send( callback );
	}
	
	public static function head(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), HEAD );
		rq.send( callback );
	}
	
	public static function options(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), OPTIONS );
		rq.send( callback );
	}
	
	public static function patch(url:String, callback:Response->Void) {
		var rq = new Request( new Uri( url ), PATCH );
		rq.send( callback );
	}*/
	
}