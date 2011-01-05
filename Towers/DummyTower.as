package Towers 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author myuu
	 */
	public class DummyTower extends Sprite implements ITower
	{
		private var m_design : Sprite;
		
		public function DummyTower() 
		{
			addChild(m_design = new Design_Mag00());
		}		
	}
}