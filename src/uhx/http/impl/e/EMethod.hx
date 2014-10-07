package uhx.http.impl.e;

/**
 * ...
 * @author Skial Bainn
 */

@:enum abstract EMethod(String) from String to String {
	public var GET = 'get';
	public var HEAD = 'head';
	public var POST = 'post';
	public var PUT = 'put';
	public var DELETE = 'delete';
	public var OPTIONS = 'options';
	public var PATCH = 'patch';
}