package br.com.facdombosco.gesturehealthcare.model.presentation.impl
{
	import br.com.facdombosco.gesturehealthcare.event.CirurgiaEvent;
	import br.com.facdombosco.gesturehealthcare.event.GestureEvent;
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	import br.com.facdombosco.gesturehealthcare.model.gestures.GestureType;
	import br.com.facdombosco.gesturehealthcare.model.util.ItemProntuarioType;
	import br.com.facdombosco.gesturehealthcare.model.util.SuperViewNavigator;
	import br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia;
	import br.com.facdombosco.gesturehealthcare.model.vo.Paciente;
	import br.com.facdombosco.gesturehealthcare.view.DiagnosticoView;
	import br.com.facdombosco.gesturehealthcare.view.ExameImagemView;
	import br.com.facdombosco.gesturehealthcare.view.ExameImagemView2;
	import br.com.facdombosco.gesturehealthcare.view.ExameView;
	import br.com.facdombosco.gesturehealthcare.view.ProcedimentoView;
	
	import spark.components.ViewNavigator;

	public class ProntuarioPresentationModel extends BasePresentationModel
	{
		[Bindable]
		private var _cirurgia : Cirurgia;
		
		[Bindable]
		private var _itemProntuarioSelecionado : int;
		
		private var _viewNavigatorDetail : ViewNavigator;
		
		[EventHandler(event="CirurgiaEvent.VER_PRONTUARIO")]
		public function verProntuario(cirurgiaEvent : CirurgiaEvent) : void
		{
			this.cirurgia = cirurgiaEvent.cirurgia;
			this.verExames();
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function strechRigth(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.STRECH_RIGTH && super.isViewActive("ProntuarioView") && !super.isViewMasterActive("ExameImagemView2"))
			{
				if (this._itemProntuarioSelecionado == ItemProntuarioType.EXAME)
					this.verProcedimentos(this.viewNavigatorDetail);
				else
				{
					if (this._itemProntuarioSelecionado == ItemProntuarioType.PROCEDIMENTO)
						this.verDiagnosticos(this.viewNavigatorDetail);	
				}
			}
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function strechLeft(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.STRECH_LEFT && super.isViewActive("ProntuarioView") && !super.isViewMasterActive("ExameImagemView2"))
			{
				if (this._itemProntuarioSelecionado == ItemProntuarioType.PROCEDIMENTO)
					this.verExamesView(this.viewNavigatorDetail);
				else
				{
					if (this._itemProntuarioSelecionado == ItemProntuarioType.DIAGNOSTICO)
						this.verProcedimentos(this.viewNavigatorDetail);	
				}
			}
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function raiseRigth(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.RAISE_RIGTH && super.isViewActive("ProntuarioView") && !super.isViewMasterActive("ExameImagemView2"))
			{
				if (this._itemProntuarioSelecionado == ItemProntuarioType.EXAME)
				{
					var pacienteEvent : PacienteEvent = new PacienteEvent(PacienteEvent.VER_LAUDOS);
					pacienteEvent.paciente = this.cirurgia._Atendimento._Paciente;
					super.dispatcher.dispatchEvent(pacienteEvent);
					
					this.viewNavigatorDetail.pushView(ExameImagemView2);
					//this.viewNagivatorDetail.pushView(ExameImagemView);
				}
			}
		}
		
		public function verExamesView(viewNavigator : ViewNavigator) : void
		{
			this.verExames();
			
			this.viewNavigator.pushView(ExameView);
		}
		
		public function verExames() : void
		{
			var pacienteEvent : PacienteEvent = new PacienteEvent(PacienteEvent.VER_EXAMES);
			pacienteEvent.paciente = this.cirurgia._Atendimento._Paciente;
			this._itemProntuarioSelecionado = ItemProntuarioType.EXAME;
			
			super.dispatcher.dispatchEvent(pacienteEvent);
		}
		
		public function verProcedimentos(viewNavigator : ViewNavigator) : void
		{
			var pacienteEvent : PacienteEvent = new PacienteEvent(PacienteEvent.VER_PROCEDIMENTOS);
			pacienteEvent.paciente = this.cirurgia._Atendimento._Paciente;
			this._itemProntuarioSelecionado = ItemProntuarioType.PROCEDIMENTO;
			
			super.dispatcher.dispatchEvent(pacienteEvent);
			
			viewNavigator.pushView(ProcedimentoView);
		}
		
		public function verDiagnosticos(viewNavigator : ViewNavigator) : void
		{
			var pacienteEvent : PacienteEvent = new PacienteEvent(PacienteEvent.VER_DIAGNOSTICOS);
			pacienteEvent.paciente = this.cirurgia._Atendimento._Paciente;
			this._itemProntuarioSelecionado = ItemProntuarioType.DIAGNOSTICO;
			
			super.dispatcher.dispatchEvent(pacienteEvent);
			
			viewNavigator.pushView(DiagnosticoView);
		}
		
		public function get viewNavigatorDetail() : ViewNavigator
		{
			return this._viewNavigatorDetail;
		}
		
		public function set viewNavigatorDetail(viewNavigatorDetail : ViewNavigator) : void
		{
			this._viewNavigatorDetail = viewNavigatorDetail;
		}
		
		[Bindable]
		public function get cirurgia() : Cirurgia
		{
			return this._cirurgia;
		}
		
		public function set cirurgia(cirurgia : Cirurgia) : void
		{
			this._cirurgia = cirurgia;
		}
	}
}