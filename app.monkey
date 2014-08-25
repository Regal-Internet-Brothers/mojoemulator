Strict

Public

' Preprocessor related:

' When setting this to false, you are expecting the program to terminate before the next update.
' If this is set to true, then the program will exit completely when calling 'OnClose'.
' The 'EndApp' function still closes ungracefully, regardless of this flag.
#MOJO_EMULATOR_AUTOEXIT = True

#MOJO_EMULATOR_FORCE_MOJO = True

#If BRL_GAMETARGET_IMPLEMENTED And MOJO_EMULATOR_FORCE_MOJO
	Import mojo.app
#Else
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	#If MOJO_EMULATOR_IMPLEMENTED
		' Imports:
		Import time
		
		Import mojoemulator
		Import external
		Import graphics
		
		' Global variable(s) (Public):
		' Nothing so far.
		
		' Global variable(s) (Private):
		Private
		
		Global MOJO_UPDATE_RATE:Int = -1
		
		#If Not MOJO_EMULATOR_AUTOEXIT
			Global MOJO_CLOSING:Bool = False
		#End
		
		Public
		
		' Classes:
		Class App
			' Constant variable(s):
			
			' Defaults:
			Const Default_DeviceWidth:Int = 640
			Const Default_DeviceHeight:Int = 480
			
			' Constructor(s):
			Method New(ShouldExecute:Bool=True)
				OnCreate()
				
				If (ShouldExecute) Then
					Execute()
				Endif
			End
		
			Method OnCreate:Int()
				Return 0
			End
			
			' Methods:
			Method Execute:Int()
				Repeat
					' Local variable(s):
					
					' Cache the update-rate.
					Local Rate:= MOJO_UPDATE_RATE ' UpdateRate()
					
					' Check for errors:
					If (Rate = -1) Then Exit
					
					' Continually update this application.
					OnUpdate()
					
					#If Not MOJO_EMULATOR_AUTOEXIT
						If (MOJO_CLOSING) Then Exit
					#End
					
					If (Rate > 0) Then
						Delay(1000/UpdateRate())
					Endif
				Forever
				
				#If Not MOJO_EMULATOR_AUTOEXIT
					' Return the close-response.
					Return OnClose()
				#Else
					Return 0
				#End
			End
			
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
				#If MOJO_EMULATOR_AUTOEXIT
					EndApp()
				#Else
					MOJO_CLOSING = True
				#End
				
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
			Return Max(MOJO_UPDATE_RATE, 0)
		End
		
		Function DeviceWidth:Int()
			Return App.Default_DeviceWidth
		End
		
		Function DeviceHeight:Int()
			Return App.Default_DeviceHeight
		End
		
		#Rem
			Function VDeviceWidth:Int()
				Return DeviceWidth()
			End
			
			Function VDeviceHeight:Int()
				Return DeviceHeight()
			End
		#End
		
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