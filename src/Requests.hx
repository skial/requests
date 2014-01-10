package ;

import haxe.macro.ComplexTypeTools;
import haxe.macro.Context;
import taurine.io.Uri;
import uhx.http.Request;
import uhx.http.Response;
import uhx.http.impl.e.EMethod;

#if macro
import haxe.macro.Expr;

using haxe.macro.ExprTools;
#end
using StringTools;

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
		var data = null;
		var args = [cb];
		
		es.push( macro var $id = new Request( new Uri( $url ), $method ) );
		
		for (r in rest) switch (r) {
			case macro headers = $expr:
				switch (expr.expr) {
					case EObjectDecl( fields ):
						for (field in fields) {
							// We need to replace identifier's prefixed by the compiler. eg `@$__hx__`.
							// See http://haxe.org/manual/struct#json-notation
							es.push( macro $i { id } .headers.set( $v { field.field.replace( "@$__hx__", '' ) }, '' + $e { field.expr } ) );
						}
						
					case _:
						
				}
				
			case macro data = $expr if (method.toString() == 'POST'):
				
				switch (expr) {
					case { expr:EObjectDecl( fields ), pos:pos } if (fields.length > 0):
						data = '${id}PostData';
						
						es.push( macro var $data = new haxe.ds.StringMap<String>() );
						for (field in fields) {
							es.push( macro $i { data } .set( $v { field.field }, $v { field.expr.toString() } ) );
						}
						
						args[1] = macro $i{ data };
						
					case { expr:EConst(CString(v)), pos:pos } if (v != ''):
						if (args.length < 2) args[1] = macro null;
						args[2] = macro $v { v };
						
					case _:
						try {
							var type = Context.typeof( expr );
							switch (type) {
								case TAnonymous( _ ):
									data = '${id}PostData';
									
									es.push( macro var $data = new haxe.ds.StringMap<String>() );
									es.push( macro for (field in Reflect.fields( $expr )) {
										$i { data } .set(field, Reflect.field( $expr, field ));
									} );
									
									args[1] = macro $i{ data };
									
								case _:
									if (args.length < 2) args[1] = macro null;
									args[2] = expr;
							}
							
						} catch (e:Dynamic) {
							
						}
				}
				
			case _:
				
		}
		
		es.push( macro $i{ id }.send( $a{ args } ) );
		
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