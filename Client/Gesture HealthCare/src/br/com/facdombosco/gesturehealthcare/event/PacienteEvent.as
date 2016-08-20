package br.com.facdombosco.gesturehealthcare.event
{
	import br.com.facdombosco.gesturehealthcare.model.vo.Paciente;
	
	import flash.events.Event;
	
	import spark.components.List;

	public class PacienteEvent extends Event
	{
		public static const VER_PRONTUARIO : String = "PacienteEvent.VER_PRONTUARIO";
		public static const VER_EXAMES : String = "PacienteEvent.VER_EXAMES";
		public static const VER_LAUDOS : String = "PacienteEvent.VER_LAUDOS";
		public static const VER_PROCEDIMENTOS : String = "PacienteEvent.VER_PROCEDIMENTOS";
		public static const VER_DIAGNOSTICOS : String = "PacienteEvent.VER_DIAGNOSTICOS";
		public static const BUSCAR_EXAMES : String = "PacienteEvent.BUSCAR_EXAMES";
		public static const BUSCAR_PROCEDIMENTOS : String = "PacienteEvent.BUSCAR_PROCEDIMENTOS";
		public static const BUSCAR_DIAGNOSTICOS : String = "PacienteEvent.BUSCAR_DIAGNOSTICOS";
		public static const BUSCAR_LAUDOS : String = "PacienteEvent.BUSCAR_LAUDOS";
		
		public var paciente : Paciente;
		
		public function PacienteEvent(type : String)
		{
			super(type)
		}
	}
}