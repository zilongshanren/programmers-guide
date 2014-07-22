#include "BallSprite.h"
#include "GameObject.h"
#include "GameScene.h"
//#include "GameLayer.h"

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
    //getPhysicsBody()->setCollisionBitmask(0x06);
}

void BallSprite::addEvents()
{
    auto listener = cocos2d::EventListenerTouchOneByOne::create();
    listener->setSwallowTouches(true);
    listener->onTouchBegan = [&](cocos2d::Touch* touch, cocos2d::Event* event)
    {
        cocos2d::Vec2 p = touch->getLocation();
        cocos2d::Rect rect = this->getBoundingBox();
        
        if(rect.containsPoint(p))
        {
            return true; // to indicate that we have consumed it.
        }
        
        return false; // we did not consume this event, pass thru.
    };
    
    listener->onTouchEnded = [=](cocos2d::Touch* touch, cocos2d::Event* event)
    {
        BallSprite::touchEvent(touch);
    };
    
    cocos2d::Director::getInstance()->getEventDispatcher()->addEventListenerWithSceneGraphPriority(listener, this);
    
    auto contactListener = EventListenerPhysicsContact::create();
    contactListener->onContactBegin = std::bind(&BallSprite::onContactBegin, this, std::placeholders::_1);
    cocos2d::Director::getInstance()->getEventDispatcher()->addEventListenerWithSceneGraphPriority(contactListener, this);
}

void BallSprite::touchEvent(cocos2d::Touch* touch)
{
    std::cout << "touched ball" << std::endl;
}

bool BallSprite::onContactBegin(cocos2d::PhysicsContact& contact)
{
    //std::cout << "Ball Contact Begin" << std::endl;
    
    PhysicsBody* a = contact.getShapeA()->getBody();
    PhysicsBody* b = contact.getShapeB()->getBody();
    
    if (getPhysicsBody() == a && b->getCategoryBitmask() == 0x01) // edge node
    {
        std::cout << "Ball touched edge node" << std::endl;
        removeFromParentAndCleanup(true);
        
    }
    else if (getPhysicsBody() == a && b->getCategoryBitmask() == 0x04) // enemy
    {
        std::cout << "Ball touched enemy" << std::endl;
        
        //auto children = utils::findChildren(getParent(), getName());
        //getParent()->removeChild(this);
        
        removeFromParentAndCleanup(true);
    }
    else
    {
        std::cout << "Ball touched something else" << std::endl;
    }
    
    return true;
}
