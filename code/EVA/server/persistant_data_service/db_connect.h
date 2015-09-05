#ifndef PDS_DB_CONNECT_H
#define PDS_DB_CONNECT_H

#include <nel/misc/singleton.h>
#include <server_share/db_threads/db_thread.h>

enum TDBConnectThreads
{
    ThreadLoadPlayer,           /// ���ؽ�ɫ�߳�;

    ThreadPlayerInfo,           /// ��ɫ����;         ( t_playerinfo );
    
    ThreadsMax
};

enum TPDSDBType
{
    DB_Player,
    DB_EGS_Player,
};

class CMysqlConnect : public NLMISC::CSingleton<CMysqlConnect>
{
public:

    CMysqlConnect();

    // �������ݿ�;
    void  init_db_connect( char const* _host ,
                           char const* _user ,
                           char const* _pwd  ,
                           char const* _db   ,
                           short       _port );

    // �������ݿ��߳�;
    bool  start_db_threads( void );
    // �ر����ݿ��߳�;
    void  close_db_threads( void );

    // ����DBԤ����洢����;
    bool db_pre_treatment( void );
    // ����DB����洢����;
    bool db_after_treatment( void );

    // �������߳�����;
    void  frame_move( void );

    // ��ȡ���ݿ���߳�;
    nl::db_threads& GetDBThread( TDBConnectThreads thread_enum )    { return m_DBThreads[thread_enum]; }

private:

    std::vector<nl::db_threads>    m_DBThreads;
};

#define MysqlConnect CMysqlConnect::instance()
#define SelectThread CMysqlConnect::instance().GetDBThread

#endif // PDS_DB_CONNECT_H
