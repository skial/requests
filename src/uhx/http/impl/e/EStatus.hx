package uhx.http.impl.e;

/**
 * ...
 * @author Skial Bainn
 */

@:enum abstract EStatus(Int) from Int to Int {
	public var Continue = 100;
	public var Switching_Protocols = 101;
	public var Processing = 102;
	
	public var OK = 200;
	public var Created = 201;
	public var Accepted = 202;
	public var Non_Authorithative_Information = 203;
	public var No_Content = 204;
	public var Reset_Content = 205;
	public var Partial_Content = 206;
	public var Multi_Status = 207;
	public var Already_Reported = 208;
	public var Low_on_Storage_Space = 250;
	public var IM_Used = 226;
	
	public var Multiple_Choices = 300;
	public var Moved_Permanently = 301;
	public var Found = 302;
	public var See_Other = 303;
	public var Not_Modified = 304;
	public var Use_Proxy = 305;
	public var Switch_Proxy = 306;
	public var Temporary_Redirect = 307;
	public var Permanent_Redirect = 308;
	
	public var Bad_Request = 400;
	public var Unauthorized = 401;
	public var Payment_Required = 402;
	public var Forbidden = 403;
	public var Not_Found = 404;
	public var Method_Not_Allowed = 405;
	public var Not_Acceptable = 406;
	public var Proxy_Authentication_Required = 407;
	public var Request_Timeout = 408;
	public var Conflict = 409;
	public var Gone = 410;
	public var Length_Required = 411;
	public var Precondition_Failed = 412;
	public var Request_Entity_Too_Large = 413;
	public var Request_URI_Too_Long = 414;
	public var Unsupported_Media_Type = 415;
	public var Requested_Range_Not_Satisfiable = 416;
	public var Expectation_Failed = 417;
	public var Unprocessable_Entity = 422;
	public var Locked = 423;
	public var Failed_Dependency = 424;
	public var Method_Failure = 424;
	public var Unordered_Collection = 425;
	public var Upgrade_Required = 426;
	public var Too_Many_Requests = 429;
	public var Request_Header_Fields_Too_Large = 431;
	public var No_Response = 444;
	public var Retry_With = 449;
	
	public var Internal_Server_Error = 500;
	public var Not_Implemented = 501;
	public var Bad_Gateway = 502;
	public var Service_Unavailable = 503;
	public var Gateway_Timeout = 504;
	public var HTTP_Version_Not_Supported = 505;
	public var Variant_Also_Negotiates = 506;
	public var Insufficient_Storage = 507;
	public var Loop_Detected = 508;
	public var Bandwidth_Limit_Exceeded = 509;
	public var Not_Extended = 510;
	public var Network_Authentication_Required = 511;
	
}