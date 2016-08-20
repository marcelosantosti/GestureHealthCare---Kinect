package br.com.facdombosco.gesturehealthcare.model.presentation.impl
{
	import br.com.facdombosco.gesturehealthcare.event.GestureEvent;
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	import br.com.facdombosco.gesturehealthcare.model.gestures.GestureType;
	
	import mx.collections.ArrayCollection;
	import mx.controls.List;
	
	import spark.components.List;

	public class ProcedimentoPresentationModel extends BasePresentationModel
	{
		[Bindable]
		private var _atendimentoArrayCollection : ArrayCollection;
		
		private var _list : spark.components.List;
		
		[EventHandler(event="PacienteEvent.VER_PROCEDIMENTOS")]
		public function verProcedimentos(pacienteEvent : PacienteEvent) : void
		{
			var pacienteEventBuscarProcedimento : PacienteEvent = new PacienteEvent(PacienteEvent.BUSCAR_PROCEDIMENTOS);
			pacienteEventBuscarProcedimento.paciente = pacienteEvent.paciente;
			
			super.dispatcher.dispatchEvent(pacienteEventBuscarProcedimento);
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function swipeRigth(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.SWIPE_RIGTH && super.isViewMasterActive("ProcedimentoView"))
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
			if (gestureEvent.gestureType == GestureType.SWIPE_LEFT && super.isViewMasterActive("ProcedimentoView"))
			{
				this.list.selectedIndex = this.list.selectedIndex - 1;
				this.list.ensureIndexIsVisible(this.list.selectedIndex);	
			}
		}
		
		public function get list() : spark.components.List
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