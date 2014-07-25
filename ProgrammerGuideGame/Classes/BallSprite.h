#ifndef _BALLSPRITE_H_
#define _BALLSPRITE_H_

#include <iostream>

#include "cocos2d.h"

class BallSprite : public cocos2d::Sprite
{
    public:
        BallSprite();
        ~BallSprite();
    
        static BallSprite* createSprite(const cocos2d::Point& _inPoint);
    
        void initOptions(const cocos2d::Point& _inPoint);
        void addEvents();
    
        bool onContactBegin(cocos2d::PhysicsContact& contact);
};

#endif // _BALLSPRITE_H_
