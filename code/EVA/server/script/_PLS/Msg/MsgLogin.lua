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

	local pb_authok = protobuf.decode("MsgData" , proto_buf)
	
    print("MsgLogin:AuthOkCB");
	print(pb_authok.ext640);
	print(pb_authok.ext641);
	


	
end




--�ͷź���
function MsgLogin:OnRelease()
    self._EventRegister:UnRegisterAllEvent();
end


return MsgLogin;