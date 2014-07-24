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
    
    cocos2d::PhysicsBody* body = cocos2d::PhysicsBody::createBox(cocos2d::Size(getContentSize().width, getContentSize().height));
    body->setTag(getTag());
    setPhysicsBody(body);
    
    Vect velocity((CCRANDOM_0_1() - 0.5)*300, (CCRANDOM_0_1() - 0.5)*300);
    getPhysicsBody()->setVelocity(velocity);
    getPhysicsBody()->setCategoryBitmask(0x04);
    getPhysicsBody()->setContactTestBitmask(0x08);

    setPosition(200, 0 + getContentSize().height/2); // hardcoded for now
    
    //animate it
    cocos2d::Vector<cocos2d::SpriteFrame*> animFrames;
    animFrames.reserve(7);
    animFrames.pushBack(cocos2d::SpriteFrame::create("enemystand.png", cocos2d::Rect(0,0, 131,162)));
    animFrames.pushBack(cocos2d::SpriteFrame::create("enemymove1.png", cocos2d::Rect(0,0, 131,162)));
    animFrames.pushBack(cocos2d::SpriteFrame::create("enemymove2.png", cocos2d::Rect(0,0, 131,162)));
    animFrames.pushBack(cocos2d::SpriteFrame::create("enemymove3.png", cocos2d::Rect(0,0, 131,162)));
    animFrames.pushBack(cocos2d::SpriteFrame::create("enemymove4.png", cocos2d::Rect(0,0, 131,162)));
    animFrames.pushBack(cocos2d::SpriteFrame::create("enemymove5.png", cocos2d::Rect(0,0, 131,162)));
    animFrames.pushBack(cocos2d::SpriteFrame::create("enemyjump.png", cocos2d::Rect(0,0, 131,162)));
    
    cocos2d::Animation* animation = cocos2d::Animation::createWithSpriteFrames(animFrames, 0.1f);
    cocos2d::Animate* animate = cocos2d::Animate::create(animation);
    runAction(cocos2d::RepeatForever::create(animate));
    
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
    
    if (getPhysicsBody() == b && a->getCategoryBitmask() == 0x08) // ball
    {
        removeFromParentAndCleanup(true);
    }
    else if (getPhysicsBody() == a && b->getCategoryBitmask() == 0x08)
    {
        removeFromParentAndCleanup(true);
    }
    
    return true;
}