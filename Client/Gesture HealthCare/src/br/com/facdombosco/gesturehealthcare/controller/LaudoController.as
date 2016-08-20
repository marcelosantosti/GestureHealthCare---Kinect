package br.com.facdombosco.gesturehealthcare.controller
{
	import br.com.facdombosco.gesturehealthcare.event.LaudoEvent;
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	import br.com.facdombosco.gesturehealthcare.model.presentation.impl.LaudoPresentationModel;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;

	public class LaudoController extends BaseController
	{
		[EventHandler(event="PacienteEvent.BUSCAR_LAUDOS")]
		public function buscarLaudos(pacienteEvent : PacienteEvent) : void
		{
			super.serviceHelper.executeServiceCall(super.gestureHealthCareService.FindAllLaudo(pacienteEvent.paciente.Codigo), onFindAllLaudo); 
		}
		
		public function onFindAllLaudo(event : ResultEvent) : void
		{
			var laudoEvent : LaudoEvent = new LaudoEvent(LaudoEvent.RETORNAR_LAUDOS);
			laudoEvent.laudo = event.result as ArrayCollection;
			
			super.dispatcher.dispatchEvent(laudoEvent);
		}
	}
}