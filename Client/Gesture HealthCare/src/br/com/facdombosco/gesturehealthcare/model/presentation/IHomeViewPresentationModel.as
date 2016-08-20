package br.com.facdombosco.gesturehealthcare.model.presentation
{
	import com.as3nui.nativeExtensions.air.kinect.Kinect;
	
	import spark.components.ViewNavigator;

	public interface IHomeViewPresentationModel
	{
		function iniciarKinect() : void;
		function verCirurgias() : void;
		
		function get maoDireita() : String;
		function set maoDireita(maoDireita : String) : void;
		
		function setarSuperViewNavigator(viewNavigator : ViewNavigator) : void;
	}
}