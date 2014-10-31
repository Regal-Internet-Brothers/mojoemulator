Strict

Public

' Preprocessor related:
#MOJO_EMULATOR_FORCE_MOJO = False ' True

#If BRL_GAMETARGET_IMPLEMENTED Or MOJO_EMULATOR_FORCE_MOJO
	' Nothing so far.
#Else
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	#If MOJO_EMULATOR_IMPLEMENTED
		#If LANG = "cpp"
			#MOJO_EMULATOR_GETDATE_IMPLEMENTED = True
		#End
		
		' Imports:
		Import mojoemulator
		
		' Prerequisites:
		Import time
		
		#If MOJO_EMULATOR_GETDATE_IMPLEMENTED
			Import "native/date.${LANG}"
		#End
		
		' External bindings:
		Extern
		
		' Functions:
		#If MOJO_EMULATOR_GETDATE_IMPLEMENTED
			Function GetDate:Void(Data:Int[])="getDate"
		#End
		
		Public
	#End
#End