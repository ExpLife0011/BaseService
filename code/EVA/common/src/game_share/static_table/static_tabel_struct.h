#ifndef static_tabel_struct_h__
#define static_tabel_struct_h__
#include <vector>
#include <nel/misc/sstring.h>

///  ���ֹ�ʽ
struct Formula
{
    NLMISC::CSString    rmb2money;
    NLMISC::CSString    rmb2soul;
};

typedef std::map<uint32/*Ʒ��*/,uint32/*��Ҫ������ʱ��*/>     TGrowTime;

struct GameConfig
{
    TGrowTime           grow_time;
    Formula             formula;
};


#endif // static_tabel_struct_h__
