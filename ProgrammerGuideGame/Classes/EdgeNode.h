#ifndef _EDGENODE_H_
#define _EDGENODE_H_

#include <iostream>

#include "cocos2d.h"

class EdgeNode : public cocos2d::Node
{
    public:
        EdgeNode();
        ~EdgeNode();
    
        static EdgeNode* createNode(cocos2d::Size visibleSize);
    
        void initOptions(cocos2d::Size visibleSize);
    
    private:
        cocos2d::PhysicsBody* body;
};

#endif // _EDGENODE_H_
