package br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.scroll.down
{
	import br.com.facdombosco.gesturehealthcare.model.gestures.GesturePartResult;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.IGesturePart;
	
	import com.as3nui.nativeExtensions.air.kinect.data.User;

	public class ScrollDownGesturePart1 implements IGesturePart
	{
		public function checkGesture(user : User) : int
		{
			if (user.rightHand.positionRelative.z < user.leftElbow.positionRelative.z && user.leftHand.positionRelative.y < user.leftHip.positionRelative.y)
			{
				if (user.rightHand.positionRelative.y < user.head.positionRelative.z && user.rightHand.positionRelative.y > user.leftHip.positionRelative.y)
				{
					trace(user.leftHand.positionRelative.x + " - " + (user.leftElbow.positionRelative.x - 0.45).toString());
					if (user.leftHand.positionRelative.x < user.leftElbow.positionRelative.x - 0.45)
					{
						trace("MAIOR");
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