package threeDimen.advancedStage {
	import laya.d3.core.BaseCamera;
	import laya.d3.core.MeshSprite3D;
	import laya.d3.core.Sprite3D;
	import laya.d3.core.TransformUV;
	import laya.d3.core.VRCamera;
	import laya.d3.core.material.BaseMaterial;
	import laya.d3.core.material.StandardMaterial;
	import laya.d3.core.render.RenderState;
	import laya.d3.core.scene.BaseScene;
	import laya.d3.core.scene.VRScene;
	import laya.d3.math.Vector2;
	import laya.d3.math.Vector3;
	import laya.d3.math.Vector4;
	import laya.d3.math.Viewport;
	import laya.d3.resource.TextureCube;
	import laya.d3.resource.models.BaseMesh;
	import laya.d3.resource.models.SkyBox;
	import laya.display.Stage;
	import laya.events.Event;
	import laya.net.Loader;
	import laya.resource.Texture;
	import laya.utils.ClassUtils;
	import laya.utils.Handler;
	import laya.utils.Stat;
	import threeDimen.common.VRCameraMoveScript;
	
	/** @private */
	public class D3Advance_SimpleSceneVRSample {
		
		public function D3Advance_SimpleSceneVRSample() {
			Laya3D.init(0, 0);
			Laya.stage.scaleMode = Stage.SCALE_FULL;
			Laya.stage.screenMode = Stage.SCREEN_HORIZONTAL;
			Stat.show();
			
			var scene:VRScene = Laya.stage.addChild(new VRScene()) as VRScene;
			
			var camera:VRCamera = new VRCamera(0.03, 0, 0, 0.1, 100);
			camera = (scene.addChild(camera)) as VRCamera;
			camera.transform.translate(new Vector3(0.3, 0.3, 0.6));
			camera.transform.rotate(new Vector3(-12, 0, 0), true, false);
			camera.clearFlag = BaseCamera.CLEARFLAG_SKY;
			camera.addComponent(VRCameraMoveScript);
			
			loadScene(scene, camera);
		}
		
		private function loadScene(scene:BaseScene, camera:VRCamera):void {
			var root:Sprite3D = scene.addChild(new Sprite3D()) as Sprite3D;
			root.transform.localScale = new Vector3(10, 10, 10);
			
			var skyBox:SkyBox = new SkyBox();
			camera.sky = skyBox;
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			Laya.loader.load("../../../../res/threeDimen/skyBox/px.jpg,../../../../res/threeDimen/skyBox/nx.jpg,../../../../res/threeDimen/skyBox/py.jpg,../../../../res/threeDimen/skyBox/ny.jpg,../../../../res/threeDimen/skyBox/pz.jpg,../../../../res/threeDimen/skyBox/nz.jpg", Handler.create(null, function(texture:TextureCube):void {
				skyBox.textureCube = texture;
			}), null, Loader.TEXTURECUBE);
			
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			var singleFaceTransparent0:Sprite3D = root.addChild(new Sprite3D()) as Sprite3D;
			singleFaceTransparent0.once(Event.HIERARCHY_LOADED, null, function(sprite:Sprite3D):void {
				setMeshParams(sprite, BaseMaterial.RENDERMODE_CUTOUT, new Vector4(3.5, 3.5, 3.5, 1.0), new Vector3(0.6, 0.6, 0.6), new Vector2(1.0, 1.0));
			});
			singleFaceTransparent0.loadHierarchy("../../../../res/threeDimen/staticModel/simpleScene/B00IT004M.v3f.lh");
			
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			var singleFaceTransparent1:Sprite3D = root.addChild(new Sprite3D()) as Sprite3D;
			singleFaceTransparent1.once(Event.HIERARCHY_LOADED, null, function(sprite:Sprite3D):void {
				setMeshParams(sprite, BaseMaterial.RENDERMODE_CUTOUT, new Vector4(3.5, 3.5, 3.5, 1.0), new Vector3(0.6, 0.6, 0.6), new Vector2(1.0, 1.0));
			});
			singleFaceTransparent1.loadHierarchy("../../../../res/threeDimen/staticModel/simpleScene/B00IT003M000.v3f.lh");
			
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			var meshSprite3d0:Sprite3D = root.addChild(new Sprite3D()) as Sprite3D;
			meshSprite3d0.once(Event.HIERARCHY_LOADED, null, function(sprite:Sprite3D):void {
				setMeshParams(sprite, BaseMaterial.RENDERMODE_OPAQUE, new Vector4(3.5, 3.5, 3.5, 1.0), new Vector3(0.6, 0.6, 0.6), new Vector2(1.0, 1.0));
			});
			meshSprite3d0.loadHierarchy("../../../../res/threeDimen/staticModel/simpleScene/B00IT001M000.v3f.lh");
			
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			var meshSprite3d1:Sprite3D = root.addChild(new Sprite3D()) as Sprite3D;
			meshSprite3d1.once(Event.HIERARCHY_LOADED, null, function(sprite:Sprite3D):void {
				setMeshParams(sprite, BaseMaterial.RENDERMODE_OPAQUE, new Vector4(3.5, 3.5, 3.5, 1.0), new Vector3(0.6, 0.6, 0.6), new Vector2(1.0, 1.0));
			});
			meshSprite3d1.loadHierarchy("../../../../res/threeDimen/staticModel/simpleScene/B00IT002M000.v3f.lh");
			
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			var meshSprite3d2:Sprite3D = root.addChild(new Sprite3D()) as Sprite3D;
			meshSprite3d2.once(Event.HIERARCHY_LOADED, null, function(sprite:Sprite3D):void {
				setMeshParams(sprite, BaseMaterial.RENDERMODE_OPAQUE, new Vector4(3.5, 3.5, 3.5, 1.0), new Vector3(0.6, 0.6, 0.6), new Vector2(1.0, 1.0));
			});
			meshSprite3d2.loadHierarchy("../../../../res/threeDimen/staticModel/simpleScene/B00IT008M.v3f.lh");
			
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			var meshSprite3d3:Sprite3D = root.addChild(new Sprite3D()) as Sprite3D;
			meshSprite3d3.once(Event.HIERARCHY_LOADED, null, function(sprite:Sprite3D):void {
				setMeshParams(sprite, BaseMaterial.RENDERMODE_OPAQUE, new Vector4(3.5, 3.5, 3.5, 1.0), new Vector3(0.6, 0.6, 0.6), new Vector2(1.0, 1.0));
			});
			meshSprite3d3.loadHierarchy("../../../../res/threeDimen/staticModel/simpleScene/B00MP003M.v3f.lh");
			
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			var doubleFaceTransparent:Sprite3D = root.addChild(new Sprite3D()) as Sprite3D;
			doubleFaceTransparent.once(Event.HIERARCHY_LOADED, null, function(sprite:Sprite3D):void {
				setMeshParams(doubleFaceTransparent, BaseMaterial.RENDERMODE_CUTOUTDOUBLEFACE, new Vector4(3.5, 3.5, 3.5, 1.0), new Vector3(0.6, 0.6, 0.6), new Vector2(1.0, 1.0));
			});
			doubleFaceTransparent.loadHierarchy("../../../../res/threeDimen/staticModel/simpleScene/B00IT005M.v3f.lh");
			
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			var terrainSpirit0:Sprite3D = root.addChild(new Sprite3D()) as Sprite3D;
			terrainSpirit0.once(Event.HIERARCHY_LOADED, null, function(sprite:Sprite3D):void {
				setMeshParams(terrainSpirit0, BaseMaterial.RENDERMODE_OPAQUE, new Vector4(3.5, 3.5, 3.5, 1.0), new Vector3(0.6823, 0.6549, 0.6352), new Vector2(25.0, 25.0), "TERRAIN");
			});
			terrainSpirit0.loadHierarchy("../../../../res/threeDimen/staticModel/simpleScene/B00MP001M.v3f.lh");
			
			//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
			var terrainSpirit1:Sprite3D = root.addChild(new Sprite3D()) as Sprite3D;
			terrainSpirit1.once(Event.HIERARCHY_LOADED, null, function(sprite:Sprite3D):void {
				setMeshParams(terrainSpirit1, BaseMaterial.RENDERMODE_OPAQUE, new Vector4(3.5, 3.5, 3.5, 1.0), new Vector3(0.6823, 0.6549, 0.6352), new Vector2(19.0, 19.0), "TERRAIN");
			});
			terrainSpirit1.loadHierarchy("../../../../res/threeDimen/staticModel/simpleScene/B00MP002M.v3f.lh");
		}
		
		private function setMeshParams(spirit3D:Sprite3D, renderMode:int, albedo:Vector4, ambientColor:Vector3, uvScale:Vector2, shaderName:String = null):void {
			if (spirit3D is MeshSprite3D) {
				var meshSprite:MeshSprite3D = spirit3D as MeshSprite3D;
				var mesh:BaseMesh = meshSprite.meshFilter.sharedMesh;
				if (mesh != null) {
					//可采用预加载资源方式，避免异步加载资源问题，则无需注册事件。
					mesh.once(Event.LOADED, this, function(mesh:BaseMesh):void {
						for (var i:int = 0; i < meshSprite.meshRender.sharedMaterials.length; i++) {
							var material:StandardMaterial = meshSprite.meshRender.sharedMaterials[i] as StandardMaterial;
							material.once(Event.LOADED, null, function(mat:StandardMaterial):void {
								var transformUV:TransformUV = new TransformUV();
								transformUV.tiling = uvScale;
								(shaderName) && (mat.setShaderName(shaderName));
								mat.transformUV = transformUV;
								mat.ambientColor = ambientColor;
								mat.albedo = albedo;
								mat.renderMode = renderMode;
							});
							
						}
					});
				}
			}
			for (var i:int = 0; i < spirit3D._childs.length; i++)
				setMeshParams(spirit3D._childs[i], renderMode, albedo, ambientColor, uvScale, shaderName);
		}
	}
}