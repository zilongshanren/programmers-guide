#ifndef __MAINSCENE_H__
#define __MAINSCENE_H__

#include <iostream>

#include "cocos2d.h"

class MainScene
{
    public:
        MainScene();
        ~MainScene();
    
        static MainScene* createScene();

        inline cocos2d::Scene* getScene() { return scene; };
    
        void startCallback(cocos2d::Ref* pSender);
    
    private:
        cocos2d::Scene* scene;
};

#endif // __MAINSCENE_H__
