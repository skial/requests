package uhx.http;

/**
 * ...
 * @author Skial Bainn
 */

// TODO Make uhx.http.Method typedef js.node.http.Method for hxnodejs
@:enum abstract Method(String) from String to String {
	public var GET = 'get';
	public var HEAD = 'head';
	public var POST = 'post';
	public var PUT = 'put';
	public var DELETE = 'delete';
	public var OPTIONS = 'options';
	public var PATCH = 'patch';
}