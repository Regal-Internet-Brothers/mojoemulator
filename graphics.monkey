Strict

Public

' Preprocessor related:
#If (Not MOJO_EMULATOR_FORCE_ALTERNATIVE And BRL_GAMETARGET_IMPLEMENTED) Or MOJO_EMULATOR_FORCE_MOJO
	' Standard graphical functionality.
	Import mojo.graphics
#Else
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	#If MOJO_EMULATOR_IMPLEMENTED
		' Imports (Public):
		Import regal.imagedimensions
		
		Import mojoemulator ' regal.mojoemulator
		
		' Imports (Private):
		Private
		
		Import app
		
		Public
		
		' Classes:
		Class Image
			' Constant variable(s) (Public):
			Const MidHandle:Int = 1
			
			Const XPadding:Int		= 2
			Const YPadding:Int		= 4
			Const XYPadding:Int		= XPadding | YPadding
					
			' Constant variable(s) (Private):
			Private
			
			Const FullFrame:Int = 65536
			
			Public
			
			' Global variable(s):
			Global DefaultFlags:Int = 0
			
			' Functions (Public):
			' Nothing so far.
			
			' Functions (Private):
			Private
			
			' Nothing so far.
			
			Public
			
			' Constructor(s) (Public):
			Method New(Flags:Int=Image.DefaultFlags)
				Self._Flags = Flags
			End
			
			Method New(FrameCount:Int, Flags:Int)
				Self._Frames = FrameCount
				Self._Flags = Flags
			End
			
			Method New(Width:Int, Height:Int, FrameCount:Int, Flags:Int=Image.DefaultFlags)
				Self._Width = Width
				Self._Height = Height
				Self._Frames = FrameCount
				Self._Flags = Flags
			End
			
			' Destructor(s):
			Method Discard:Int()
				Return 0
			End
			
			' Methods:
			Method GrabImage:Image(X:Int, Y:Int, Width:Int, Height:Int, FrameCount:Int=1, Flags:Int=DefaultFlags)
				Return New Image(Width/FrameCount, Height, FrameCount, Flags)
			End
			
			Method Width:Int() ' Property
				Return Self._Width
			End
			
			Method Height:Int() ' Property
				Return Self._Height
			End
			
			Method Loaded:Bool()
				Return Self._Loaded
			End
			
			Method Frames:Int()
				Return Self._Frames
			End
			
			Method Flags:Int()
				Return Self._Flags
			End
			
			Method HandleX:Float()
				Return Self._HandleX
			End
			
			Method HandleY:Float()
				Return Self._HandleY
			End
					
			Method SetHandle:Int(X:Float, Y:Float)
				_HandleX = X
				_HandleY = Y
				
				_Flags = _Flags & ~MidHandle
				
				' Return the default response.
				Return 0
			End
			
			' Unsupported:
			' Method WritePixels:Void(pixels:Int[], x:Int, y:Int, width:Int, height:Int, offset:Int=0, pitch:Int=0)
			
			' Methods (Private):
			Private
			
			Method ApplyFlags:Void(F:Int)
				_Flags = F
				
				If (_Flags & XPadding) Then
					_Width -= 2
				Endif
				
				If (_Flags & YPadding) Then
					_Height -= 2
				Endif
				
				If (_Flags & Image.MidHandle) Then
					SetHandle(_Width / 2.0, _Height / 2.0)
				Endif
				
				Return
			End
			
			Public
			
			' Properties (Public):
			' Nothing so far.
			
			' Properties (Private):
			Private
			
			' Nothing so far.
			
			Public
			
			' Fields (Public):
			' Nothing so far.
			
			' Fields (Private):
			Private
			
			Field _Width:Int, _Height:Int
			Field _HandleX:Float, _HandleY:Float
			Field _Flags:Int, _Frames:Int
			Field _Loaded:Bool
			
			Public
		End
		
		' Functions:
		Function LoadImage:Image(Path:String, FrameCount:Int=1, Flags:Int=Image.DefaultFlags)
			#If CONFIG = "debug"
				If (FrameCount <= 0) Then
					DebugLog("Invalid 'FrameCount' specified.")
					
					DebugStop()
				Endif
			#End
			
			' Local variable(s):
			Local D:= LoadImageDimensions(FixDataPath(Path))
			
			If (D[0] <> 0 And D[1] <> 0) Then
				' Local variable(s):
				Local I:= New Image(FrameCount, Flags)
				
				I._Width = D[0] / FrameCount
				I._Height = D[1]
				
				Return I
			Endif
			
			Return Null
		End
		
		Function LoadImage:Image(Path:String, FrameWidth:Int, FrameHeight:Int, FrameCount:Int, Flags:Int=Image.DefaultFlags)
			Local I:= New Image(FrameWidth, FrameHeight, FrameCount, Flags)
			
			' LoadImageDemensions(Path) <-- There's no need to call this, it would only give incorrect results.
			
			Return I
		End
		
		Function CreateImage:Image(Width:Int, Height:Int, FrameCount:Int=1, Flags:Int=Image.DefaultFlags)
			Return New Image(Width, Height, FrameCount, Flags)
		End
	#End
#End