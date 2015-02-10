Strict

Public

#Rem
	NOTES:
		* The 'MOJO_EMULATOR_IMPLEMENTED' preprocessor variable
		only describes that some kind of functionality
		from this module is being provided.
		
		It does not describe that a standard "feature set" is provided,
		only that a formal sub-module (Including this one)
		has delegated its functionality to a user.
		
		* Most sub-modules here will only provide their implementations
		if an official Mojo implementation is not available,
		or their functionality has been explicitly requested.
		
		In most cases, sub-modules will import the standard functionaly,
		and not delegate their own. This is recommended for sub-modules,
		but it is not in any way a requirement.
#End

' Preprocessor related:

' Modules following standard implementation-management techniques
' may be configured using these preprocessor variables:
#MOJO_EMULATOR_FORCE_MOJO = False ' True
#MOJO_EMULATOR_FORCE_ALTERNATIVE = False

' Check if we should use the standard Mojo functionality,
' or the alternative functionality provided by this module:
#If (Not MOJO_EMULATOR_FORCE_ALTERNATIVE And BRL_GAMETARGET_IMPLEMENTED) Or MOJO_EMULATOR_FORCE_MOJO
	' Standard 'mojo' functionality.
	Import mojo
#Else
	' Describe that we are using this module.
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	' Make sure we're able to supply functionality:
	#If MOJO_EMULATOR_IMPLEMENTED
		' Imports (Monkey) (External):
		
		' These are imported here for maximum-compatibility reasons:
		
		' Standard language functionality.
		Import monkey.lang
		
		' Standard date/time functionality.
		Import time
		
		' Imports (Monkey) (Internal):
		
		' External/native functionality.
		Import external
		
		' Application-related functionality.
		Import app
		
		' Standard graphics functionality.
		Import graphics
		
		' Asynchronous functionality. (Currently more of a place-holder)
		Import asyncloaders
	#End
#End