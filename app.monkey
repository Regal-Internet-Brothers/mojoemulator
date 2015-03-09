Strict

Public

' Preprocessor related:

' When setting this to false, you are expecting the program to terminate before the next update.
' If this is set to true, then the program will exit completely when calling 'OnClose'.
' The 'EndApp' function still closes ungracefully, regardless of this flag.
#MOJO_EMULATOR_AUTOEXIT = True
#MOJO_EMULATOR_STANDARD_UPDATE_RATE = True

#If (Not MOJO_EMULATOR_FORCE_ALTERNATIVE And BRL_GAMETARGET_IMPLEMENTED) Or MOJO_EMULATOR_FORCE_MOJO
	' Standard application functionality.
	Import mojo.app
#Else
	#MOJO_EMULATOR_IMPLEMENTED = True
	
	#If MOJO_EMULATOR_IMPLEMENTED
		' This acts as the standard implementation-flag for the 'App' class.
		#MOJO_EMULATOR_APP_IMPLEMENTED = True
		
		' Imports:
		Import time
		
		Import mojoemulator
		Import external
		Import keycodes
		Import graphics
		
		' Constant variable(s) (Public):
		' Nothing so far.
		
		' Constant variable(s) (Private):
		Private
		
		Const DEFAULT_MOJO_UPDATE_RATE_DELAY:= (1000/60) ' 16
		
		Public
		
		' Global variable(s) (Public):
		' Nothing so far.
		
		' Global variable(s) (Private):
		Private
		
		Global MOJO_UPDATE_RATE:= 0
		Global MOJO_UPDATE_RATE_DELAY_CACHE:= DEFAULT_MOJO_UPDATE_RATE_DELAY
		
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
			Method New(ShouldExecute:Bool=True, InitializeUpTime:Bool=True)
				' Check if we should initialize standard up-time functionality:
				If (InitializeUpTime) Then
					InitMillisecs()
				Endif
				
				' Execute the main constructor.
				OnCreate()
				
				If (ShouldExecute) Then
					Execute()
				Endif
			End
		
			Method OnCreate:Int()
				Return 0
			End
			
			' Methods:
			
			' The 'MOJO_EMULATOR_SIMULATE_GC' feature is only directly supported through this routine.
			Method Execute:Int()
				Repeat
					#If MOJO_EMULATOR_SIMULATE_GC
						__RESERVED__CollectApplicationGarbage()
					#End
					
					' Continually update this application.
					OnUpdate()
					
					#If Not MOJO_EMULATOR_AUTOEXIT
						If (MOJO_CLOSING) Then Exit
					#End
					
					If (MOJO_UPDATE_RATE_DELAY_CACHE > 0) Then
						' Return control to the system for now.
						Delay(MOJO_UPDATE_RATE_DELAY_CACHE)
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
			
			'#Rem
			Method OnRender:Int()
				Return 0
			End
			
			Method OnLoading:Int()
				Return 0
			End
			'#End
			
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
			
			' Reserved / Other:
			#If MOJO_EMULATOR_SIMULATE_GC
				#If Not MOJO_EMULATOR_GC_COLLECT_IMPLEMENTED
					#Error("Attempted to use garbage-collection functionality without native support.")
				#End
				
				' Assuming experimental garbage collection functionality is provided,
				' this will collect garbage generated from this object.
				Method __RESERVED__CollectApplicationGarbage:Void()
					' Attempt to apply garbage collection to
					' this object, and its potential "children".
					GarbageCollect(Self)
					
					Return
				End
			#End
		End
		
		' Functions:
		Function SetUpdateRate:Void(Input:Int)
			MOJO_UPDATE_RATE = Input
			
			If (MOJO_UPDATE_RATE > 0) Then
				MOJO_UPDATE_RATE_DELAY_CACHE = (1000/(MOJO_UPDATE_RATE))
			Else
				#If Not MOJO_EMULATOR_STANDARD_UPDATE_RATE
					MOJO_UPDATE_RATE_DELAY_CACHE = 0
				#Else
					MOJO_UPDATE_RATE_DELAY_CACHE = DEFAULT_MOJO_UPDATE_RATE_DELAY
				#End
			Endif
			
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