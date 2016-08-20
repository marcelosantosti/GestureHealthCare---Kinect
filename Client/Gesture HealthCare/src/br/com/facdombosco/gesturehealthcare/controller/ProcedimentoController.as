package br.com.facdombosco.gesturehealthcare.controller
{
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	import br.com.facdombosco.gesturehealthcare.model.presentation.impl.ProcedimentoPresentationModel;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;

	public class ProcedimentoController extends BaseController
	{
		[Bindable]
		[Inject]
		public var procedimentoPresentationModel : ProcedimentoPresentationModel;
		
		[EventHandler(event="PacienteEvent.BUSCAR_PROCEDIMENTOS")]
		public function buscarProcedimentos(pacienteEvent : PacienteEvent) : void
		{
			super.serviceHelper.executeServiceCall(super.gestureHealthCareService.FindAllAtendimentoWithProcedimento(pacienteEvent.paciente.Codigo), 
				onFindAllAtendimentoWithProcedimentoResult);
		}
		
		private function onFindAllAtendimentoWithProcedimentoResult(event : ResultEvent) : void
		{
			this.procedimentoPresentationModel.atendimentoArrayCollection = event.result as ArrayCollection;
		}
	}
}