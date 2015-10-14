package uhx.http;

/**
 * @author Skial Bainn
 */
typedef PlatformRequest = uhx.http.
#if (js && !hxnodejs)
js.PlatformRequest
#elseif (js && hxnodejs)
nodejs.Request
#else
std.Request
#end
;