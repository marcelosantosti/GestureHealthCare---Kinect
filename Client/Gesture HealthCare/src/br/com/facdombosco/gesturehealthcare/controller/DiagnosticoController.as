package br.com.facdombosco.gesturehealthcare.controller
{
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	import br.com.facdombosco.gesturehealthcare.model.presentation.impl.DiagnosticoPresentationModel;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;

	public class DiagnosticoController extends BaseController
	{
		[Inject]
		[Bindable]
		public var diagnosticoPresentationModel : DiagnosticoPresentationModel;
		
		[EventHandler(event="PacienteEvent.BUSCAR_DIAGNOSTICOS")]
		public function buscarExames(pacienteEvent : PacienteEvent) : void
		{
			super.serviceHelper.executeServiceCall(super.gestureHealthCareService.FindAllAtendimentoWithDiagnostico(pacienteEvent.paciente.Codigo),
				onFindAllAtendimentoWithDiagnosticoResult);
		}
		
		private function onFindAllAtendimentoWithDiagnosticoResult(event : ResultEvent) : void
		{
			this.diagnosticoPresentationModel.atendimentoArrayCollection = event.result as ArrayCollection;
		}
	}
}