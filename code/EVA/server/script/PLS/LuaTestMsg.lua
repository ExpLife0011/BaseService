--========================================================= 
-- ��Ϣע�����
--=========================================================
local LuaTestMsg = class("LuaTestMsg")

-- ���캯��;
function LuaTestMsg:ctor( Data )
	self:Init();
end

function LuaTestMsg:LuaTestCB( proto_buf )

	local msg_session = protobuf.decode("MsgSession" , proto_buf)
	
	print(msg_session.check);
	print(msg_session.session);
	print(msg_session.index);
	
end

function LuaTestMsg:Init()
	
	self._EventRegister = EventRegister.new();
	self._EventRegister:RegisterEvent( "LuaTestCB",  self, self.LuaTestCB );
end

--�ͷź���
function LuaTestMsg:OnRelease()
    self._EventRegister:UnRegisterAllEvent();
	
	
	print("LuaTestMsg:OnRelease");
end


return LuaTestMsg;