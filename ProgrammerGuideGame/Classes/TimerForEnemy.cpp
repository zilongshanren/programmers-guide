
#include "TimerForEnemy.hpp"

#include "GameObject.h"

extern GameObject* _gameObject;

TimerForEnemy::TimerForEnemy()
{
	while (bRun)
	{   std::this_thread::sleep_for(std::chrono::seconds(2));
        //std::cout << "firing enemy timer.." << std::endl;
        _gameObject->Instance()->setAddEnemy(true);
        std::this_thread::sleep_for(std::chrono::seconds(12));
    }
}