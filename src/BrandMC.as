package  {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	
	public class BrandMC extends Sprite
	{
		private var stateMachine:StateMachine;
		
		public function BrandMC()
		{
			stateMachine = new StateMachine(this);
			stateMachine.AddTransition("Login", transitToLogin);
			stateMachine.AddTransition("Brand", transitToBrand);
			stateMachine.AddTransition("Car", transitToCar);
			stateMachine.AddTransition("Detail", transitToDetail);
			
			StateManager.AddObserver(stateMachine);
			for(var i:uint; i<16; i++)
			{
				this["bmc"+i].addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				this["bmc"+i].addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				this["bmc"+i].addEventListener(MouseEvent.CLICK, onClick);
				this["bmc"+i].cacheAsBitmap = true;
				this["bmc"+i].cacheAsBitmapMatrix = new Matrix();	
			}
		}
		public function onClick(event:MouseEvent):void
		{
			StateManager.TransitState("Car");									  
		}
		public function onMouseOut(event:MouseEvent):void
		{
			trace("BrandMC:onMouseOut");
			event.target.scaleX = 1;
			event.target.scaleY = 1;
		}
		public function onMouseOver(event:MouseEvent):void
		{
			trace("BrandMC:onMouseOver");
			event.target.scaleX = 1.3;
			event.target.scaleY = 1.3;
			
			//StateManager.TransitState("Brand");
		}
		
		public function transitToCar():void
		{
			trace("BrandMC:transitToCar");
			this.visible = false;
		}
		public function transitToDetail():void
		{
			trace("BrandMC:transitToDetail");
			this.visible = false;
		}
		public function transitToLogin():void
		{
			trace("BrandMC:transitToLogin");
			this.visible = false;
		}
		public function transitToBrand():void
		{
			trace("BrandMC:transitToBrand");
			this.x = 512;
			this.y = 384;
			this.visible = true;

		}
	}
	
}
