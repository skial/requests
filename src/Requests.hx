package ;


import uhx.types.Uri;
import uhx.http.Method;
import uhx.http.Request;
import uhx.http.Response;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.ComplexTypeTools;

using StringTools;
using haxe.macro.ExprTools;

/**
 * ...
 * @author Skial Bainn
 */
class Requests {
	
	public static macro function get(url:ExprOf<String>, cb:ExprOf< Response-> Void > , rest:Array<Expr>) {
		return transformRequest( url, cb, macro GET, rest );
	}
	
	public static macro function post(url:ExprOf<String>, cb:ExprOf< Response->Void >, rest:Array<Expr>) {
		return transformRequest( url, cb, macro POST, rest );
	}
	
	#if macro
	private static var counter:Int = 0;
	
	private static function transformRequest(url:Expr, cb:Expr, method:Expr, rest:Array<Expr>) {
		var id = 'rq' + counter++;
		var es = [];
		var data = null;
		var args = [cb];
		
		es.push( macro var $id = new Request( ( $url:Uri ), $method ) );
		es.push( macro $i { id } .send( $a { args } ) );
		//es.push( macro $i { id } );
		
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