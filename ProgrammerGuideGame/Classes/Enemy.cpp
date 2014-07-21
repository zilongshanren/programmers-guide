#include "Enemy.h"

#include "EnemySprite.h"

Enemy::Enemy()
{
    _enemy = EnemySprite::createSprite();
    // need to make it move
    // need to change texture on each movement so it looks like it is walking
    // add new sprites at a random spot.
    
}

Enemy::~Enemy() {}

Enemy* Enemy::createEnemy()
{
    Enemy* e = new Enemy();
    
    return e;
}

void Enemy::initOptions()
{
    //_enemy = EnemySprite::createSprite();
    
}