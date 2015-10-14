package uhx.http;

import byte.ByteData;
import haxe.ds.StringMap;
import uhx.parser.HttpMessage;
import de.polygonal.core.fmt.ASCII;

#if macro
import haxe.macro.*;
#end

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
		var p = new HttpMessage();
		m.headers = p.toMap( p.toTokens( ByteData.ofString( message ), '' ) );
		return m;
	}
	
}

/*@:enum abstract ASCII_INT(Int) from Int to Int {
	var BACKSPACE 		= 8;
	var TAB 			= 9;
	var NEWLINE 		= 10;
	var FORMFEED		= 12;
	var CARRIAGERETURN	= 13;
	var SPACE         	= 32;
	var EXCLAM        	= 33;
	var QUOTEDBL      	= 34;
	var NUMBERSIGN    	= 35;
	var DOLLAR        	= 36;
	var PERCENT       	= 37;
	var AMPERSAND     	= 38;
	var QUOTESINGLE   	= 39;
	var PARENLEFT     	= 40;
	var PARENRIGHT    	= 41;
	var ASTERISK      	= 42;
	var PLUS          	= 43;
	var COMMA         	= 44;
	var HYPHEN        	= 45;
	var PERIOD        	= 46;
	var SLASH         	= 47;
	
	var ZERO          	= 48;
	var ONE           	= 49;
	var TWO           	= 50;
	var THREE         	= 51;
	var FOUR          	= 52;
	var FIVE          	= 53;
	var SIX           	= 54;
	var SEVEN         	= 55;
	var EIGHT         	= 56;
	var NINE          	= 57;
	
	var COLON         	= 58;
	var SEMICOLON     	= 59;
	var LESS          	= 60;
	var EQUAL         	= 61;
	var GREATER       	= 62;
	var QUESTION      	= 63;
	var AT            	= 64;
	
	var A             	= 65;
	var B             	= 66;
	var C             	= 67;
	var D             	= 68;
	var E             	= 69;
	var F             	= 70;
	var G             	= 71;
	var H             	= 72;
	var I             	= 73;
	var J             	= 74;
	var K             	= 75;
	var L             	= 76;
	var M             	= 77;
	var N             	= 78;
	var O             	= 79;
	var P             	= 80;
	var Q             	= 81;
	var R             	= 82;
	var S             	= 83;
	var T             	= 84;
	var U             	= 85;
	var V             	= 86;
	var W             	= 87;
	var X             	= 88;
	var Y             	= 89;
	var Z             	= 90;
	
	var BRACKETLEFT   	= 91;
	var BACKSLASH     	= 92;
	var BRACKETRIGHT  	= 93;
	var CIRCUM        	= 94;
	var UNDERSCORE    	= 95;
	var GRAVE         	= 96;
	
	var a             	= 97;
	var b             	= 98;
	var c             	= 99;
	var d             	= 100;
	var e             	= 101;
	var f             	= 102;
	var g             	= 103;
	var h             	= 104;
	var i             	= 105;
	var j             	= 106;
	var k             	= 107;
	var l             	= 108;
	var m             	= 109;
	var n             	= 110;
	var o             	= 111;
	var p             	= 112;
	var q             	= 113;
	var r             	= 114;
	var s             	= 115;
	var t             	= 116;
	var u             	= 117;
	var v             	= 118;
	var w             	= 119;
	var x             	= 120;
	var y             	= 121;
	var z             	= 122;
	
	var BRACELEFT     	= 123;
	var BAR           	= 124;
	var BRACERIGTH    	= 125;
	var TILDE         	= 126;
}

@:enum abstract ASCII_STRING(String) from String to String {
	var BACKSPACE 		= '\b';
	var TAB 			= '\t';
	var NEWLINE 		= '\n';
	var FORMFEED		= '\f';
	var CARRIAGERETURN	= '\r';
	var SPACE         	= ' ';
	var EXCLAM        	= '!';
	var QUOTEDBL      	= '"';
	var NUMBERSIGN    	= '#';
	var DOLLAR        	= '$';
	var PERCENT       	= '%';
	var AMPERSAND     	= '&';
	var QUOTESINGLE   	= "'";
	var PARENLEFT     	= '(';
	var PARENRIGHT    	= ')';
	var ASTERISK      	= '*';
	var PLUS          	= '+';
	var COMMA         	= ',';
	var HYPHEN        	= '-';
	var PERIOD        	= '.';
	var SLASH         	= '/';
	
	var ZERO          	= '0';
	var ONE           	= '1';
	var TWO           	= '2';
	var THREE         	= '3';
	var FOUR          	= '4';
	var FIVE          	= '5';
	var SIX           	= '6';
	var SEVEN         	= '7';
	var EIGHT         	= '8';
	var NINE          	= '9';
	
	var COLON         	= ':';
	var SEMICOLON     	= ';';
	var LESS          	= '<';
	var EQUAL         	= '=';
	var GREATER       	= '>';
	var QUESTION      	= '?';
	var AT            	= '@';
	
	var A             	= 'A';
	var B             	= 'B';
	var C             	= 'C';
	var D             	= 'D';
	var E             	= 'E';
	var F             	= 'F';
	var G             	= 'G';
	var H             	= 'H';
	var I             	= 'I';
	var J             	= 'J';
	var K             	= 'K';
	var L             	= 'L';
	var M             	= 'M';
	var N             	= 'N';
	var O             	= 'O';
	var P             	= 'P';
	var Q             	= 'Q';
	var R             	= 'R';
	var S             	= 'S';
	var T             	= 'T';
	var U             	= 'U';
	var V             	= 'V';
	var W             	= 'W';
	var X             	= 'X';
	var Y             	= 'Y';
	var Z             	= 'Z';
	
	var BRACKETLEFT   	= '[';
	var BACKSLASH     	= '\\';
	var BRACKETRIGHT  	= ']';
	var CIRCUM        	= '^';
	var UNDERSCORE    	= '_';
	var GRAVE         	= '`';
	
	var a             	= 'a';
	var b             	= 'b';
	var c             	= 'c';
	var d             	= 'd';
	var e             	= 'e';
	var f             	= 'f';
	var g             	= 'g';
	var h             	= 'h';
	var i             	= 'i';
	var j             	= 'j';
	var k             	= 'k';
	var l             	= 'l';
	var m             	= 'm';
	var n             	= 'n';
	var o             	= 'o';
	var p             	= 'p';
	var q             	= 'q';
	var r             	= 'r';
	var s             	= 's';
	var t             	= 't';
	var u             	= 'u';
	var v             	= 'v';
	var w             	= 'w';
	var x             	= 'x';
	var y             	= 'y';
	var z             	= 'z';
	
	var BRACELEFT     	= '{';
	var BAR           	= '|';
	var BRACERIGTH    	= '}';
	var TILDE         	= '~';
}

interface ASCII_INTERFACE {
	var BACKSPACE:Dynamic;
	var TAB:Dynamic;
	var NEWLINE:Dynamic;
	var FORMFEED:Dynamic;
	var CARRIAGERETURN:Dynamic;
	var SPACE:Dynamic;
	var EXCLAM:Dynamic;
	var QUOTEDBL:Dynamic;
	var NUMBERSIGN:Dynamic;
	var DOLLAR:Dynamic;
	var PERCENT:Dynamic;
	var AMPERSAND:Dynamic;
	var QUOTESINGLE:Dynamic;
	var PARENLEFT:Dynamic;
	var PARENRIGHT:Dynamic;
	var ASTERISK:Dynamic;
	var PLUS:Dynamic;
	var COMMA:Dynamic;
	var HYPHEN:Dynamic;
	var PERIOD:Dynamic;
	var SLASH:Dynamic;
	
	var ZERO:Dynamic;
	var ONE:Dynamic;
	var TWO:Dynamic;
	var THREE:Dynamic;
	var FOUR:Dynamic;
	var FIVE:Dynamic;
	var SIX:Dynamic;
	var SEVEN:Dynamic;
	var EIGHT:Dynamic;
	var NINE:Dynamic;
	
	var COLON:Dynamic;
	var SEMICOLON:Dynamic;
	var LESS:Dynamic;
	var EQUAL:Dynamic;
	var GREATER:Dynamic;
	var QUESTION:Dynamic;
	var AT:Dynamic;
	
	var A:Dynamic;
	var B:Dynamic;
	var C:Dynamic;
	var D:Dynamic;
	var E:Dynamic;
	var F:Dynamic;
	var G:Dynamic;
	var H:Dynamic;
	var I:Dynamic;
	var J:Dynamic;
	var K:Dynamic;
	var L:Dynamic;
	var M:Dynamic;
	var N:Dynamic;
	var O:Dynamic;
	var P:Dynamic;
	var Q:Dynamic;
	var R:Dynamic;
	var S:Dynamic;
	var T:Dynamic;
	var U:Dynamic;
	var V:Dynamic;
	var W:Dynamic;
	var X:Dynamic;
	var Y:Dynamic;
	var Z:Dynamic;
	
	var BRACKETLEFT:Dynamic;
	var BACKSLASH:Dynamic;
	var BRACKETRIGHT:Dynamic;
	var CIRCUM:Dynamic;
	var UNDERSCORE:Dynamic;
	var GRAVE:Dynamic;
	
	var a:Dynamic;
	var b:Dynamic;
	var c:Dynamic;
	var d:Dynamic;
	var e:Dynamic;
	var f:Dynamic;
	var g:Dynamic;
	var h:Dynamic;
	var i:Dynamic;
	var j:Dynamic;
	var k:Dynamic;
	var l:Dynamic;
	var m:Dynamic;
	var n:Dynamic;
	var o:Dynamic;
	var p:Dynamic;
	var q:Dynamic;
	var r:Dynamic;
	var s:Dynamic;
	var t:Dynamic;
	var u:Dynamic;
	var v:Dynamic;
	var w:Dynamic;
	var x:Dynamic;
	var y:Dynamic;
	var z:Dynamic;
	
	var BRACELEFT:Dynamic;
	var BAR:Dynamic;
	var BRACERIGTH:Dynamic;
	var TILDE:Dynamic;
}

@:multiType abstract ASCII_(ASCII_INTERFACE) {
	
	public inline function new() { }
	
	@:to public static function toString(t:ASCII_INTERFACE):ASCII_STRING {
		return ASCII_STRING;
	}
	
	@:to public static function toInt(t:ASCII_INTERFACE):ASCII_INT {
		return ASCII_INT;
	}
	
}*/

@:enum abstract ASCII_INT(Int) from Int to Int {
	var BACKSPACE 		= 8;
}

@:enum abstract ASCII_STRING(String) from String to String {
	var BACKSPACE 		= '\\b';
}

@:genericBuild( MyMacro.build() )
class ASCII_<T> {}

#if macro
class MyMacro {
	public static function build() {
		switch (haxe.macro.Context.getLocalType()) {
			case TInst(_.get() => { pack: [], name: "ASCII_" }, []):
				switch (t) {
					case TAbstract(_.get() => { pack: [], name: "Int" }, []):
						return macro :ASCII_INT;
					case TInst(_.get() => { pack: [], name: "String" }, []):
						return macro :ASCII_STRING;
					case _:
						return t;
				}
			case _:
				
		}
	}
}
#end