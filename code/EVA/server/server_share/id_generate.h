#ifndef SERVER_SHARED_ID_GENERATE_H
#define SERVER_SHARED_ID_GENERATE_H

#include <game_share/game_def.h>

/**
 *  ID������  
 *    ����52λGUID  lua����
 *    TPlaceHolder  ��ʾռλ
 *    ƴ�ӷ�����ID��   64-53   52-PlaceHolderService  PlaceHolderIncreaseID  PlaceHolderRegion-0
 *    ��ƴ�ӷ�����ID:  64-53   52-                    PlaceHolderIncreaseID  PlaceHolderRegion-0
 *
 *    
 * \author li9chuan@qq.com
 * \date 2013
 */

class CIDGenerate
{
public:

    CIDGenerate();

    /**
    *  ID���ɳ�ʼ������
    *  @param region ��Ϸ����ID��
    *  @param service_id ����ID��
    *  @param current_id ��ǰ�Ѿ��ﵽ�����ID�� ֻ���ܱ�m_CurrentID������֡�
    */
	///@{
	void init( uint region, uint8 service_id, uint64 current_id );
    void init( uint region, uint64 current_id );
    ///@}

	inline uint64 Generate()
	{
		++m_CurrentID;
		return ( m_CurrentID << PlaceHolderRegion ) | m_BaseCode;
	}

	//uint64 GetID( uint64 idx )
	//{
	//	return idx | m_BaseCode;
	//}

    inline uint64 GetIDX(uint64 id)	{	return id>>PlaceHolderRegion & 0xfffffffffLL;	}

private:
	uint64    m_BaseCode;
	uint64    m_CurrentID;

    ///   10λ��ID   6λ������ID   36λ����ID
    enum TPlaceHolder
    {
        PlaceHolderService      = 6,
        PlaceHolderRegion       = 10,
        PlaceHolderIncreaseID   = 36, 
    };
};

#endif
