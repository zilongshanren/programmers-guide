#ifndef _ENEMYSPRITE_H_
#define _ENEMYSPRITE_H_

#include <iostream>

#include "cocos2d.h"

class EnemySprite : public cocos2d::Sprite
{
    public:
        EnemySprite();
        ~EnemySprite();
    
        static EnemySprite* createSprite();
    
        void initOptions();
        void addEvents();
    
        bool onContactBegin(cocos2d::PhysicsContact& contact);    
};

#endif // _ENEMYSPRITE_H_
