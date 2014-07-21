#include "EnemySprite.h"
#include "GameObject.h"
#include "GameScene.h"

extern GameObject* _gameObject;

using namespace cocos2d;

EnemySprite::EnemySprite() {}

EnemySprite::~EnemySprite() {}

EnemySprite* EnemySprite::createSprite()
{
    EnemySprite *sprite = new (std::nothrow) EnemySprite();
    
    if (sprite && sprite->initWithFile("enemystand.png"))
    {
        sprite->autorelease();
        sprite->initOptions();
        sprite->addEvents();
        return sprite;
    }
    
    CC_SAFE_DELETE(sprite);
    return nullptr;
}

void EnemySprite::initOptions()
{
    setTag((CCRANDOM_0_1() - 0.5)*300);
    
    auto body = cocos2d::PhysicsBody::createBox(cocos2d::Size(getContentSize().width, getContentSize().height));
    body->setTag(getTag());
    setPhysicsBody(body);
    
    Vect velocity((CCRANDOM_0_1() - 0.5)*300, (CCRANDOM_0_1() - 0.5)*300);
    getPhysicsBody()->setVelocity(velocity);
    getPhysicsBody()->setCategoryBitmask(0x04);    // 0100
    getPhysicsBody()->setContactTestBitmask(UINT_MAX);
    //getPhysicsBody()->setCollisionBitmask(0x06);   // 0110

    setPosition(200, 0 + getContentSize().height/2); // hardcoded for now
    //animate it
    cocos2d::Animation* anim1 = cocos2d::Animation::create();
    anim1->addSpriteFrameWithFile("enemystand.png");
    anim1->addSpriteFrameWithFile("enemymove1.png");
    anim1->addSpriteFrameWithFile("enemymove2.png");
    anim1->addSpriteFrameWithFile("enemymove3.png");
    anim1->addSpriteFrameWithFile("enemymove4.png");
    anim1->addSpriteFrameWithFile("enemymove5.png");
    anim1->addSpriteFrameWithFile("enemyjump.png");
  
    cocos2d::Animate* animation = cocos2d::Animate::create(anim1);
    animation->setDuration(0.2f);
    runAction(cocos2d::RepeatForever::create(animation));
    
    // move it
    cocos2d::MoveBy* act1 = cocos2d::MoveBy::create(1, cocos2d::Point(10, 0));
    runAction(cocos2d::RepeatForever::create(act1));
}

void EnemySprite::addEvents()
{
    auto contactListener = EventListenerPhysicsContact::create();
    
    contactListener->onContactBegin = std::bind(&EnemySprite::onContactBegin, this, std::placeholders::_1);
    cocos2d::Director::getInstance()->getEventDispatcher()->addEventListenerWithSceneGraphPriority(contactListener, this);
}

bool EnemySprite::onContactBegin(cocos2d::PhysicsContact& contact)
{
    PhysicsBody* a = contact.getShapeA()->getBody();
    PhysicsBody* b = contact.getShapeB()->getBody();
    
    if (a->getCategoryBitmask() != b->getCategoryBitmask())
    {
        removeFromParentAndCleanup(true);
    }
    
    return true;
}