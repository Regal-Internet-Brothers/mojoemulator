
// Includes:
#include <ctime>

// year, month (1-12), day (1-31), hours (0-23), minutes (0-59), seconds (0-59) and milliseconds (0-999)

// Functions:
inline int millisecs();

void getDate(Array<int> date)
{
	// Local variable(s):
	time_t t = time(0);
	
	// Get the current time from the system.
	struct tm* now = localtime(&t);
	
	date[0] = (now->tm_year + 1900);
	date[1] = (now->tm_mon+1);
	date[2] = (now->tm_mday);
	date[3] = (now->tm_hour);
	date[4] = (now->tm_min);
	date[5] = (now->tm_sec);
	date[6] = millisecs();
	
	// Delete the temporary time-object.
	//delete now;
	
	return;
}
