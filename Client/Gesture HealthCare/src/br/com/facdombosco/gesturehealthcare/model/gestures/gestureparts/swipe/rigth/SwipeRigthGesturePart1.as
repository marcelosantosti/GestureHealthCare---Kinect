package br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.swipe.rigth
{
	import br.com.facdombosco.gesturehealthcare.model.gestures.GesturePartResult;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.IGesturePart;
	
	import com.as3nui.nativeExtensions.air.kinect.data.User;

	public class SwipeRigthGesturePart1 implements IGesturePart
	{
		public function checkGesture(user : User) : int
		{
			if (user.leftHand.positionRelative.z < user.leftElbow.positionRelative.z && user.rightHand.positionRelative.y < user.leftHip.positionRelative.y)
			{
				if (user.leftHand.positionRelative.y < user.head.positionRelative.y && user.leftHand.positionRelative.y > user.leftHip.positionRelative.y)
				{
					if (user.leftHand.positionRelative.x < user.leftShoulder.positionRelative.y)
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