local PlayerHalper = class("PlayerHalper")

-- ���캯��;
function PlayerHalper:ctor()
    self.PlayerDataHalper      = PlayerDataHalper:new();


    self.UID     = 0;
    self.FES     = nil;
end




return PlayerHalper;