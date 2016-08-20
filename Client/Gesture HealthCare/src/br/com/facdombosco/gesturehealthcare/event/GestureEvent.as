package br.com.facdombosco.gesturehealthcare.event
{
	import br.com.facdombosco.gesturehealthcare.model.gestures.GestureType;
	
	import flash.events.Event;

	public class GestureEvent extends Event
	{
		public static const GESTURE_RECOGNISED : String = "GestureEvent.GESTURE_RECOGNISED";
		
		public var gestureType : int;
		
		public function GestureEvent(type : String)
		{
			super(type);
		}
	}
}