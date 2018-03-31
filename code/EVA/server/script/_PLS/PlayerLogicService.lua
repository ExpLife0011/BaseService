PlayerLogicService = {}

function PlayerLogicService:Init()
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


function PlayerLogicService:Connection( service_id, service_name )
	print("PlayerLogicService:Connection:"..service_name.." sid:"..service_id);
end

function PlayerLogicService:DisConnection( service_id, service_name )
	print("PlayerLogicService:DisConnection"..service_name.." sid:"..service_id);
end

--	�ͷź���
function PlayerLogicService:OnRelease()
    self._EventRegister:UnRegisterAllEvent();
end

return PlayerLogicService

