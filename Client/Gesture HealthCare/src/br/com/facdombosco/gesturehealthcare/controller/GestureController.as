package br.com.facdombosco.gesturehealthcare.controller
{
	import br.com.facdombosco.gesturehealthcare.event.GestureEvent;
	import br.com.facdombosco.gesturehealthcare.model.gestures.Gesture;
	import br.com.facdombosco.gesturehealthcare.model.gestures.GestureType;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.IGesturePart;
	
	import com.as3nui.nativeExtensions.air.kinect.data.User;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class GestureController extends EventDispatcher
	{
		private var _gesture : Vector.<Gesture>;
		
		[Dispatcher]
		public var dispatcher : IEventDispatcher;
		
		public function GestureController()
		{
			this._gesture = new Vector.<Gesture>();
		}
		
		public function updateAllGestures(user : User) : void
		{
			for each (var actualGesture : Gesture in this._gesture)
			{
				actualGesture.updateGesture(user);
			}
		}
		
		public function addGesture(gestureType : int, gesturePart : Vector.<IGesturePart>) : void
		{
			var newGesture : Gesture = new Gesture(gestureType, gesturePart, this.dispatcher);
			this._gesture.push(newGesture);
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function gestureRecognised(gestureEvent : GestureEvent) : void
		{
			for each (var actualGesture : Gesture in this._gesture)
			{
				actualGesture.reset();
			}
		}
	}
}