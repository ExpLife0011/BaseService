local CallbackService = class("CallbackService")

-- ��ʼ������
function CallbackService:Init()
	self._Connect      = 0;
end

-- �����˿�
function CallbackService:Listen( Host , Port )


end


-- ������·��Ϣ
function CallbackService:SendMessage( Name , ProtoBuffer )
	-- ����������� --
	if self._Connect ~= 1 then
		return;
	end
	
--[[

	-- ��䷢�ͻ����� --
	local NetMessage Message = LuaFramework.NetMessage.New();
	Message:WriteName( Name );
	Message:WriteBytes( Session:SerializeToString() );
	if Buffer ~= nil then
	Message:WriteBytes( Buffer );
	else
	Message:WriteInt32( 0 );
	end
	
	local Res = NetWorkHelper:SendMessage( Message );
	if Res == 0 then
	self._BufferIndex = self._BufferIndex + 1;
	else
	self:ForceConnectServer();
	end
	
	]]
end

return CallbackService

