package uhx.http;

/**
 * @author Skial Bainn
 */
typedef PlatformResponse = uhx.http.
#if (js && !hxnodejs)
js.Response
#elseif (js && hxnodejs)
nodejs.Response
#else
std.Response
#end
;