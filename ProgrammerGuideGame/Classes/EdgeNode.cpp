#include "EdgeNode.h"
#include "GameObject.h"
#include "GameScene.h"
//#include "GameLayer.h"

extern GameObject* _gameObject;

using namespace cocos2d;

EdgeNode::EdgeNode() {}

EdgeNode::~EdgeNode() {}

EdgeNode* EdgeNode::createNode(cocos2d::Size visibleSize)
{
    EdgeNode* edge = new (std::nothrow) EdgeNode();
    edge->create();
    edge->initOptions(visibleSize);
    return edge;
}

void EdgeNode::initOptions(cocos2d::Size visibleSize)
{
    setPosition(cocos2d::Point(visibleSize.width/2,visibleSize.height/2));
    
    body = cocos2d::PhysicsBody::createEdgeBox(visibleSize, cocos2d::PHYSICSBODY_MATERIAL_DEFAULT, 3);
	setPhysicsBody(body);
    getPhysicsBody()->setCategoryBitmask(0x01);    // 0100
    getPhysicsBody()->setContactTestBitmask(UINT_MAX);
}