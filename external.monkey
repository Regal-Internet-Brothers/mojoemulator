Strict

Public

#Rem
	Unlike most of the sub-modules provided, this module is partially disconnected from the main framework.
	Specific functionality provided here can be normally worked with, even if "emulation" is not the current environment.
	
	Most functionality in this module is accompanied by preprocessor implementation-flags.
	These can be used to determine if the functionality in question is available to you.
	
	Some functionality in this module is considered experimental, and may cause compilation (Or even runtime) errors.
#End

' Preprocessor related:
#MOJO_EMULATOR_IMPLEMENTED = True

#If MOJO_EMULATOR_IMPLEMENTED
	' This is used as an alias for the "OnBlah" garbage collection mode.
	' This is only provided for internal uses; you shouldn't
	' really be using this when setting the garbage-collection mode.
	#MOJO_EMULATOR_CPP_GC_MODE_CALLBACKS = 1
	
	#Rem
		To use this functionality, either set this variable to 'True'
		in your own module(s), or set 'CPP_GC_MODE' to 1 / "OnBlah".
		
		(See 'MOJO_EMULATOR_CPP_GC_MODE_CALLBACKS')
		
		Setting the garbage collection mode to such a mode is untested
		with this module, and is therefore not recommended.
		
		This variable acts as a hint to this module;
		this functionality doesn't have to be provided. (Most targets are not supported)
		
		To check if functionality is available, please check against
		the 'MOJO_EMULATOR_GC_COLLECT_IMPLEMENTED' preprocessor variable.
		
		The standard uses inside of this module are based on 'MOJO_EMULATOR_SIMULATE_GC',
		and therefore assume functionality is provided when that variable is defined as 'True'.
	#End
	
	#If CPP_GC_MODE = MOJO_EMULATOR_CPP_GC_MODE_CALLBACKS
		#MOJO_EMULATOR_SIMULATE_GC = True
	#End
	
	#If LANG = "cpp"
		#If Not BRL_GAMETARGET_IMPLEMENTED
			#MOJO_EMULATOR_GETDATE_IMPLEMENTED = True
		#End
		
		' Check if we have been given GC simulation rights:
		#If MOJO_EMULATOR_SIMULATE_GC
			' Set the implementation-flag for the external/manual
			' garbage-collection functionality; see the external bindings.
			#MOJO_EMULATOR_GC_COLLECT_IMPLEMENTED = True
		#End
	#End
	
	' Imports (Monkey):
	
	' This is just for maximum compatibility.
	Import monkey.lang
	
	' Standard time-related functionality.
	Import time
	
	' Imports (Native):
	#If MOJO_EMULATOR_GETDATE_IMPLEMENTED
		Import "native/date.${LANG}"
	#End
	
	#If MOJO_EMULATOR_GC_COLLECT_IMPLEMENTED
		Import "native/GC.${LANG}"
	#End
	
	' External bindings:
	Extern
	
	' Functions:
	#If MOJO_EMULATOR_GETDATE_IMPLEMENTED
		#If LANG = "cpp"
			Function GetDate:Void(Data:Int[])="mojoemulator::getDate"
		#Else
			Function GetDate:Void(Data:Int[])="mojoemulator.getDate"
		#End
	#End
	
	#Rem
		DESCRIPTION (ATTENTION):
			* 'GarbageCollect' is an unofficial "extension" meant for internal use.
			
			This functionality may be used under controlled environments, however, it is not recommended.
		NOTES:
			* Please refrain from using this command directly; functionality is
			provided for internal garbage-management techniques.
			
			* Functionality is only provided if the 'MOJO_EMULATOR_GC_COLLECT_IMPLEMENTED'
			preprocessor variable has been defined as 'True'.
			
			* Please look above for documentation on when this functionality is delegated.
			
			* Garbage collection is target-dependent, and is therefore variable between targets.
			This module takes the initiative to implement such functionality for specific targets.
			Functionality could be non-standard or inconsistent on some targets (If it's provided at all).
	#End
	
	#If MOJO_EMULATOR_GC_COLLECT_IMPLEMENTED
		#If LANG = "cpp"
			Function GarbageCollect:Void(O:Object)="mojoemulator::garbageCollect"
		#Else
			Function GarbageCollect:Void(O:Object)="mojoemulator.garbageCollect"
		#End
	#End
	
	Public
#End