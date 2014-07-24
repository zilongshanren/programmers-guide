#include "GameScene.h"

#include "BallSprite.h"
#include "EnemySprite.h"
#include "GameObject.h"

extern GameObject* _gameObject;

cocos2d::Scene* GameScene::createScene()
{
    // create a scene with Physics
    cocos2d::Scene* scene = cocos2d::Scene::createWithPhysics();
    
    // uncomment to show debug mask around all bodies
    //scene->getPhysicsWorld()->setDebugDrawMask(PhysicsWorld::DEBUGDRAW_ALL);
    
    cocos2d::Size visibleSize = cocos2d::Director::getInstance()->getVisibleSize();
    
    // create the Physics body we will use
    cocos2d::PhysicsBody* body = cocos2d::PhysicsBody::createEdgeBox(visibleSize, cocos2d::PHYSICSBODY_MATERIAL_DEFAULT, 3);
    body->setContactTestBitmask(UINT_MAX);
    body->setCategoryBitmask(0x01);
    
    cocos2d::Node* edgeNode = cocos2d::Node::create();
    edgeNode->setPosition(cocos2d::Point((visibleSize.width / 2),(visibleSize.height / 2)));
	edgeNode->setPhysicsBody(body);
	scene->addChild(edgeNode);
    
    GameScene* layer = GameScene::create();
    layer->setPhyWorld(scene->getPhysicsWorld());
    layer->scheduleUpdate();
    layer->schedule(schedule_selector(GameScene::addEnemyToLayer), 10);
    scene->addChild(layer);
    
    return scene;
}

bool GameScene::init()
{
    if ( !Layer::init() )
    {
        return false;
    }
    
    cocos2d::Point origin = cocos2d::Director::getInstance()->getVisibleOrigin();

    // score
    scoreLabel = cocos2d::Label::createWithTTF("0", "fonts/Marker Felt.ttf", 32);
    addChild(scoreLabel);
    scoreLabel->setPosition(cocos2d::Point(getContentSize().width - 50, getContentSize().height - 50));
    
    // event listener
    cocos2d::EventListenerTouchOneByOne* touchListener = cocos2d::EventListenerTouchOneByOne::create();
    touchListener->onTouchBegan = CC_CALLBACK_2(GameScene::onTouchBegan, this);
    touchListener->onTouchEnded = CC_CALLBACK_2(GameScene::onTouchEnded, this);
    _eventDispatcher->addEventListenerWithSceneGraphPriority(touchListener, this);
    
    return true;
}

bool GameScene::onTouchBegan(cocos2d::Touch* touch, cocos2d::Event*unused_event)
{
    return true;
}

void GameScene::onTouchEnded(cocos2d::Touch* touch, cocos2d::Event*unused_event)
{
    cocos2d::Point location = touch->getLocation();
    addNewSpriteAtPosition(location);
}

void GameScene::addNewSpriteAtPosition(cocos2d::Point p)
{
    BallSprite* sprite = BallSprite::createSprite(p);
	this->addChild(sprite);
}

void GameScene::update(float dt)
{
    if (getAddEnemy())
    {
        EnemySprite* e = EnemySprite::createSprite();
        this->addChild(e);
        
        setAddEnemy(false);
    }
}

void GameScene::addEnemyToLayer(float dt)
{
    setAddEnemy(true);
}