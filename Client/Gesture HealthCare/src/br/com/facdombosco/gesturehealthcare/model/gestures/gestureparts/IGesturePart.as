package br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts
{
	import br.com.facdombosco.gesturehealthcare.model.gestures.GesturePartResult;
	
	import com.as3nui.nativeExtensions.air.kinect.data.User;

	public interface IGesturePart
	{
		function checkGesture(user : User) : int;
	}
}