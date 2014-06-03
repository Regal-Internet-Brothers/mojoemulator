Strict

Public

' Preprocessor related:
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