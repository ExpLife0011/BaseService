local ClientMgr = singleton("ClientMgr")

-- ��ʼ������
function ClientMgr:Init()
	self._Session      = 0;
	self._Seed         = 0;
	self._Connect      = 0;
	self._BufferIndex  = 0;
end


return ClientMgr
