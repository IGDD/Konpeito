package Towers 
{
	/**
	 * ...
	 * @author myuu
	 */
	public final class TowerFactory
	{
		public function TowerFactory() 
		{
		}
		
		public static function createTower(type : String) : ITower
		{
			switch (type)
			{
				case TowerTypes.DUMMY_TOWER:
				default:
					return new DummyTower();
					break;
			}
		}
	}
}