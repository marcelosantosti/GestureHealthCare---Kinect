package br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.scroll.down
{
	import br.com.facdombosco.gesturehealthcare.model.gestures.GesturePartResult;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.IGesturePart;
	
	import com.as3nui.nativeExtensions.air.kinect.data.User;

	public class ScrollDownGesturePart2 implements IGesturePart
	{
		public function checkGesture(user : User) : int
		{
			if (user.rightHand.positionRelative.z < user.leftElbow.positionRelative.z && user.leftHand.positionRelative.y < user.leftHip.positionRelative.y)
			{
				if (user.rightHand.positionRelative.y < user.head.positionRelative.z && user.rightHand.positionRelative.y > user.leftHip.positionRelative.y)
				{	
					if (user.leftHand.positionRelative.y < user.leftElbow.positionRelative.y)
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