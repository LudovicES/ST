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



class Design_229_229_holder extends ActorScript
{          	
	
public var _hold:Actor;

public var _holding:Bool;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("hold", "_hold");
nameMap.set("holding", "_holding");
_holding = false;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void {
if(wrapper.enabled && sameAsAny(getActorGroup(9),event.otherActor.getType(),event.otherActor.getGroup())){
        if((!(_holding) && isKeyReleased("kick")))
{
            trace("" + "objet ramass~x00e9");
            _holding = true;
propertyChanged("_holding", _holding);
            _hold = event.otherActor;
propertyChanged("_hold", _hold);
}

        else if((_holding && isKeyReleased("kick")))
{
            _holding = false;
propertyChanged("_holding", _holding);
            _hold.setValue("item", "_dropping", true);
}

}
});
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(_holding)
{
            if(actor.getValue("2 Way Horizontal Movement", "_FacingRight"))
{
                _hold.setX(((actor.getXCenter() - (_hold.getWidth()/2)) + _hold.getValue("item", "_offsetx")));
}

            else
{
                _hold.setX(((actor.getXCenter() - (_hold.getWidth()/2)) - _hold.getValue("item", "_offsetx")));
}

            _hold.setY(((actor.getYCenter() - (_hold.getHeight()/2)) + _hold.getValue("item", "_offsety")));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}