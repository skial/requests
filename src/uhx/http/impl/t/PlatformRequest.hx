package uhx.http.impl.t;

/**
 * @author Skial Bainn
 */

typedef PlatformRequest =
#if js
js.html.XMLHttpRequest;
#else
haxe.Http;
#end