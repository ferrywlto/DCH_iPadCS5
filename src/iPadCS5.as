package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class iPadCS5 extends Sprite
	{
		var mcLoginWin:LoginWinMC;
		var mcBrand:BrandMC;
		var mcCar:SelectCarMC;
		var mcDetail:DetailMC;
		
		
		public function iPadCS5()
		{
			mcLoginWin = new LoginWinMC();
			mcBrand = new BrandMC();
			mcCar = new SelectCarMC();
			mcDetail = new DetailMC();
			
			StateManager.AddState("Login");
			StateManager.AddState("Brand");
			StateManager.AddState("Car");
			StateManager.AddState("Detail");
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(event:Event):void
		{
			trace("init");
			addChild(mcLoginWin);
			addChild(mcBrand);
			addChild(mcCar);
			addChild(mcDetail);
			StateManager.TransitState("Login");
		}
	}
}
