package  {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.filters.DropShadowFilter;
	
	import org.osmf.media.MediaFactory;
	import org.osmf.media.URLResource;
	import org.osmf.media.MediaType;
	import org.osmf.media.MediaElement;
	import org.osmf.media.MediaPlayer;
	import org.osmf.media.DefaultMediaFactory;
	import org.osmf.containers.MediaContainer;	
	
	public class DetailMC extends Sprite
	{
		private static const 
			serverURL:String = "http://202.134.125.204:8500/mbs_content/uploads/",
			//serverURL:String = "http://192.168.0.232:8500/mbs_content/uploads/",
			//serverURL:String = "rtmp://solutions.grandtech.com.hk/vod/";
			contentToPlay:String = "shared/00000269/00000275/output/Zoozoo alien [www_441hz.keepvid";
			
		private var stateMachine:StateMachine,
		mf:MediaFactory,player:MediaPlayer,mCon:MediaContainer,element:MediaElement,res:URLResource;

		public function DetailMC() 
		{
			stateMachine = new StateMachine(this);
			stateMachine.AddTransition("Login", transitToLogin);
			stateMachine.AddTransition("Brand", transitToBrand);
			stateMachine.AddTransition("Car", transitToCar);
			stateMachine.AddTransition("Detail", transitToDetail);
			
			StateManager.AddObserver(stateMachine);
			
			mf = new DefaultMediaFactory();
			player = new MediaPlayer();
			mCon = new MediaContainer();
			addChild(mCon);
			mCon.width = 720;
			mCon.height = 576;
			mCon.x = 234;
			mCon.y = 160;
			
			btnBrand.addEventListener(MouseEvent.CLICK, onBrandClick);
			btnCar.addEventListener(MouseEvent.CLICK, onCarClick);
		}
		
		private function onCarClick(event:MouseEvent):void
		{
			StateManager.TransitState("Car");									  
		}
		private function onBrandClick(event:MouseEvent):void
		{
			StateManager.TransitState("Brand");									  
		}
		private function clearResource():void
		{
			if(player.playing){
				player.stop();
			}
			if(element != null){
				mCon.removeMediaElement(element);
			}
			element = null;
			res = null;			
		}
		private function playVideo():void
		{
			res = new URLResource(serverURL+contentToPlay);
			res.mediaType = MediaType.VIDEO;
			element = mf.createMediaElement(res);
			
			player.autoPlay = true;
			player.media = element;
			
			mCon.addMediaElement(element);
			trace("play");
		}
		
		public function transitToCar():void
		{
			clearResource();
			trace("DetailMC:transitToCar");
			this.visible = false;
		}
		public function transitToDetail():void
		{
			this.x = 0;
			this.y = 0;
			trace("DetailMC:transitToDetail");
			this.visible = true;
			playVideo();
		}
		public function transitToLogin():void
		{
			clearResource();
			trace("DetailMC:transitToLogin");
			this.visible = false;
		}
		public function transitToBrand():void
		{
			clearResource();
			trace("DetailMC:transitToBrand");
			this.visible = false;
		}
	}
	
}
