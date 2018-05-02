local FSMDouDiZhu = class("FSMDouDiZhu")

-- ���캯��;
function FSMDouDiZhu:ctor()
    
    self._GameFSM 			= StateMachine:new();

    self._GameFSM:setup_state({
        events = 
		{
            {name = "TDDZStateWait" 			        },  -- �ȴ���ʼ
			{name = "TDDZStateCheckStartGame"		    },  -- ����Ƿ���Կ�ʼ��Ϸ
			{name = "TDDZStateSelectMingCardStart" 	    },  -- ѡ�����ƿ�ʼ�׶�
			{name = "TDDZStateStartGame" 			    },  -- ��ʼ��Ϸ
            {name = "TDDZStateSendCard" 		    	},  -- ��������
            {name = "TDDZStateQiangDiZhu" 		    	},  -- �������׶�
            {name = "TDDZStateSelectAddTimes" 		    },  -- ѡ��ӱ��׶�
            {name = "TDDZStateAction" 		    	    },  -- ������ɻ
            {name = "TDDZStateOutCard" 		    	    },  -- ����״̬
            {name = "TDDZStateShowDown" 		    	},  -- ��Ϸ����
            {name = "TDDZStateRelieveRoom" 		    	},  -- ��ɢ����
        },
        callbacks =
		{
			onTDDZStateWait   		        = handler(self, self.DoWait),
			onTDDZStateCheckStartGame  	    = handler(self, self.DoCheckStartGame),
            onTDDZStateSelectMingCardStart  = handler(self, self.DoSelectMingCardStart),
            onTDDZStateStartGame  	        = handler(self, self.DoStartGame),
            onTDDZStateSendCard  	        = handler(self, self.DoSendCard),
            onTDDZStateQiangDiZhu  	        = handler(self, self.DoQiangDiZhu),
            onTDDZStateSelectAddTimes  	    = handler(self, self.DoSelectAddTimes),
            onTDDZStateAction  	            = handler(self, self.DoAction),
            onTDDZStateOutCard  	        = handler(self, self.DoOutCard),
            onTDDZStateShowDown  	        = handler(self, self.DoShowDown),
            onTDDZStateRelieveRoom  	    = handler(self, self.DoRelieveRoom),
		}
    })
end

function FSMDouDiZhu:TickUpdate()
    self._GameFSM:do_event( self._GameFSM:get_state() );
end

function FSMDouDiZhu:SwitchState( event, ... )
    self._GameFSM:do_event( event, ... );
end

function FSMDouDiZhu:DoWait( event )
    print( "FSMClass:DoWait" .. event.args[1] );
end

function FSMDouDiZhu:DoCheckStartGame( event )
    print( "FSMClass:DoCheckStartGame".. event.args[1] );
end

function FSMDouDiZhu:DoSelectMingCardStart( event )
    print( "FSMClass:DoSelectMingCardStart".. event.args[1] );
end

function FSMDouDiZhu:DoStartGame( event )
    print( "FSMClass:DoStartGame".. event.args[1] );
end

function FSMDouDiZhu:DoSendCard( event )
    print( "FSMClass:DoSendCard".. event.args[1] );
end

function FSMDouDiZhu:DoQiangDiZhu( event )
    print( "FSMClass:DoQiangDiZhu".. event.args[1] );
end

function FSMDouDiZhu:DoSelectAddTimes( event )
    print( "FSMClass:DoSelectAddTimes".. event.args[1] );
end

function FSMDouDiZhu:DoAction( event )
    print( "FSMClass:DoAction".. event.args[1] );
end

function FSMDouDiZhu:DoOutCard( event )
    print( "FSMClass:DoOutCard".. event.args[1] );
end

function FSMDouDiZhu:DoShowDown( event )
    print( "FSMClass:DoShowDown".. event.args[1] );
end

function FSMDouDiZhu:DoRelieveRoom( event )
    print( "FSMClass:DoRelieveRoom".. event.args[1] );
end

return FSMDouDiZhu;

