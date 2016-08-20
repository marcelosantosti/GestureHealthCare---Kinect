package br.com.facdombosco.gesturehealthcare.model.presentation.impl
{
	import br.com.facdombosco.gesturehealthcare.event.LaudoEvent;
	import br.com.facdombosco.gesturehealthcare.event.LaudoViewStackEvent;
	import br.com.facdombosco.gesturehealthcare.event.PacienteEvent;
	import br.com.facdombosco.gesturehealthcare.model.vo.Laudo;
	import br.com.facdombosco.gesturehealthcare.view.components.LaudoImagemComponent;
	
	import com.adobe.wheelerstreet.fig.panzoom.ImageViewer;
	
	import mx.containers.Box;
	import mx.containers.Canvas;
	import mx.containers.ViewStack;
	
	import spark.components.Group;
	import spark.components.Label;

	public class LaudoPresentationModel extends BasePresentationModel
	{
		[EventHandler(event="PacienteEvent.VER_LAUDOS")]
		public function verLaudos(pacienteEvent :  PacienteEvent) : void
		{
			var pacienteEventBuscarLaudos : PacienteEvent = new PacienteEvent(PacienteEvent.BUSCAR_LAUDOS);
			pacienteEventBuscarLaudos.paciente = pacienteEvent.paciente;
			super.dispatcher.dispatchEvent(pacienteEventBuscarLaudos);
		}
	}
}