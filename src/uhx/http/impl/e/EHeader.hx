package uhx.http.impl.e;

/**
 * ...
 * @author Skial Bainn
 */

@:enum abstract EHeader(String) from String to String {
	public var Access_Control_Allow_Origin = 'Access_Control_Allow_Origin';
	public var Accept = 'Accept';
	public var Accept_Charset = 'Accept_Charset';
	public var Accept_Encoding = 'Accept_Encoding';
	public var Accept_Language = 'Accept_Language';
	public var Accept_Datetime = 'Accept_Datetime';
	public var Accept_Ranges = 'Accept_Ranges';
	public var Age = 'Age';
	public var Allow = 'Allow';
	public var Authorization = 'Authorization';
	public var Cache_Control = 'Cache_Control';
	public var Connection = 'Connection';
	public var Cookie = 'Cookie';
	public var Content_Encoding = 'Content_Encoding';
	public var Content_Language = 'Content_Language';
	public var Content_Length = 'Content_Length';
	public var Content_Location = 'Content_Location';
	public var Content_MD5 = 'Content_MD5';
	public var Content_Disposition = 'Content_Disposition';
	public var Content_Range = 'Content_Range';
	public var Content_Type = 'Content_Type';
	public var Date = 'Date';
	public var Expect = 'Expect';
	public var ETag = 'ETag';
	public var Expires = 'Expires';
	public var From = 'From';
	public var Host = 'Host';
	public var If_Match = 'If_Match';
	public var If_Modified_Since = 'If_Modified_Since';
	public var If_None_Match = 'If_None_Match';
	public var If_Range = 'If_Range';
	public var If_Unmodified_Since = 'If_Unmodified_Since';
	public var Last_Modified = 'Last_Modified';
	public var Link = 'Link';
	public var Location = 'Location';
	public var Max_Forwards = 'Max_Forwards';
	public var P3P = 'P3P';
	public var Pragma = 'Pragma';
	public var Proxy_Authorization = 'Proxy_Authorization';
	public var Range = 'Range';
	public var Refresh = 'Refresh';
	public var Referer = 'Referer';
	public var Retry_After = 'Retry_After';
	public var Server = 'Server';
	public var Set_Cookie = 'Set_Cookie';
	public var Status = 'Status';
	public var Strict_Transport_Security = 'Strict_Transport_Security';
	public var TE = 'TE';
	public var Trailer = 'Trailer';
	public var Transfer_Encoding = 'Transfer_Encoding';
	public var Upgrade = 'Upgrade';
	public var User_Agent = 'User_Agent';
	public var Vary = 'Vary';
	public var Via = 'Via';
	public var Warning = 'Warning';
	public var WWW_Authenticate = 'WWW_Authenticate';
}