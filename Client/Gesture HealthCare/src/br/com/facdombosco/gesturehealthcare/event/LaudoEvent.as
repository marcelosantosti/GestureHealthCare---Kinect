package br.com.facdombosco.gesturehealthcare.event
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class LaudoEvent extends Event
	{
		public static const RETORNAR_LAUDOS : String = "LaudoEvent.RETORNAR_LAUDOS";
		
		public var laudo : ArrayCollection;
		
		public function LaudoEvent(type : String)
		{
			super(type);
		}
	}
}