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



class SceneEvents_8 extends SceneScript
{          	
	
public var _Jumpertype:ActorType;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Jumper_type", "_Jumpertype");

	}
	
	override public function init()
	{
		            getActor(5).setIgnoreGravity(!false);
        _Jumpertype = getActorType(432);
propertyChanged("_Jumpertype", _Jumpertype);
            getActor(11).setAnimation("" + "2");
        getActor(10).setAnimation("" + "3");
        getActor(12).setAnimation("" + "2");
        getActor(9).setAnimation("" + "3");
        getActor(13).setAnimation("" + "2");
    addKeyStateListener("kick", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && pressed){
        if((isInRegion(getActor(27), getRegion(0)) && getActor(5).isOnScreen()))
{
            trace("" + "gravityok");
            getActor(5).setIgnoreGravity(!true);
            getActor(4).moveBy(3, 0, 0.1, Expo.easeInOut);
            runLater(1000 * 0.1, function(timeTask:TimedTask):Void {
                        getActor(4).moveTo(760, 26, 0.1, Expo.easeInOut);
}, null);
}

}
});
    addKeyStateListener("reload", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && pressed){
        reloadCurrentScene(null,createCrossfadeTransition((1)));
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}