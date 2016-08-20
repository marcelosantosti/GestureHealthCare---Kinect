package br.com.facdombosco.gesturehealthcare.model.presentation.impl
{
	import br.com.facdombosco.gesturehealthcare.event.GestureEvent;
	import br.com.facdombosco.gesturehealthcare.model.gestures.GestureType;

	public class GestureViewerPresentationModel
	{
		[Bindable]
		private var _gesture : String;
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function gestureRecognised(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.POINT_RIGTH)
				this.gesture = "APONTOU PARA TELA";
			
			if (gestureEvent.gestureType == GestureType.RAISE_LEFT)
				this.gesture = "LEVANTOU O BRAÇO ESQUERDO";
			
			if (gestureEvent.gestureType == GestureType.RAISE_RIGTH)
				this.gesture = "LEVANTOU O BRAÇO DIREITO";
			
			if (gestureEvent.gestureType == GestureType.SWIPE_LEFT)
				this.gesture = "DESLIZOU PARA ESQUERDA";
			
			if (gestureEvent.gestureType == GestureType.SWIPE_RIGTH)
				this.gesture = "DESLIZOU PARA DIREITA";
			
			if (gestureEvent.gestureType == GestureType.WAVE_RIGTH)
				this.gesture = "WAVE COM A MÃO DIREITA";
			
			if (gestureEvent.gestureType == GestureType.SCROLL_DOWN)
				this.gesture = "SCROLL DOWN";
			
			if (gestureEvent.gestureType == GestureType.STRECH_LEFT)
				this.gesture = "ESTICOU O BRAÇO PARA A ESQUERDA";
			
			if (gestureEvent.gestureType == GestureType.STRECH_RIGTH)
				this.gesture = "ESTICOU O BRAÇO PARA A DIREITA";
			
			if (gestureEvent.gestureType == GestureType.SPREAD)
				this.gesture = "REALIZOU ZOOM IN";
			
			if (gestureEvent.gestureType == GestureType.PINCH)
				this.gesture = "REALIZOU ZOOM OUT";
		}
		
		[Bindable]
		public function get gesture() : String
		{
			return this._gesture;
		}
		
		public function set gesture(gesture : String) : void
		{
			this._gesture = gesture;
		}
	}
}