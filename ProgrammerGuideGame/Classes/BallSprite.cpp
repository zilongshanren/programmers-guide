#include "BallSprite.h"
#include "GameObject.h"
#include "GameScene.h"

extern GameObject* _gameObject;

using namespace cocos2d;

BallSprite::BallSprite() {}

BallSprite::~BallSprite() {}

BallSprite* BallSprite::createSprite(cocos2d::Point _inPoint)
{
    BallSprite *sprite = new (std::nothrow) BallSprite();
    
    if (sprite && sprite->initWithFile("ball.png"))
    {
        sprite->autorelease();
        sprite->initOptions(_inPoint);
        sprite->addEvents();
        return sprite;
    }
    
    CC_SAFE_DELETE(sprite);
    return nullptr;
}

void BallSprite::initOptions(cocos2d::Point _inPoint)
{
    setTag((CCRANDOM_0_1() - 0.5)*300);
    setName(std::to_string(getTag()));
    cocos2d::PhysicsBody* body = cocos2d::PhysicsBody::createCircle(getContentSize().width / 2);
    body->setTag(getTag());
    setPhysicsBody(body);
    setPosition(_inPoint);
    
    getPhysicsBody()->setCategoryBitmask(0x08);
    getPhysicsBody()->setContactTestBitmask(0x05);
}

void BallSprite::addEvents()
{
    auto contactListener = EventListenerPhysicsContact::create();
    contactListener->onContactBegin = std::bind(&BallSprite::onContactBegin, this, std::placeholders::_1);
    cocos2d::Director::getInstance()->getEventDispatcher()->addEventListenerWithSceneGraphPriority(contactListener, this);
}

bool BallSprite::onContactBegin(cocos2d::PhysicsContact& contact)
{
    PhysicsBody* a = contact.getShapeA()->getBody();
    PhysicsBody* b = contact.getShapeB()->getBody();
    
    if (getPhysicsBody() == a && b->getCategoryBitmask() == 0x01) // edge node
    {
        removeFromParentAndCleanup(true);
    }
    else if (getPhysicsBody() == a && b->getCategoryBitmask() == 0x04) // enemy
    {
        removeFromParentAndCleanup(true);
    }
    else
    {
        std::cout << "Ball touched something else" << std::endl;
    }
    
    return true;
}
