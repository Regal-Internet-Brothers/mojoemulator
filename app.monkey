Strict

Public

' Preprocessor related:
#MOJO_EMULATOR_FORCE_MOJO = True

#If BRL_GAMETARGET_IMPLEMENTED And MOJO_EMULATOR_FORCE_MOJO
	Import mojo.app
#Else
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	#If MOJO_EMULATOR_IMPLEMENTED
		' Imports:
		Import mojoemulator
		Import external
		Import graphics
		
		' Global variable(s) (Public):
		' Nothing so far.
		
		' Global variable(s) (Private):
		Private
		
		Global MOJO_UPDATE_RATE:Int = 0
		
		Public
		
		' Classes:
		Class App
			' Constant variable(s):
			
			' Defaults:
			Const Default_DeviceWidth:Int = 640
			Const Default_DeviceHeight:Int = 480
			
			' Constructor(s):
			Method New()
				OnCreate()
			End
		
			Method OnCreate:Int()
				Return 0
			End
			
			' Methods:
			
			' Callbacks:
			Method OnUpdate:Int()
				Return 0
			End
			
			Method OnRender:Int()
				Return 0
			End
			
			Method OnLoading:Int()
				Return 0
			End
			
			Method OnSuspend:Int()
				Return 0
			End
			
			Method OnResume:Int()
				Return 0
			End
			
			Method OnClose:Int()
				EndApp()
				
				Return 0
			End
		
			Method OnBack:Int()			
				Return OnClose()
			End
			
			Method OnResize:Int()
				Return 0
			End
		End
		
		' Functions:
		Function SetUpdateRate:Void(Input:Int)
			MOJO_UPDATE_RATE = Input
			
			Return
		End
		
		Function UpdateRate:Int()
			Return MOJO_UPDATE_RATE
		End
		
		Function DeviceWidth:Int()
			Return App.Default_DeviceWidth
		End
		
		Function DeviceHeight:Int()
			Return App.Default_DeviceHeight
		End
		
		Function VDeviceWidth:Int()
			Return DeviceWidth()
		End
		
		Function VDeviceHeight:Int()
			Return DeviceHeight()
		End
		
		Function EndApp:Void()
			Error("")
			
			Return
		End
		
		Function GetDate:Int[]()
			' Local variable(s):
			Local Date:Int[7]
			
			GetDate(Date)
			
			Return Date
		End
		
		Function GetDate:Void(Date:Int[])
			external.GetDate(Date)
			
			Return
		End
	#End
#End