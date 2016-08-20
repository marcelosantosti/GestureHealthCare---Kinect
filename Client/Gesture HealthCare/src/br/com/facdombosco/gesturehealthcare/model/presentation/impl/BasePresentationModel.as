package br.com.facdombosco.gesturehealthcare.model.presentation.impl
{
	import br.com.facdombosco.gesturehealthcare.event.GestureEvent;
	import br.com.facdombosco.gesturehealthcare.model.gestures.GestureType;
	import br.com.facdombosco.gesturehealthcare.model.util.SuperViewNavigator;
	import br.com.facdombosco.gesturehealthcare.view.CirurgiaView;
	import br.com.facdombosco.gesturehealthcare.view.HomeView;
	
	import flash.events.IEventDispatcher;
	
	import spark.components.ViewNavigator;

	public class BasePresentationModel
	{
		[Dispatcher]
		public var dispatcher : IEventDispatcher;
		
		[ViewNavigator]
		public var viewNavigator : ViewNavigator;
		
		public function voltar() : void
		{
			var gestureEvent : GestureEvent = new GestureEvent(GestureEvent.GESTURE_RECOGNISED);
			gestureEvent.gestureType = GestureType.RAISE_LEFT;
			this.dispatcher.dispatchEvent(gestureEvent);
		}
		
		public function sair() : void
		{
			var gestureEvent : GestureEvent = new GestureEvent(GestureEvent.GESTURE_RECOGNISED);
			gestureEvent.gestureType = GestureType.WAVE_RIGTH;
			this.dispatcher.dispatchEvent(gestureEvent);
		}
		
		public function isViewActive(viewName : String) : Boolean
		{
			var view : String = SuperViewNavigator.viewNavigator.activeView.name; 
			if (view.search(viewName) == -1)
				return false;
			else
				return true;
		}
		
		public function isViewMasterActive(viewName : String) : Boolean
		{
			var view : String = this.viewNavigator.activeView.name; 
			if (view.search(viewName) == -1)
				return false;
			else
				return true;
		}
	}
}