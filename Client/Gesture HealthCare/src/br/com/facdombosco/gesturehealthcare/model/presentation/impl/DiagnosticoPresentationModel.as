package br.com.facdombosco.gesturehealthcare.model.presentation.impl
{
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	
	import mx.collections.ArrayCollection;

	public class DiagnosticoPresentationModel extends BasePresentationModel
	{
		[Bindable]
		private var _atendimentoArrayCollection : ArrayCollection;
		
		[EventHandler(event="PacienteEvent.VER_DIAGNOSTICOS")]
		public function verDiagnosticos(pacienteEvent : PacienteEvent) : void
		{
			var pacienteEventBuscarDiagnostico : PacienteEvent = new PacienteEvent(PacienteEvent.BUSCAR_DIAGNOSTICOS);
			pacienteEventBuscarDiagnostico.paciente = pacienteEvent.paciente;
			
			super.dispatcher.dispatchEvent(pacienteEventBuscarDiagnostico);
		}
		
		[Bindable]
		public function get atendimentoArrayCollection() : ArrayCollection
		{
			return this._atendimentoArrayCollection; 
		}
		
		public function set atendimentoArrayCollection(atendimentoArrayCollection : ArrayCollection) : void
		{
			this._atendimentoArrayCollection = atendimentoArrayCollection;
		}
	}
}