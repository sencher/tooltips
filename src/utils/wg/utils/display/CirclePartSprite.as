package utils.wg.utils.display
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.utils.setTimeout;

	public class CirclePartSprite extends Sprite
	{
		private var _radius:int;
		private var _angle:int;
		private var _maxAngle:int;
		private var _minAngle:int;
		private var _colorFill:uint = 0xFF0000;
		private var _alphaFill:Number = 0.5;
		private var _showRadius:Boolean;

		private var _fillTime:int = 0;
		private var _isInit:Boolean;
		private var _timeAngle:int;
		private var _startPoint:Point = new Point(0, 0);

		public function CirclePartSprite(radius:int = 1, angle:int = 360, maxAngle:int = 360, minAngle:int = 0):void
		{
			_radius = radius;
			_maxAngle = maxAngle;
			_minAngle = minAngle;
			_angle = angle;
			_timeAngle = angle;
		}


		private function updateView():void
		{
			var i:int;

			graphics.clear();
			graphics.moveTo(_startPoint.x, _startPoint.y);
			graphics.beginFill(_colorFill, _alphaFill);

			for(i = _minAngle; i <= _timeAngle; i++)
			{
				if(i > _maxAngle) break;

				graphics.lineTo(-_radius * Math.sin(i * Math.PI / 180), -_radius * Math.cos(i * Math.PI / 180));
			}

			graphics.lineTo(0, 0);

			if(_showRadius)
			{
				graphics.lineStyle(1, 0x000000);
				graphics.moveTo(0, -_radius);
				graphics.lineTo(0, _radius);

				graphics.moveTo(-_radius, 0);
				graphics.lineTo((_timeAngle > 180 ? _radius : 0), 0);
			}
		}

		public function updateRadius(pointA:Point, pointB:Point, pointC:Point):void
		{
			var p:int;
			var result:int;
			var degres:Number;
			var distA:int = Point.distance(pointB, pointC);
			var distB:int = Point.distance(pointC, pointA);
			var distC:int = Point.distance(pointA, pointB);

			p = 0.5 *(distA + distB + distC);

			result = (distA * distB * distC) / (4 * Math.sqrt (p *(p - distA) * (p - distB) * (p - distC)));

			degres = Math.atan2(result - pointA.x, pointC.y - pointA.y);
			degres += degres < 0 ? Math.PI*2 : 0;
			_minAngle = degres * 180 / Math.PI;

			degres = Math.atan2(result - pointB.x, pointC.y - pointB.y);
			degres += degres < 0 ? Math.PI*2 : 0;
			_maxAngle = degres * 180 / Math.PI;

			radius = result;
		}

		private function updateToTimeView():void
		{
			var step:int = 5;

			if(_angle != _timeAngle)
			{
				_timeAngle += 	_timeAngle < _angle ?
					_timeAngle + step > _angle ? _angle - _timeAngle : step :
					_timeAngle - step < _angle ? -(_timeAngle - _angle) : -step;

				updateView();

				setTimeout(updateToTimeView, _fillTime / 360);
			}
		}


		public function get radius():int
		{
			return _radius;
		}

		public function set radius(value:int):void
		{
			_radius = value;

			updateView();
		}

		public function get angle():int
		{
			return _angle;
		}

		public function set angle(value:int):void
		{
			if(value == _angle && _isInit) return;

			_angle = value > _maxAngle ? _maxAngle : value;

			_timeAngle = !_isInit || _fillTime == 0 ? _angle : _timeAngle;

			if(!_isInit || _fillTime == 0)
			{
				updateView();
			}else
			{
				updateToTimeView();
			}

			_isInit = true;
		}

		public function get colorFill():uint
		{
			return _colorFill;
		}

		public function set colorFill(value:uint):void
		{
			_colorFill = value;

			updateView();
		}

		public function get alphaFill():Number
		{
			return _alphaFill;
		}

		public function set alphaFill(value:Number):void
		{
			_alphaFill = value;
		}

		public function get percent():int
		{
			return _angle * 100 / _maxAngle;
		}

		public function set percent(value:int):void
		{
			angle = _minAngle +  value * (_maxAngle - _minAngle) / 100;
		}

		public function set showRadius(value:Boolean):void
		{
			_showRadius = value;

			updateView();
		}

		public function get fillTime():int
		{
			return _fillTime;
		}

		/**
		 *
		 * @param value - time full fill circle
		 */
		public function set fillTime(value:int):void
		{
			value = value < 0 ? 0 : value;

			_fillTime = value;
		}
	}
}
