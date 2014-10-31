Strict

Public

' Preprocessor related:
#MOJO_EMULATOR_FORCE_MOJO = False ' True

#If BRL_GAMETARGET_IMPLEMENTED Or MOJO_EMULATOR_FORCE_MOJO
	Import mojo.asyncloaders
#Else
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	#If MOJO_EMULATOR_IMPLEMENTED
		' Imports:
		Import mojoemulator
		
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