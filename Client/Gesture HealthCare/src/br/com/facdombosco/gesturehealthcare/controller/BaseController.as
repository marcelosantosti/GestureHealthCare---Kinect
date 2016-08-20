package br.com.facdombosco.gesturehealthcare.controller
{
	import br.com.facdombosco.gesturehealthcare.service.imp.GestureHealthCareService;
	
	import flash.events.IEventDispatcher;
	
	import org.swizframework.utils.services.ServiceHelper;

	public class BaseController
	{
		[Inject]
		public var serviceHelper : ServiceHelper;
		
		[Inject]
		public var gestureHealthCareService : GestureHealthCareService;
		
		[Dispatcher]
		public var dispatcher : IEventDispatcher;
	}
}