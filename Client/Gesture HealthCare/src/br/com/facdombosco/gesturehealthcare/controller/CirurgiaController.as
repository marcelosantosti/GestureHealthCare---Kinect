package br.com.facdombosco.gesturehealthcare.controller
{
	import br.com.facdombosco.gesturehealthcare.event.CirurgiaEvent;
	import br.com.facdombosco.gesturehealthcare.model.presentation.impl.CirurgiaPresentationModel;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;

	public class CirurgiaController extends BaseController
	{
		[Inject]
		[Bindable]
		public var cirurgiaPresentationModel : CirurgiaPresentationModel;
		
		[EventHandler(event="CirurgiaEvent.BUSCAR_CIRURGIAS")]
		public function buscarCirurgias(cirurgiaEvent : CirurgiaEvent) : void
		{
			super.serviceHelper.executeServiceCall(super.gestureHealthCareService.FindAllCirurgia(), onFindAllCirurgiaResult);
		}
		
		private function onFindAllCirurgiaResult(event : ResultEvent) : void
		{
			this.cirurgiaPresentationModel.cirurgiaArrayCollection = event.result as ArrayCollection;	
			this.cirurgiaPresentationModel.cirurgiaSelecionada = 0; 
		}
	}
}