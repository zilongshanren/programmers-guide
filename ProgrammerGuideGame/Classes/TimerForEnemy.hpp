#ifndef  _TIMERFORENEMY_H_
#define  _TIMERFORENEMY_H_

#include <string>
#include <thread>
#include <memory>
#include <iostream>

class TimerForEnemy : public std::thread
{
	public:
    	TimerForEnemy();
		virtual ~TimerForEnemy() {}
    
        inline virtual std::string getTimerName() { return _timerName; };
    
	private:
		bool bRun = true;
        std::string _timerName = "EnemyTimer";
    
};

#endif // _TIMERFORENEMY_H_

