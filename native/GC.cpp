
// Namespace(s):
namespace mojoemulator
{
	// Functions:
	
	// Use this command at your own risk.
	void garbageCollect(Object* o)
	{
		// Mark the object specified.
		gc_mark(o);
		
		// Force garbage collection.
		gc_collect();
		
		return;
	}
}
