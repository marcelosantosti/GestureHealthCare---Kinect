package br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.pinch
{
	import br.com.facdombosco.gesturehealthcare.model.gestures.GesturePartResult;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.IGesturePart;
	
	import com.as3nui.nativeExtensions.air.kinect.data.User;

	public class PinchGesturePart2 implements IGesturePart
	{
		public function checkGesture(user : User) : int
		{
			if (user.rightHand.positionRelative.z < user.leftElbow.positionRelative.z)
			{
				if (user.rightHand.positionRelative.y < user.head.positionRelative.y && user.rightHand.positionRelative.y > user.leftHip.positionRelative.y)
				{
					if (user.rightHand.positionRelative.x < user.rightShoulder.positionRelative.x - 0.10
						&& user.leftHand.positionRelative.x < user.rightShoulder.positionRelative.x + 0.10)
					{
						return GesturePartResult.SUCEED;
					}
					
					return GesturePartResult.PAUSING;
				}
				
				return GesturePartResult.FAIL;
			}
			
			return GesturePartResult.FAIL;
		}
	}
}