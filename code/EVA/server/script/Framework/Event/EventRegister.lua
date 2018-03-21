--========================================================= 
-- ��Ϣע�����
--=========================================================
local EventRegister = class("EventRegister");

-- ���캯��
function EventRegister:ctor()
    self._EventCallBackTable = {};        -- �¼��ص���
end


-- ע��ĳ���¼�
function EventRegister:RegisterEvent(Name, Obj, Func)
	if (nil == Name) then
		logError("RegisterEvent Name == nil!")
		return;
	end
	
    local Handler = handler(Obj, Func);
    local EventTable = self:GetEventRegisterTable(Name);
    if (nil ~= EventTable) then
        local idx = table.getn(EventTable);
        EventTable[idx + 1] = Handler;
    else
        local v = {};
        v[1] = Handler;
        self._EventCallBackTable[Name] = v;
    end
	EventController.Instance():RegisterEvent(Name, Handler);  
end

-- ��ȡ�¼�ע���
function EventRegister:GetEventRegisterTable(Name)
	for k,v in pairs(self._EventCallBackTable) do
        if(k == Name) then
            return v;
        end
    end 
    return nil;
end

-- ɾ�������¼�
function EventRegister:UnRegisterAllEvent()
    for k,v in pairs(self._EventCallBackTable) do
        for i = 1, #v do
	        EventController.Instance():RemoveEvent(k, v[i]);
        end
    end   
    self._EventCallBackTable = {};
end


return EventRegister;