--========================================================= 
-- ��Ϣע�����
--=========================================================
local ReciveClientMsg = class("ReciveClientMsg")

-- ���캯��;
function ReciveClientMsg:ctor( Data )
	self:Init();
end

function ReciveClientMsg:LuaTestCB( msg_from, proto_buf )

	local msg_session = protobuf.decode("MsgSession" , proto_buf)
	
	print(msg_session.check);
	print(msg_session.session);
	print(msg_session.index);
	
	code = protobuf.encode("MsgSession", msg_session)
	len  = string.len(code);
	
	msg = { "PLS", "LTst", len };
	ServerNet.Broadcast( code, msg );
	
end

function ReciveClientMsg:Init()
	
	self._EventRegister = EventRegister.new();
	self._EventRegister:RegisterEvent( "TEST_MSG",  self, self.LuaTestCB );
end

--�ͷź���
function ReciveClientMsg:OnRelease()
    self._EventRegister:UnRegisterAllEvent();
end


return ReciveClientMsg;