package scripts;

import com.stencyl.graphics.G;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;
import nme.display.BlendMode;
import nme.display.BitmapData;
import nme.display.Bitmap;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.events.TouchEvent;
import nme.net.URLLoader;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_301_301_dead extends ActorScript
{          	
	
public var _ghost:String;

public var _deadr:String;

public var _AmplitudeDescente:Float;

public var _deadl:String;

public var _deadi:String;

public var _step:Float;

public var _LayerDead:Float;

public var _AmortissementDescente:Float;

public var _StartX:Float;

public var _StartY:Float;

public var _BalancementDescente:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("ghost", "_ghost");
nameMap.set("dead-r", "_deadr");
nameMap.set("Amplitude Descente", "_AmplitudeDescente");
_AmplitudeDescente = 5.0;
nameMap.set("dead-l", "_deadl");
nameMap.set("dead-i", "_deadi");
nameMap.set("step", "_step");
_step = 0.0;
nameMap.set("Layer Dead", "_LayerDead");
_LayerDead = 0.0;
nameMap.set("Amortissement Descente", "_AmortissementDescente");
_AmortissementDescente = 20.0;
nameMap.set("Start X", "_StartX");
_StartX = 0.0;
nameMap.set("Start Y", "_StartY");
_StartY = 0.0;
nameMap.set("Balancement descente", "_BalancementDescente");
_BalancementDescente = 0.1;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((_step == 0))
{
            trace("" + "step0");
            _step = asNumber(1);
propertyChanged("_step", _step);
            actor.setAnimation("" + _ghost);
            actor.setLinearDamping(_AmortissementDescente);
            _StartX = asNumber(actor.getXCenter());
propertyChanged("_StartX", _StartX);
            _StartY = asNumber(actor.getYCenter());
propertyChanged("_StartY", _StartY);
}

        else if((_step == 1))
{
            if((actor.getScreenY() < (getScreenHeight() - 105)))
{
                actor.setX((_StartX + ((_AmplitudeDescente * Math.sin((_BalancementDescente * (actor.getYCenter() - _StartY)))) - (actor.getWidth()/2))));
}

            else
{
                _step = asNumber(2);
propertyChanged("_step", _step);
                actor.moveToLayer(_LayerDead);
                actor.setAnimation("" + _deadi);
                actor.setLinearDamping(0);
                runLater(1000 * 2, function(timeTask:TimedTask):Void {
                            _step = asNumber(2);
propertyChanged("_step", _step);
                            actor.makeAlwaysSimulate();
}, actor);
}

}

        else if((_step == 3))
{
            if((actor.getXCenter() < (getScreenX() - 0)))
{
                actor.setXVelocity(-5);
}

            else if((actor.getXCenter() > (getScreenX() + 0)))
{
                actor.setXVelocity(5);
}

            else
{
                actor.setXVelocity(0);
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}