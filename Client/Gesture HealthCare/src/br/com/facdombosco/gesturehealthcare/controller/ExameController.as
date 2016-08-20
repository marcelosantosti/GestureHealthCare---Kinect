package br.com.facdombosco.gesturehealthcare.controller
{
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	import br.com.facdombosco.gesturehealthcare.model.presentation.impl.ExamePresentationModel;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.List;

	public class ExameController extends BaseController
	{
		[Inject]
		[Bindable]
		public var examePresentationModel : ExamePresentationModel;
		
		private var list : List;
		
		[EventHandler(event="PacienteEvent.BUSCAR_EXAMES")]
		public function buscarExames(pacienteEvent : PacienteEvent) : void
		{
			super.serviceHelper.executeServiceCall(super.gestureHealthCareService.FindAllAtendimentoWithExame(pacienteEvent.paciente.Codigo), onFindAllAtendimentoWithExameResult);
		}
		
		private function onFindAllAtendimentoWithExameResult(event : ResultEvent) : void
		{
			this.examePresentationModel.atendimentoArrayCollection = event.result as ArrayCollection;
		}
	}
}