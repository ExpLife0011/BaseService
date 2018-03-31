local CallbackService = class("CallbackService")

function CallbackService:ctor()
	self._EventRegister = EventRegister.new();
	
	self._EventRegister:RegisterEvent( "FESConnection",         self, self.Connection );
	self._EventRegister:RegisterEvent( "FESDisConnection",      self, self.DisConnection );
    self._EventRegister:RegisterEvent( "PLSConnection",         self, self.Connection );
	self._EventRegister:RegisterEvent( "PLSDisConnection",      self, self.DisConnection );
    
    -- ע�����������������Ļص�
    ServerNet.SetConnectionCallback("FES");
    ServerNet.SetDisConnectionCallback("FES");
    
    ServerNet.SetConnectionCallback("PLS");
    ServerNet.SetDisConnectionCallback("PLS");
    
end

function CallbackService:Send( service_id, msg_type, proto_type, proto_msg )

	code = protobuf.encode(proto_type, proto_msg)
	len  = string.len(code);
	
	msg = { service_id, msg_type, len };
	ServerNet.Send( code, msg );

end

function CallbackService:Broadcast( service_name, msg_type, proto_type, proto_msg )

	code = protobuf.encode(proto_type, proto_msg)
	len  = string.len(code);
	
	msg = { service_name, msg_type, len };
	ServerNet.Broadcast( code, msg );

end

function CallbackService:Connection( service_id, service_name )
	print("CallbackService:Connection:"..service_name.." sid:"..service_id);
end

function CallbackService:DisConnection( service_id, service_name )
	print("CallbackService:DisConnection"..service_name.." sid:"..service_id);
end

--	�ͷź���
function CallbackService:OnRelease()
    self._EventRegister:UnRegisterAllEvent();
end

return CallbackService

