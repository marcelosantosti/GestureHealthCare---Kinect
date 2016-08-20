package br.com.facdombosco.gesturehealthcare.event
{
	import br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia;
	
	import flash.events.Event;

	public class CirurgiaEvent extends Event
	{
		public static const BUSCAR_CIRURGIAS : String = "CirurgiaEvent.BUSCAR_CIRURGIAS";
		public static const VER_PRONTUARIO : String = "CirurgiaEvent.VER_PRONTUARIO";
		
		public var cirurgia : Cirurgia;
		
		public function CirurgiaEvent(type : String)
		{
			super(type);
		}
	}
}