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
	
    print("MsgLogin:AuthOkCB");
	print(proto_authok.ext640);
	print(proto_authok.ext641);
	


	
end




--�ͷź���
function MsgLogin:OnRelease()
    self._EventRegister:UnRegisterAllEvent();
end


return MsgLogin;