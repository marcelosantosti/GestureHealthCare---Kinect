package br.com.facdombosco.gesturehealthcare.event
{
	import flash.display.BitmapData;
	import flash.events.Event;

	public class KinectImageEvent extends Event
	{
		public static const IMAGE_UPDATED : String = "KinectImageEvent.IMAGE_UPDATED";
		
		public var kinectImage : BitmapData;
		
		public function KinectImageEvent(type : String)
		{
			super(type);
		}
	}
}