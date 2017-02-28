package
{
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class LoginWinMC extends Sprite
	{
		private var stateMachine:StateMachine;
		
		public function LoginWinMC()
		{
			stateMachine = new StateMachine(this);
			stateMachine.AddTransition("Login", transitToLogin);
			stateMachine.AddTransition("Brand", transitToBrand);
			stateMachine.AddTransition("Car", transitToCar);
			stateMachine.AddTransition("Detail", transitToDetail);
			StateManager.AddObserver(stateMachine);
			
			this.filters = [new DropShadowFilter()];
			this.cacheAsBitmap = true;
			this.cacheAsBitmapMatrix = new Matrix();
			
			this.btnLogin.addEventListener(MouseEvent.CLICK, onBtnLoginClick);
		}
		
		public function onBtnLoginClick(event:MouseEvent):void
		{
			trace("onBtnLoginClick");
			StateManager.TransitState("Brand");
		}
		
		public function transitToCar():void
		{
			trace("BrandMC:transitToCar");
			this.visible = false;
		}
		public function transitToDetail():void
		{
			trace("LoginWinMC:transitToDetail");
			this.visible = false;
		}
		public function transitToLogin():void
		{
			this.x = 512-this.width/2;
			this.y = 384-this.height/2;
			trace("LoginWinMC:transitToLogin");
			this.visible = true;
		}
		public function transitToBrand():void
		{
			trace("LoginWinMC:transitToBrand");
			this.visible = false;
		}
	}
}