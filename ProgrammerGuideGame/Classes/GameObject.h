#ifndef  _GAMEOBJECT_H_
#define  _GAMEOBJECT_H_

#include "cocos2d.h"

#include <vector>
#include <thread>

class GameScene;
class MainScene;
class EnemySprite;

class  GameObject
{
    public:
        static GameObject* Instance();
        void initInstance();
    
        static GameObject* createGame();
    
        MainScene* getMainSceneObject() { return mainScene; };
        cocos2d::Scene* getGameSceneObject() { return gameScene; };

    private:
        GameObject();
        GameObject(const GameObject&);
        GameObject& operator= (const GameObject&);
        static GameObject* pinstance;
    
        MainScene* mainScene;
        cocos2d::Scene* gameScene;
};

#endif // _GAMEOBJECT_H_

