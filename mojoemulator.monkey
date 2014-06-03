Strict

Public

#MOJO_EMULATOR_FORCE_MOJO = True

#If BRL_GAMETARGET_IMPLEMENTED And MOJO_EMULATOR_FORCE_MOJO
	Import mojo
#Else
	' Preprocessor related:
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	#If MOJO_EMULATOR_IMPLEMENTED
		' Imports:
		Import time
		
		Import external
		Import app
		Import graphics
		
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