#include "recv_login.h"
#include "sender_login.h"
#include <server_share/server_def.h>
#include <server_share/script_mgr.h>
#include <player_logic_service/player/player_mgr.h>
#include "../event_trigger.h"


using namespace NLNET;
using namespace DEF;
using namespace PLS;

void CRecvLogin::SendPlayerInfo( NLNET::CMessage& msg , TServiceId from  )
{
    DEF::PID pid = 0;
    DEF::UID uid = 0;

    msg.serial( pid );
    msg.serial( uid );


    CPlayer* pPlayer = PlayerMgr.findPlayer(pid);
    if ( pPlayer != NULL )
    {
        /// ��һ�о�Ҫ�����������������Ĵ��������Ʋ�����Ϣ��
        pPlayer->setConFES(GetSID(msg.session()));

        /// ������½�¼�;
        EventTrigger.Login(pPlayer);

        /// ֪ͨ�ͻ�����һ�����Ϣ;
		SenderLogin.SendPlayerInfo( msg.session(), pPlayer );
	}
	else
	{
		SendERR( PLAYER_RELOAD, uid , from, msg.session() );
	}
}


