#ifndef _ENEMY_H_
#define _ENEMY_H_

#include <iostream>

#include "cocos2d.h"

class EnemySprite;

class Enemy
{
    public:
        Enemy();
        ~Enemy();
    
        static Enemy* createEnemy();
        void initOptions();
    
        inline EnemySprite* getSprite() { return _enemy; };
    
    private:
        EnemySprite* _enemy;
};

#endif // _ENEMY_H_
