#ifndef EVA_PLS_DATA_SYNC_H
#define EVA_PLS_DATA_SYNC_H

#include <game_share/game_def.h>
#include <game_share/proto_msg/msg_s2c.pb.h>
#include <nel/net/unified_network.h>
#include <nel/misc/singleton.h>

class MsgItemCont;

namespace PLS
{
    class CPlayer;

    class CDataSyncMgr : public NLMISC::CSingleton<CDataSyncMgr>
    {
    public:

        MsgSyncDataCheckSum GetCheckSum( CPlayer* pPlayer );

        ///  ͬ���µ�У��͵��ͻ���
        void CheckSumToClientBuffer( CPlayer* pPlayer );

        
		///  ͬ�������ݷֿ鵽�ͻ���
        void SyncToClientPlayerInfo( DEF::PID pid );

        

    private:
        
        DEF::CHECK_SUM  CheckSum( google::protobuf::Message* pMessage );

    };
}

#define  DataSyncMgr  PLS::CDataSyncMgr::instance()

#endif // EVA_PLS_DATA_SYNC_H


