
// Includes:
#include <ctime>

// Functions:
// Nothing so far.

// Namespace(s):
namespace mojoemulator
{
	// Enumerators:
	enum
	{
		DATE_YEAR,
		DATE_MONTH,
		DATE_DAY,
		DATE_HOUR,
		DATE_MINUTE,
		DATE_SECOND,
		DATE_MILLISECONDS,
		
		DATE_MS = DATE_MILLISECONDS
	};
	
	// Functions:
	void getDate(Array<int> date)
	{
		// Local variable(s):
		time_t t = time(0);
		
		// Get the current date/time from the system.
		struct tm* now = localtime(&t);
		
		// Transfer the date/time information into the array:
		date[DATE_YEAR] = (now->tm_year + 1900);
		date[DATE_MONTH] = (now->tm_mon+1);
		date[DATE_DAY] = (now->tm_mday);
		date[DATE_HOUR] = (now->tm_hour);
		date[DATE_MINUTE] = (now->tm_min);
		date[DATE_SECOND] = (now->tm_sec);
		date[DATE_MILLISECONDS] = 0; // millisecs();
		
		// Delete the temporary time-object. (Non-standard)
		//delete now;
		
		return;
	}
}
