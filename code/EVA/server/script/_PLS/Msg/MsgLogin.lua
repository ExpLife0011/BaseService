--========================================================= 
-- ��Ϣע�����
--=========================================================
local MsgLogin = class("MsgLogin")

-- ���캯��;
function MsgLogin:ctor( Data )
	self._EventRegister = EventRegister.new();
	self._EventRegister:RegisterEvent( "AuthOk",  self, self.AuthOkCB );
end

function MsgLogin:AuthOkCB( msg_from, proto_buf )

	local proto_authok = protobuf.decode("MsgData" , proto_buf)
	
	print(proto_authok.ext64_0);
	print(proto_authok.ext64_1);
	


	
end




--�ͷź���
function MsgLogin:OnRelease()
    self._EventRegister:UnRegisterAllEvent();
end


return MsgLogin;