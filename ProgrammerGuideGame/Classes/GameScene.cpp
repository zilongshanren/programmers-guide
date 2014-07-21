#include "GameScene.h"

#include "BallSprite.h"
#include "EnemySprite.h"
#include "GameObject.h"

extern GameObject* _gameObject;

USING_NS_CC;

Scene* GameScene::createScene()
{
    auto scene = Scene::createWithPhysics();
    scene->getPhysicsWorld()->setDebugDrawMask(PhysicsWorld::DEBUGDRAW_ALL);
    
    Size visibleSize = Director::getInstance()->getVisibleSize();
    
    auto body = PhysicsBody::createEdgeBox(visibleSize, PHYSICSBODY_MATERIAL_DEFAULT, 3);
    auto edgeNode = Node::create();
    edgeNode->setPosition(Point(visibleSize.width/2,visibleSize.height/2));
	edgeNode->setPhysicsBody(body);
	scene->addChild(edgeNode);
    
    auto layer = GameScene::create();
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
    
    Size visibleSize = Director::getInstance()->getVisibleSize();
    Point origin = Director::getInstance()->getVisibleOrigin();

    auto touchListener = EventListenerTouchOneByOne::create();
    touchListener->onTouchBegan = CC_CALLBACK_2(GameScene::onTouchBegan, this);
    touchListener->onTouchEnded = CC_CALLBACK_2(GameScene::onTouchEnded, this);
    _eventDispatcher->addEventListenerWithSceneGraphPriority(touchListener, this);
    
    return true;
}

bool GameScene::onTouchBegan(Touch *touch, Event *unused_event)
{
    return true;
}

void GameScene::onTouchEnded(Touch *touch, Event *unused_event)
{
    auto location = touch->getLocation();
    addNewSpriteAtPosition(location);
}

void GameScene::addNewSpriteAtPosition(Point p)
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
        
        _gameObject->Instance()->getEnemies().push_back(e);
        
        setAddEnemy(false);
        
        //std::cout << "ememy added - # enemies now: " << _gameObject->Instance()->getEnemies().size() << std::endl;
    }
}

void GameScene::addEnemyToLayer(float dt)
{
    setAddEnemy(true);
}