package
{
    import com.adobe.utils.AGALMiniAssembler;
    import com.adobe.utils.PerspectiveMatrix3D;

    import flash.display.Sprite;
    import flash.display.Stage3D;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.display3D.Context3D;
    import flash.display3D.Context3DProgramType;
    import flash.display3D.Context3DRenderMode;
    import flash.display3D.Context3DTriangleFace;
    import flash.display3D.Context3DVertexBufferFormat;
    import flash.display3D.IndexBuffer3D;
    import flash.display3D.Program3D;
    import flash.display3D.VertexBuffer3D;
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.geom.Matrix3D;
    import flash.geom.Vector3D;

[SWF(frameRate=120)]
    public class Test_Context3D extends Sprite
    {
        public const viewWidth:Number = 320*1.4;
        public const viewHeight:Number = 200*1.4;
        public const zNear:Number = 1;
        public const zFar:Number = 500;

        public const fov:Number = 45;

        private var stage3D:Stage3D;
        private var renderContext:Context3D;
        private var indexList:IndexBuffer3D;
        private var vertexes:VertexBuffer3D;

        private var projection:PerspectiveMatrix3D = new PerspectiveMatrix3D();
        private var model:Matrix3D = new Matrix3D();
        private var view:Matrix3D = new Matrix3D();
        private var finalTransform:Matrix3D = new Matrix3D();

        //For rotating the cube
        private const pivot:Vector3D = new Vector3D();

        private const VERTEX_SHADER:String =
                "m44 op, va0, vc0    \n" +    // 4x4 matrix transform
                        "mov v0, va1"; //copy color to varying variable v0

        private const FRAGMENT_SHADER:String =
                "mov oc, v0"; //Set the output color to the value interpolated from the three triangle vertices

        private var vertexAssembly:AGALMiniAssembler = new AGALMiniAssembler();
        private var fragmentAssembly:AGALMiniAssembler = new AGALMiniAssembler();
        private var programPair:Program3D;

        public function Test_Context3D()
        {
            this.stage.scaleMode = StageScaleMode.NO_SCALE;
            this.stage.align = StageAlign.TOP_LEFT;
//            this.stage.nativeWindow.activate(); //AIR only

            stage3D = this.stage.stage3Ds[0];
            stage3D.x = 10;
            stage3D.y = 10;

            //Add event listener before requesting the context
            stage3D.addEventListener( Event.CONTEXT3D_CREATE, contextCreated );
            stage3D.addEventListener( ErrorEvent.ERROR, contextCreationError );
            stage3D.requestContext3D( Context3DRenderMode.AUTO );

            //Compile shaders
            vertexAssembly.assemble( Context3DProgramType.VERTEX, VERTEX_SHADER, false );
            fragmentAssembly.assemble( Context3DProgramType.FRAGMENT, FRAGMENT_SHADER, false );
        }

        //Note, context3DCreate event can happen at any time, such as when the hardware resources are taken by another process
        private function contextCreated( event:Event ):void
        {
            renderContext = Stage3D( event.target ).context3D;
            trace( "3D driver: " + renderContext.driverInfo );
            setupScene();
        }

        private function setupScene():void
        {
            //renderContext.enableErrorChecking = true; //Can slow rendering - only turn on when developing/testing
            renderContext.configureBackBuffer( viewWidth, viewHeight, 2, false );
            renderContext.setCulling( Context3DTriangleFace.BACK );

            //Create vertex index list for the triangles forming a cube
            var triangles:Vector.<uint> = Vector.<uint>( [
                2,1,0, //front face
                3,2,0,
                4,7,5, //bottom face
                7,6,5,
                8,11,9, //back face
                9,11,10,
                12,15,13, //top face
                13,15,14,
                16,19,17, //left face
                17,19,18,
                20,23,21, //right face
                21,23,22
            ] );
            indexList = renderContext.createIndexBuffer( triangles.length );
            indexList.uploadFromVector( triangles, 0, triangles.length );

            //Create vertexes - cube faces do not share vertexes
            const dataPerVertex:int = 6;
            var vertexData:Vector.<Number> = Vector.<Number>(
                    [
                        // x,y,z r,g,b format
                        0,0,0, 1,0,0, //front face
                        0,1,0, 1,0,0,
                        1,1,0, 1,0,0,
                        1,0,0, 1,0,0,

                        0,0,0, 0,1,0, //bottom face
                        1,0,0, 0,1,0,
                        1,0,1, 0,1,0,
                        0,0,1, 0,1,0,

                        0,0,1, 1,1,0, //back face
                        1,0,1, 1,1,1,
                        1,1,1, 1,0,1,
                        0,1,1, 0,0,0,

                        0,1,1, 0,1,0, //top face
                        1,1,1, 0,1,0,
                        1,1,0, 0,1,0,
                        0,1,0, 0,1,0,

                        0,1,1, 0,0,1, //left face
                        0,1,0, 0,0,1,
                        0,0,0, 0,0,1,
                        0,0,1, 0,0,1,

                        1,1,0, 0,0,1, //right face
                        1,1,1, 0,0,1,
                        1,0,1, 0,0,1,
                        1,0,0, 0,0,1
                    ]
            );
            vertexes = renderContext.createVertexBuffer( vertexData.length/dataPerVertex, dataPerVertex );
            vertexes.uploadFromVector( vertexData, 0, vertexData.length/dataPerVertex );

            //Identify vertex data inputs for vertex program
            renderContext.setVertexBufferAt( 0, vertexes, 0, Context3DVertexBufferFormat.FLOAT_3 ); //va0 is position
            renderContext.setVertexBufferAt( 1, vertexes, 3, Context3DVertexBufferFormat.FLOAT_3 ); //va1 is color

            //Upload programs to render context
            programPair = renderContext.createProgram();
            programPair.upload( vertexAssembly.agalcode, fragmentAssembly.agalcode );
            renderContext.setProgram( programPair );

            //Set up 3D transforms
            projection.perspectiveFieldOfViewRH( fov, viewWidth/viewHeight, zNear, zFar );
            view.appendTranslation( 0, 0, -3 );    //Move view back
            model.appendTranslation( -.5, -.5, -.5 ); //center cube on origin
            this.stage.addEventListener( Event.ENTER_FRAME, render );
        }

        private function render( event:Event ):void
        {
            //Rotate model on each frame
            model.appendRotation( 1, Vector3D.Z_AXIS, pivot );
            model.appendRotation( 2, Vector3D.Y_AXIS, pivot );
            model.appendRotation( 3, Vector3D.X_AXIS, pivot );

            //Combine transforms
            finalTransform.identity();
            finalTransform.append( model );
            finalTransform.append( view );
            finalTransform.append( projection );

            //Pass the final transform to the vertex shader as program constant, vc0
            renderContext.setProgramConstantsFromMatrix( Context3DProgramType.VERTEX, 0, finalTransform, true );

            //Clear is required before drawTriangles on each frame
            renderContext.clear( .3,.3,.3 );

            //Draw the 12 triangles that make up the cube
            renderContext.drawTriangles( indexList, 0, 12 );

            //Show the frame
            renderContext.present();
        }

        private function contextCreationError( error:ErrorEvent ):void
        {
            trace( error.errorID + ": " + error.text );
        }
    }
}