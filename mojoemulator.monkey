Strict

Public

' Preprocessor related:
#MOJO_EMULATOR_FORCE_MOJO = False ' True

#If BRL_GAMETARGET_IMPLEMENTED Or MOJO_EMULATOR_FORCE_MOJO
	#MOJO_EMULATOR_IMPLEMENTED = False
	
	Import mojo
#Else
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	#If MOJO_EMULATOR_IMPLEMENTED
		' Imports:
		Import time
		
		Import external
		Import app
		Import graphics
		Import asyncloaders
		
		' Classes:
		' Nothing so far.
		
		' Functions (Public):
		' Nothing so far.
		
		' Functions (Private):
		Private
		
		' Nothing so far.
		
		Public
	#End
#End