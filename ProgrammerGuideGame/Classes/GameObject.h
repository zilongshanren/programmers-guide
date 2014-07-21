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

        inline std::vector<EnemySprite*>& getEnemies() { return _enemies; };
        inline const std::vector<EnemySprite*>& getEnemies() const { return _enemies; }
    
    private:
        GameObject();
        GameObject(const GameObject&);
        GameObject& operator= (const GameObject&);
        static GameObject* pinstance;
    
        MainScene* mainScene;
        cocos2d::Scene* gameScene;
    
        std::vector<EnemySprite*> _enemies;
};

#endif // _GAMEOBJECT_H_

