package br.com.facdombosco.gesturehealthcare.model.presentation.impl
{
	import br.com.facdombosco.gesturehealthcare.event.GestureEvent;
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	import br.com.facdombosco.gesturehealthcare.model.gestures.GestureType;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.List;

	public class ExamePresentationModel extends BasePresentationModel
	{
		[Bindable]
		private var _atendimentoArrayCollection : ArrayCollection;
		
		private var _list : List;
		
		[EventHandler(event="PacienteEvent.VER_EXAMES")]
		public function verExames(pacienteEvent : PacienteEvent) : void
		{
			if (this.atendimentoArrayCollection == null)
			{
				var pacienteEventBuscarExames : PacienteEvent = new PacienteEvent(PacienteEvent.BUSCAR_EXAMES);
				pacienteEventBuscarExames.paciente = pacienteEvent.paciente;
				
				super.dispatcher.dispatchEvent(pacienteEventBuscarExames);	
			}
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function swipeRigth(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.SWIPE_RIGTH && super.isViewMasterActive("ExameView"))
			{
				if (this.list.selectedIndex != -1)
					this.list.selectedIndex = this.list.selectedIndex + 1;
				else
					this.list.selectedIndex = this.list.selectedIndex + 2;
				
				this.list.ensureIndexIsVisible(this.list.selectedIndex);	
			}
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function swipeLeft(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.SWIPE_LEFT && super.isViewMasterActive("ExameView"))
			{
				this.list.selectedIndex = this.list.selectedIndex - 1;
				this.list.ensureIndexIsVisible(this.list.selectedIndex);	
			}
		}
		
		public function get list() : List
		{
			return this._list;
		}
		
		public function set list(list : spark.components.List) : void
		{
			this._list = list;
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