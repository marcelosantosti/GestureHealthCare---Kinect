package br.com.facdombosco.gesturehealthcare.model.presentation.impl
{
	import br.com.facdombosco.gesturehealthcare.controller.GestureController;
	import br.com.facdombosco.gesturehealthcare.event.GestureEvent;
	import br.com.facdombosco.gesturehealthcare.event.KinectImageEvent;
	import br.com.facdombosco.gesturehealthcare.event.KinectUserEvent;
	import br.com.facdombosco.gesturehealthcare.model.gestures.GestureType;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.IGesturePart;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.pinch.PinchGesturePart1;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.pinch.PinchGesturePart2;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.point.PointRigthGesturePart;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.raise.left.RaiseLeftGesturePart;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.raise.rigth.RaiseRigthGesturePart;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.scroll.down.ScrollDownGesturePart1;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.scroll.down.ScrollDownGesturePart2;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.spread.SpreadGesturePart1;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.spread.SpreadGesturePart2;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.strech.left.StrechLeftGesturePart;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.strech.right.StrechRigthGesturePart;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.swipe.left.SwipeLeftGesturePart1;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.swipe.left.SwipeLeftGesturePart2;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.swipe.left.SwipeLeftGesturePart3;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.swipe.rigth.SwipeRigthGesturePart1;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.swipe.rigth.SwipeRigthGesturePart2;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.swipe.rigth.SwipeRigthGesturePart3;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.wave.rigth.WaveRigthGesturePart1;
	import br.com.facdombosco.gesturehealthcare.model.gestures.gestureparts.wave.rigth.WaveRigthGesturePart2;
	import br.com.facdombosco.gesturehealthcare.model.presentation.IHomeViewPresentationModel;
	import br.com.facdombosco.gesturehealthcare.model.util.SuperViewNavigator;
	import br.com.facdombosco.gesturehealthcare.model.vo.Cirurgia;
	import br.com.facdombosco.gesturehealthcare.view.CirurgiaView;
	import br.com.facdombosco.gesturehealthcare.view.ExameView;
	import br.com.facdombosco.gesturehealthcare.view.HomeView;
	
	import com.as3nui.nativeExtensions.air.kinect.Kinect;
	import com.as3nui.nativeExtensions.air.kinect.KinectSettings;
	import com.as3nui.nativeExtensions.air.kinect.data.User;
	import com.as3nui.nativeExtensions.air.kinect.events.CameraImageEvent;
	import com.as3nui.nativeExtensions.air.kinect.events.UserEvent;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import spark.components.ViewNavigator;

	public class HomeViewPresentationModel extends BasePresentationModel implements IHomeViewPresentationModel
	{
		private var _kinect : Kinect;
		
		[Inject(source="gestureController")]
		public var gestureController : GestureController;
		
		[Bindable]
		private var _maoDireita : String;
		
		[Inject]
		public var cirurgiaPresentationModel : CirurgiaPresentationModel;
		
		public function iniciarKinect() : void
		{
			NativeApplication.nativeApplication.addEventListener(Event.EXITING, onExiting);
			
			/*if(Kinect.isSupported() && this._kinect == null)
			{
				this._kinect = Kinect.getDevice();
				
				var kinectSettings : KinectSettings = new KinectSettings();
				kinectSettings.skeletonEnabled = true;
				kinectSettings.rgbEnabled = true;
				kinectSettings.depthEnabled = true;
				kinectSettings.depthShowUserColors = true;
				this._kinect.addEventListener(UserEvent.USERS_UPDATED, onUsersUpdated);
				this._kinect.addEventListener(CameraImageEvent.DEPTH_IMAGE_UPDATE, onDepthImageUpdate);
				this._kinect.start(kinectSettings);
				this.defineGestures();
			}*/
		}
		
		public function setarSuperViewNavigator(viewNavigator : ViewNavigator) : void
		{
			SuperViewNavigator.viewNavigator = viewNavigator;
		}
		
		[EventHandler(event="GestureEvent.GESTURE_RECOGNISED")]
		public function gestureRecognised(gestureEvent : GestureEvent) : void
		{
			if (gestureEvent.gestureType == GestureType.POINT_RIGTH && super.isViewActive("HomeView"))
				this.verCirurgias();
			
			if (gestureEvent.gestureType == GestureType.WAVE_RIGTH && !super.isViewMasterActive("ExameImagemView2"))
				NativeApplication.nativeApplication.exit();
			
			if (gestureEvent.gestureType == GestureType.RAISE_LEFT)
			{
				if (super.isViewActive("CirurgiaView"))
				{
					SuperViewNavigator.viewNavigator.pushView(HomeView);	
				}
				else
				{
					if (super.isViewActive("ProntuarioView"))
					{
						if (!super.isViewMasterActive("ExameImagemView2"))
							SuperViewNavigator.viewNavigator.pushView(CirurgiaView);
						else
							this.viewNavigator.pushView(ExameView);
					}
				}
			}
		}
		
		public function verCirurgias() : void
		{
			SuperViewNavigator.viewNavigator.pushView(CirurgiaView);
		}
		
		public function onExiting(event : Event) : void
		{
			this._kinect.removeEventListener(UserEvent.USERS_UPDATED, onUsersUpdated);
			this._kinect.removeEventListener(UserEvent.USERS_UPDATED, onDepthImageUpdate);
			this._kinect.stop();
			this._kinect = null;
		}
		
		private function onUsersUpdated(event : UserEvent) : void
		{
			if (event.users.length > 0)
			{
				this.gestureController.updateAllGestures(event.users[0]);
				
				var kinectUserEvent : KinectUserEvent = new KinectUserEvent(KinectUserEvent.USER_UPDATED);
				kinectUserEvent.user = event.users[0];
				super.dispatcher.dispatchEvent(kinectUserEvent);
			}
		}
		
		private function onDepthImageUpdate(event : CameraImageEvent) : void
		{
			var kinectImageEvent : KinectImageEvent = new KinectImageEvent(KinectImageEvent.IMAGE_UPDATED);
			kinectImageEvent.kinectImage = event.imageData;
			this.dispatcher.dispatchEvent(kinectImageEvent);
		}
		
		[Bindable]
		public function get maoDireita() : String
		{
			return this._maoDireita;
		}
		
		public function set maoDireita(maoDireita : String) : void
		{
			this._maoDireita = maoDireita;
		}
		
		private function defineGestures() : void
		{
			var pointRigthGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			pointRigthGesturePart.push(new PointRigthGesturePart());
			this.gestureController.addGesture(GestureType.POINT_RIGTH, pointRigthGesturePart);
			
			var raiseLeftGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			raiseLeftGesturePart.push(new RaiseLeftGesturePart());
			this.gestureController.addGesture(GestureType.RAISE_LEFT, raiseLeftGesturePart);
			
			var raiseRigthGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			raiseRigthGesturePart.push(new RaiseRigthGesturePart());
			this.gestureController.addGesture(GestureType.RAISE_RIGTH, raiseRigthGesturePart);
			
			var swipeLeftGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			swipeLeftGesturePart.push(new SwipeLeftGesturePart1());
			swipeLeftGesturePart.push(new SwipeLeftGesturePart2());
			swipeLeftGesturePart.push(new SwipeLeftGesturePart3());
			this.gestureController.addGesture(GestureType.SWIPE_LEFT, swipeLeftGesturePart);
			
			var swipeRigthGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			swipeRigthGesturePart.push(new SwipeRigthGesturePart1());
			swipeRigthGesturePart.push(new SwipeRigthGesturePart2());
			swipeRigthGesturePart.push(new SwipeRigthGesturePart3());
			this.gestureController.addGesture(GestureType.SWIPE_RIGTH, swipeRigthGesturePart);
			
			var waveRigthGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			waveRigthGesturePart.push(new WaveRigthGesturePart1());
			waveRigthGesturePart.push(new WaveRigthGesturePart2());
			waveRigthGesturePart.push(new WaveRigthGesturePart1());
			waveRigthGesturePart.push(new WaveRigthGesturePart2());
			waveRigthGesturePart.push(new WaveRigthGesturePart1());
			waveRigthGesturePart.push(new WaveRigthGesturePart2());
			this.gestureController.addGesture(GestureType.WAVE_RIGTH, waveRigthGesturePart);
			
			var strechLeftGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			strechLeftGesturePart.push(new StrechLeftGesturePart());
			this.gestureController.addGesture(GestureType.STRECH_LEFT, strechLeftGesturePart);
			
			var strechRigthGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			strechRigthGesturePart.push(new StrechRigthGesturePart());
			this.gestureController.addGesture(GestureType.STRECH_RIGTH, strechRigthGesturePart);
			
			var spreadGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			spreadGesturePart.push(new SpreadGesturePart1());
			spreadGesturePart.push(new SpreadGesturePart2());
			this.gestureController.addGesture(GestureType.SPREAD, spreadGesturePart);
			
			var pinchGesturePart : Vector.<IGesturePart> = new Vector.<IGesturePart>();
			pinchGesturePart.push(new PinchGesturePart1());
			pinchGesturePart.push(new PinchGesturePart2());
			this.gestureController.addGesture(GestureType.PINCH, pinchGesturePart);
		}
	}
}