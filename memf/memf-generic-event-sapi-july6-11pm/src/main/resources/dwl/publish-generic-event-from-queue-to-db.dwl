%dw 2.0
import * from dw::core::Binaries
output application/json
---
{ 
	event_id: payload.GenericEvent.EventId,
	App_name : payload.GenericEvent.AppName,
	comp_name : payload.GenericEvent.flowName,
	severity: payload.GenericEvent.Severity,
	corrl_id: payload.GenericEvent.transactionId,
	event_category: payload.GenericEvent.EventCategory,
	event_code : payload.GenericEvent.EVENT_CODE,
	//system_info:payload.GenericEvent.EnvironmentDetails.SYSTEM_INFO.ServerVersion,
	  system_info: (write(payload.GenericEvent.EnvironmentDetails,"application/xml",{ "writeDeclaration": false })),
	server_instance: payload.GenericEvent.EnvironmentDetails.SYSTEM_INFO.ServerInstance,
	payload_header: toBase64(write (payload.GenericEvent.PayloadHeader.pheader,"application/xml")),
	//payload_body: payload.GenericEvent.PayloadHeader.Orginalpayload,
	payload_body: toBase64(write( payload.GenericEvent.PayloadHeader.Orginalpayload,"application/xml")),
	trackingId: payload.GenericEvent.TRACKING_ID,
	event_description:payload.GenericEvent.EventDescription,
	comp_type : payload.GenericEvent.ComponentType,
	payload_type :payload.GenericEvent.PayloadHeader.pheader.PayloadType,
	created_ts : payload.GenericEvent.timestamp,
	msg_id : payload.GenericEvent.msgId,
	fn_filename: payload.GenericEvent.FnFilename,
	fn_hostname: payload.GenericEvent.FnHostname,
	replay_flag_count:payload.GenericEvent.ReplayFlagcount,
	region: payload.GenericEvent.Region,
	site_order_id: payload.GenericEvent.SiteOrderId,
	status: payload.GenericEvent.status,
	replay_flag: payload.GenericEvent.replayFlag,
	comment: payload.GenericEvent.description	
}