#ifndef FES_BROADCAST_MSG_H
#define FES_BROADCAST_MSG_H

#include "nel/net/service.h"

///////////////////////////  NLNET::TUnifiedCallbackItem CallbackArray[]

/**
 *	"U2C"	����UDP�����ͻ��ˣ�������Ҫ�������͵���Ϣ����ʧ�ܼ��ʡ�
 */
void cbUDP2Client ( NLNET::CMessage& msgin, const std::string &serviceName, NLNET::TServiceId serviceId );

/**
 *	"T2C"	ת�����ͻ���
 */
void cbTransport2Client ( NLNET::CMessage& msgin, const std::string &serviceName, NLNET::TServiceId serviceId );

/**
 *	"ADD_MSG_BUF"	��������͵��ͻ��˵���Ϣ���棬���´οͻ�������ʱͬ�����ͻ���
 */
void cbAddMsgBuffer ( NLNET::CMessage& msgin, const std::string &serviceName, NLNET::TServiceId serviceId );

/**
 *	"SyncUserPLS"	ͬ���˺�ʹ�õ��߼�������
 */
void cbSyncUserLogicServer ( NLNET::CMessage& msgin, const std::string &serviceName, NLNET::TServiceId serviceId );

/**
 *	"SYNC_CLIENT_SESSION"	ͬ���ͻ������Session
 */
void cbSyncClientSession ( NLNET::CMessage& msgin, const std::string &serviceName, NLNET::TServiceId serviceId );

void cbGlobleChat ( NLNET::CMessage& msgin, const std::string &serviceName, NLNET::TServiceId serviceId );

#endif

