#include "MainScene.h"

#include "GameObject.h"
#include "GameScene.h"

extern GameObject* _gameObject;

MainScene::MainScene()
{
    // get the display size of the device we are using
    cocos2d::Size visibleSize = cocos2d::Director::getInstance()->getVisibleSize();
    cocos2d::Vec2 origin = cocos2d::Director::getInstance()->getVisibleOrigin();

    // scene
    scene = cocos2d::Scene::createWithSize(visibleSize);
    
    // layer
    auto layer = cocos2d::LayerColor::create(cocos2d::Color4B(102, 102, 102, 102), visibleSize.width, visibleSize.height);
    
    // game title
    cocos2d::Label* title = cocos2d::Label::createWithTTF("Alien Attack!", "fonts/Marker Felt.ttf", 32);
    layer->addChild(title);
    title->setPosition(layer->getContentSize().width / 2, layer->getContentSize().height - 100); // move it down
    
    // play button, create Menu Item and Menu
    cocos2d::MenuItemImage* playButton = cocos2d::MenuItemImage::create(
       "start-button.png", "start-button.png", CC_CALLBACK_1(MainScene::startCallback, this));
    cocos2d::Menu* menu = cocos2d::Menu::create(playButton, NULL);
    menu->setPosition(layer->getContentSize().width / 2, layer->getContentSize().height / 2);
    layer->addChild(menu, 1);
    
    // finally add the built up Layer to the Scene.
    scene->addChild(layer, 0);
}

MainScene::~MainScene() {}

MainScene* MainScene::createScene()
{
    MainScene* m = new MainScene();
    return m;
}

void MainScene::startCallback(cocos2d::Ref* pSender)
{
    cocos2d::Director::getInstance()->replaceScene(GameScene::createScene());
}
