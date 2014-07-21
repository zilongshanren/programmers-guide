#ifndef _BALLSPRITE_H_
#define _BALLSPRITE_H_

#include <iostream>

#include "cocos2d.h"

class BallSprite : public cocos2d::Sprite
{
    public:
        BallSprite();
        ~BallSprite();
    
        static BallSprite* createSprite(cocos2d::Point _inPoint);
    
        void initOptions(cocos2d::Point _inPoint);
        void addEvents();
        void touchEvent(cocos2d::Touch* touch);
    
        bool onContactBegin(cocos2d::PhysicsContact& contact);
            
    private:
        
};

#endif // _BALLSPRITE_H_
