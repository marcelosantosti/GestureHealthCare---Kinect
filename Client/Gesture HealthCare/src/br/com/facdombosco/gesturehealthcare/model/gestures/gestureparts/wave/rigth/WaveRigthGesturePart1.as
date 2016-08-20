package br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.wave.rigth
{
	import br.com.facdombosco.gesturehealthcare.model.gestures.GesturePartResult;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.IGesturePart;
	
	import com.as3nui.nativeExtensions.air.kinect.data.User;

	public class WaveRigthGesturePart1 implements IGesturePart
	{
		public function checkGesture(user : User) : int
		{
			if (user.rightHand.positionRelative.y  > user.rightElbow.positionRelative.y)
			{
				if (user.rightHand.positionRelative.x  > user.rightElbow.positionRelative.x)
				{
					return GesturePartResult.SUCEED;
				}
				
				return GesturePartResult.PAUSING;
			}
			
			return GesturePartResult.FAIL;
		}
	}
}