local ServiceGameInfo = class("ServiceGameInfo")

-- ���캯��;
function ServiceGameInfo:ctor()
    self.type       = "";
	self.max        = 0;
	self.curr       = 0;
end

return ServiceGameInfo;