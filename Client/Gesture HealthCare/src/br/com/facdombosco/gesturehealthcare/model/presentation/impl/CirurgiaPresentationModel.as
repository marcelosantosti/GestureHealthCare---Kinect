package br.com.facdombosco.gesturehealthcare.model.presentation.impl
{
	import br.com.facdombosco.gesturehealthcare.event.CirurgiaEvent;
	import br.com.facdombosco.gesturehealthcare.event.GestureEvent;
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	import br.com.facdombosco.gesturehealthcare.model.gestures.GestureType;
	import br.com.facdombosco.gesturehealthcare.model.util.SuperViewNavigator;
	import br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia;
	import br.com.facdombosco.gesturehealthcare.view.ProntuarioView;
	
	import mx.collections.ArrayCollection;

	public class CirurgiaPresentationModel extends BasePresentationModel
	{
		[Bindable]
		private var _cirurgiaArrayCollection : ArrayCollection;
		
		[Bindable]
		private var _cirurgiaSelecionada : int = -1;
		
		public function verCirurgias() : void
		{
			this.cirurgiaSelecionada = -1;
			var cirurgiaEvent : CirurgiaEvent = new CirurgiaEvent(CirurgiaEvent.BUSCAR_CIRURGIAS);
			super.dispatcher.dispatchEvent(cirurgiaEvent);
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function pointRigth(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.POINT_RIGTH && super.isViewActive("CirurgiaView"))
			{
				this.verProntuario(this.cirurgiaSelecionada);	
			}
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function strechRigth(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.STRECH_RIGTH && super.isViewActive("CirurgiaView") && this.cirurgiaSelecionada < this.cirurgiaArrayCollection.length)
			{
				this.cirurgiaSelecionada = this.cirurgiaSelecionada + 1;
			}
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function strechLeft(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.STRECH_LEFT && super.isViewActive("CirurgiaView") && this.cirurgiaSelecionada > 0)
				this.cirurgiaSelecionada = this.cirurgiaSelecionada - 1; 
		}
		
		public function verProntuario(cirurgia : int) : void
		{
			if (cirurgiaArrayCollection != null)
			{
				var cirurgiaEvent : CirurgiaEvent = new CirurgiaEvent(CirurgiaEvent.VER_PRONTUARIO);
				this._cirurgiaSelecionada = cirurgia;
				cirurgiaEvent.cirurgia = this.cirurgiaArrayCollection.getItemAt(cirurgia) as Cirurgia;
				super.dispatcher.dispatchEvent(cirurgiaEvent);
				
				SuperViewNavigator.viewNavigator.pushView(ProntuarioView);	
			}
		}
		
		[Bindable]
		public function get cirurgiaSelecionada() : int
		{
			return this._cirurgiaSelecionada;
		}
		
		public function set cirurgiaSelecionada(cirurgiaSelecionada : int) : void
		{
			this._cirurgiaSelecionada = cirurgiaSelecionada;
		}
		
		[Bindable]
		public function get cirurgiaArrayCollection() : ArrayCollection
		{
			return this._cirurgiaArrayCollection;
		}
		
		public function set cirurgiaArrayCollection(cirurgiaArrayCollection : ArrayCollection) : void
		{
			this._cirurgiaArrayCollection = cirurgiaArrayCollection;
		}
	}
}