#ifndef db_worker_h__
#define db_worker_h__

#include <server_share/db_threads/sql_worker.h>

enum default_stmt
{
    stmt_pre_treatment,
    stmt_after_treatment,

    // ��ɫ����;
    stmt_insert_player_data = 20,
    stmt_update_player_data,
    stmt_delete_player_data,
    stmt_page_player_info,

    // ��ѯΨһֵ;
    stmt_query_player_maxid = 140,


};

// ��ѯΨһֵ;
bool init_alone_value_worker( nl::sql_worker* _worker );
// ��ɫ����;
bool  init_player_worker( nl::sql_worker* _worker );
// ���ؽ�ɫ;
bool  init_load_role( nl::sql_worker* _worker );




#endif // db_worker_h__
