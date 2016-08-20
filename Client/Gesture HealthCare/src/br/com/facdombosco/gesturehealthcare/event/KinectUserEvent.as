package br.com.facdombosco.gesturehealthcare.event
{
	import com.as3nui.nativeExtensions.air.kinect.data.User;
	
	import flash.events.Event;

	public class KinectUserEvent extends Event
	{
		public static const USER_UPDATED : String = "KinectUserEvent.USER_UPDATED";
		
		public var user : User;
		
		public function KinectUserEvent(type : String)
		{
			super(type);
		}
	}
}