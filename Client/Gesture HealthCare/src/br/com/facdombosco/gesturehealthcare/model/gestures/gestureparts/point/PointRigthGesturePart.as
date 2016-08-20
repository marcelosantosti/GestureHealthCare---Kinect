package br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.point
{
	import br.com.facdombosco.gesturehealthcare.model.gestures.GesturePartResult;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.IGesturePart;
	
	import com.as3nui.nativeExtensions.air.kinect.data.User;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class PointRigthGesturePart implements IGesturePart
	{
		private var _timer : Timer;
		private var _seconds : int;
		
		public function checkGesture(user : User) : int
		{	
			if (user.rightHand.positionRelative.z < user.head.positionRelative.z - 0.40)
			{
				if (this._timer == null)
				{
					this._seconds = 0;
					this._timer = new Timer(1000);
					this._timer.start();
					this._timer.addEventListener(TimerEvent.TIMER, onTimer);
				}
				
				if (this._seconds >= 1)
				{
					this.removerTimer();
					return GesturePartResult.SUCEED;	
				}
				else
				{
					return GesturePartResult.PAUSING;	
				}
			}
			else
			{
				this.removerTimer();
				return GesturePartResult.FAIL;	
			}
		}
		
		private function removerTimer() : void
		{
			if (this._timer != null)
			{
				this._seconds = 0;
				this._timer.stop();
				this._timer.removeEventListener(TimerEvent.TIMER, onTimer);
				this._timer = null;
			}
		}
		
		private function onTimer(timerEvent : TimerEvent) : void
		{
			if (this._seconds > 2)
				this._seconds = 0;
			else
				this._seconds = this._seconds + 1;
		}
	}
}