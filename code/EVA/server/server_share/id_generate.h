#ifndef SERVER_SHARED_ID_GENERATE_H
#define SERVER_SHARED_ID_GENERATE_H

#include <server_share/game_def.h>
#include <server_share/bin_luabind/Public.hpp>

/**
 *  ID������  
 *    ����ȫ��GUID
 *
 *    0                   1                   2                   3
 *    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9
 *   +-----------------------+---------------+---------------------------------------+
 *          region_id           service_id                  inc_id
 *           len(10)              len(6)                    len(48)
 *    
 *
 * \author li9chuan@qq.com
 * \date 2013
 */

class CIDGenerate
{
    DECLARE_SCRIPT_CLASS();
public:

    CIDGenerate();

    /**
    *  ID���ɳ�ʼ������
    *  @param region_id ��Ϸ����ID��
    *  @param service_id ����ID��
    *  @param current_id ��ǰ�Ѿ��ﵽ�����ID�� ֻ���ܱ�m_CurrentID������֡�
    */
	///@{
	void init( uint32 region_id, uint32 service_id, uint64 current_id );
    ///@}

	inline uint64 Generate()
	{
		++m_CurrentID;
		return m_CurrentID | m_BaseCode;
	}

private:
	uint64    m_BaseCode;
	uint64    m_CurrentID;

    ///   10λ��ID   6λ������ID   48λ����ID
    enum TPlaceHolder
    {
        PlaceHolderService      = 6,
        PlaceHolderRegion       = 10,
        PlaceHolderIncreaseID   = 48, 
    };
};

#endif
