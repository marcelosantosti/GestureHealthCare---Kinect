package br.com.facdombosco.gesturehealthcare.model.gestures
{
	import br.com.facdombosco.gesturehealthcare.event.GestureEvent;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.IGesturePart;
	
	import com.as3nui.nativeExtensions.air.kinect.data.User;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;

	public class Gesture extends EventDispatcher 
	{
		private var _gestureType : int;
		private var _gesturePart : Vector.<IGesturePart>;
		private var _currentGesturePart : int = 0;
		private var _paused : Boolean = false;
		private var _pausedFrameCount : int = 10;
		private var _frameCount : int = 0;
		
		private var _eventDispatcher : IEventDispatcher;
		
		public function Gesture(gestureType : int, gesturePart : Vector.<IGesturePart>, eventDispatcher : IEventDispatcher) : void
		{
			this._gestureType = gestureType;
			this._gesturePart = gesturePart;
			this._eventDispatcher = eventDispatcher;
		}
		
		public function updateGesture(user : User) : void
		{
			if (this._paused)
			{
				if (this._frameCount == this._pausedFrameCount)
					this._paused = false;
				
				this._frameCount++;
			}
			
			var gesturePartResult : int = this._gesturePart[this._currentGesturePart].checkGesture(user);
			if (gesturePartResult == GesturePartResult.SUCEED)
			{
				if (this._currentGesturePart + 1 < this._gesturePart.length)
				{
					this._currentGesturePart++;
					this._frameCount = 0;
					this._pausedFrameCount = 10;
					this._paused = true;
				}
				else
				{
					var gestureEvent : GestureEvent = new GestureEvent(GestureEvent.GESTURE_RECOGNISED);
					gestureEvent.gestureType = this._gestureType;
					this._eventDispatcher.dispatchEvent(gestureEvent);
					this.reset();
				}
			}
			else if (gesturePartResult == GesturePartResult.FAIL || this._frameCount == 50)
			{
				this._currentGesturePart = 0;
				this._frameCount = 0;
				this._pausedFrameCount = 5;
				this._paused = true;
			}
			else
			{
				this._frameCount++;
				this._pausedFrameCount = 5;
				this._paused = true;
			}
		}
		
		public function reset() : void
		{
			this._currentGesturePart = 0;
			this._frameCount = 0;
			this._pausedFrameCount = 5;
			this._paused = true;
		}
	}
}