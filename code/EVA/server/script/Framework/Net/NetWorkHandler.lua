NetWorkHandler = {};
local this = NetWorkHandler;

-- �յ�������Ϣ����C++����
function NetWorkHandler.OnMessage( msg_type, proto_buf )	
	EventController.Instance():TriggerEvent( msg_type, proto_buf );
end


function NetWorkHandler.OnError(state)

end

