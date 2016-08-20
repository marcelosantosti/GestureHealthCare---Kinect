package br.com.facdombosco.gesturehealthcare.event
{
	import flash.events.Event;
	
	import mx.containers.Canvas;
	import mx.containers.ViewStack;

	public class LaudoViewStackEvent extends Event
	{
		public static const RETORNAR_VIEWSTACK : String = "LaudoViewStackEvent.RETORNAR_VIEWSTACK";
		
		public var viewStack : ViewStack;
		public var canvas : Canvas;
		
		public function LaudoViewStackEvent(type : String)
		{
			super(type);
		}
	}
}