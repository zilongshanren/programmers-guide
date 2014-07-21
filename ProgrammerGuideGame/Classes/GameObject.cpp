#include "GameObject.h"

#include "MainScene.h"

GameObject* GameObject::pinstance = 0;

GameObject* GameObject::Instance()
{
	if (pinstance == 0)
	{
		pinstance = new GameObject();
        pinstance->initInstance();
    }
	
	return pinstance;
}

GameObject::GameObject() {}

GameObject* GameObject::createGame()
{
    return GameObject::Instance();
}

void GameObject::initInstance()
{
    mainScene = MainScene::createScene();
}


