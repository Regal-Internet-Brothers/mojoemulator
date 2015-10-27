Strict

Public

#Rem
	Asynchronous loading is currently unsupported,
	and is available purely as a compatibility wrapper.
#End

' Preprocessor related:
#If (Not MOJO_EMULATOR_FORCE_ALTERNATIVE And BRL_GAMETARGET_IMPLEMENTED) Or MOJO_EMULATOR_FORCE_MOJO
	' Standard asynchronous loading functionality.
	Import mojo.asyncloaders
#Else
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	#If MOJO_EMULATOR_IMPLEMENTED
		' This acts as the standard implementation-flag for asynchronous functionality.
		' This does not specify if actions are truly asynchronous, only that
		' you can use the functionality as this module describes it.
		#MOJO_EMULATOR_ASYNCLOADERS_IMPLEMENTED = True
		
		' Imports:
		Import mojoemulator ' regal.mojoemulator
		
		' BRL:
		Import brl.asyncevent
		
		' Interfaces:
		Interface IOnLoadImageComplete
			Method OnLoadImageComplete:Void(Image:Image, Path:String, Source:IAsyncEventSource)
		End
		
		' Functions:
		Function LoadImageAsync:Void(Path:String, Frames:Int=1, Flags:Int=Image.DefaultFlags, OnComplete:IOnLoadImageComplete)
			OnComplete.OnLoadImageComplete(LoadImage(Path, Frames, Flags), Path, Null)
			
			Return
		End
	#End
#End