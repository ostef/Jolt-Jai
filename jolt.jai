// Defines

PROFILE_ENABLED :: 1;
DEBUG_RENDERER :: 1;
ENABLE_ASSERTS :: 1;
OBJECT_STREAM :: 1;
VERSION_MAJOR :: 5;
VERSION_MINOR :: 6;
VERSION_PATCH :: 0;
VERSION_FEATURE_BIT_1 :: 0;
VERSION_FEATURE_BIT_2 :: 0;
VERSION_FEATURE_BIT_3 :: 0;
VERSION_FEATURE_BIT_4 :: 1;
VERSION_FEATURE_BIT_5 :: 0;
VERSION_FEATURE_BIT_6 :: 1;
VERSION_FEATURE_BIT_7 :: 0;
VERSION_FEATURE_BIT_8 :: 0;
VERSION_FEATURE_BIT_9 :: 0;
VERSION_FEATURE_BIT_10 :: 1;
VERSION_FEATURE_BIT_11 :: 1;
VERSION_ID :: ((VERSION_FEATURES<<24)|(VERSION_MAJOR<<16)|(VERSION_MINOR<<8)|VERSION_PATCH);
DEBUG :: 1;
VECTOR_ALIGNMENT :: 16;
DVECTOR_ALIGNMENT :: 32;
cLargeFloat :: 1.0e15;
cDefaultCollisionTolerance :: 1.0e-4;
cDefaultPenetrationTolerance :: 1.0e-4;
cDefaultConvexRadius :: 0.05;
cCapsuleProjectionSlop :: 0.02;
cDefaultInternalEdgeRemovalVertexToleranceSq :: 1.0e-8;
cMaxPhysicsJobs :: 2048;
cMaxPhysicsBarriers :: 8;
cInvalidBodyID :: 0xfffffff;
CharacterID_cInvalidCharacterID :: 0xfffffff;

// Typedefs

RVec3 :: Vec3;
RMat44 :: Mat44;
Real :: float;
Color :: u32;
AllocateFunction :: #type (u64) -> *void #c_call;
ReallocateFunction :: #type (*void, u64, u64) -> *void #c_call;
FreeFunction :: #type (*void) -> void #c_call;
AlignedAllocateFunction :: #type (u64, u64) -> *void #c_call;
AlignedFreeFunction :: #type (*void) -> void #c_call;
TraceHandler :: #type (*s8) -> void #c_call;
AssertFailedHandler :: #type (*s8, *s8, *s8, u32) -> bool #c_call;
BodyID :: u32;
SubShapeID :: u32;
BroadPhaseLayer :: u8;
ObjectLayer :: u16;
CharacterID :: u32;

// Enums

EFeatures :: enum_flags u64 {
    DoublePrecision :: 1;
    CrossPlatformDeterministic :: 2;
    FloatingPointExceptionsEnabled :: 4;
    ProfileEnabled :: 8;
    ExternalProfile :: 16;
    DebugRenderer :: 32;
    DisableTempAllocator :: 64;
    DisableCustomAllocator :: 128;
    ObjectLayer32Bits :: 256;
    EnableAsserts :: 512;
    ObjectStream :: 1024;
}

EShapeType :: enum u8 {
    Convex :: 0;
    Compound :: 1;
    Decorated :: 2;
    Mesh :: 3;
    HeightField :: 4;
    SoftBody :: 5;
    User1 :: 6;
    User2 :: 7;
    User3 :: 8;
    User4 :: 9;
    Plane :: 10;
    Empty :: 11;
}

EShapeSubType :: enum u8 {
    Sphere :: 0;
    Box :: 1;
    Triangle :: 2;
    Capsule :: 3;
    TaperedCapsule :: 4;
    Cylinder :: 5;
    ConvexHull :: 6;
    StaticCompound :: 7;
    MutableCompound :: 8;
    RotatedTranslated :: 9;
    Scaled :: 10;
    OffsetCenterOfMass :: 11;
    Mesh :: 12;
    HeightField :: 13;
    SoftBody :: 14;
    User1 :: 15;
    User2 :: 16;
    User3 :: 17;
    User4 :: 18;
    User5 :: 19;
    User6 :: 20;
    User7 :: 21;
    User8 :: 22;
    UserConvex1 :: 23;
    UserConvex2 :: 24;
    UserConvex3 :: 25;
    UserConvex4 :: 26;
    UserConvex5 :: 27;
    UserConvex6 :: 28;
    UserConvex7 :: 29;
    UserConvex8 :: 30;
    Plane :: 31;
    TaperedCylinder :: 32;
    Empty :: 33;
}

EBackFaceMode :: enum u8 {
    IgnoreBackFaces :: 0;
    CollideWithBackFaces :: 1;
}

ECollisionCollectorType :: enum u32 {
    AnyHit :: 0;
    ClosestHit :: 1;
    AllHitsSorted :: 2;
    AllHits :: 3;
}

EActiveEdgeMode :: enum u8 {
    CollideOnlyWithActive :: 0;
    CollideWithAll :: 1;
}

ECollectFacesMode :: enum u8 {
    CollectFaces :: 0;
    NoFaces :: 1;
}

EBodyType :: enum u8 {
    RigidBody :: 0;
    SoftBody :: 1;
}

ECanSleep :: enum u32 {
    CannotSleep :: 0;
    CanSleep :: 1;
}

EMotionQuality :: enum u8 {
    Discrete :: 0;
    LinearCast :: 1;
}

EMotionType :: enum u8 {
    Static :: 0;
    Kinematic :: 1;
    Dynamic :: 2;
}

EAllowedDOFs :: enum_flags u8 {
    None :: 0;
    All :: 255;
    TranslationX :: 1;
    TranslationY :: 2;
    TranslationZ :: 4;
    RotationX :: 8;
    RotationY :: 16;
    RotationZ :: 32;
    Plane2D :: 35;
}

EOverrideMassProperties :: enum u8 {
    CalculateMassAndInertia :: 0;
    CalculateInertia :: 1;
    MassAndInertiaProvided :: 2;
}

EActivation :: enum u32 {
    Activate :: 0;
    DontActivate :: 1;
}

ESoftBodyConstraintColor :: enum u32 {
    ConstraintType :: 0;
    ConstraintGroup :: 1;
    ConstraintOrder :: 2;
}

EPhysicsUpdateError :: enum_flags u32 {
    None :: 0;
    ManifoldCacheFull :: 1;
    BodyPairCacheFull :: 2;
    ContactConstraintsFull :: 4;
}

EConstraintType :: enum u32 {
    Constraint :: 0;
    TwoBodyConstraint :: 1;
}

EConstraintSubType :: enum u32 {
    Fixed :: 0;
    Point :: 1;
    Hinge :: 2;
    Slider :: 3;
    Distance :: 4;
    Cone :: 5;
    SwingTwist :: 6;
    SixDOF :: 7;
    Path :: 8;
    Vehicle :: 9;
    RackAndPinion :: 10;
    Gear :: 11;
    Pulley :: 12;
    User1 :: 13;
    User2 :: 14;
    User3 :: 15;
    User4 :: 16;
}

EConstraintSpace :: enum u32 {
    LocalToBodyCOM :: 0;
    WorldSpace :: 1;
}

ESpringMode :: enum u8 {
    FrequencyAndDamping :: 0;
    StiffnessAndDamping :: 1;
    MassNormalizedStiffnessAndDamping :: 2;
}

EMotorState :: enum u32 {
    Off :: 0;
    Velocity :: 1;
    Position :: 2;
    PositionAndVelocity :: 3;
}

EPathRotationConstraintType :: enum u32 {
    Free :: 0;
    ConstrainAroundTangent :: 1;
    ConstrainAroundNormal :: 2;
    ConstrainAroundBinormal :: 3;
    ConstrainToPath :: 4;
    FullyConstrained :: 5;
}

ESwingType :: enum u8 {
    Cone :: 0;
    Pyramid :: 1;
}

ECharacterGroundState :: enum u32 {
    OnGround :: 0;
    OnSteepGround :: 1;
    NotSupported :: 2;
    InAir :: 3;
}

// Structs

TempAllocator :: struct {
    opaque : s8;

    Destroy :: (allocator : *TempAllocator) -> void #foreign JoltC "JPH_TempAllocator_Destroy";
    Allocate :: (allocator : *TempAllocator, size : u32) -> *void #foreign JoltC "JPH_TempAllocator_Allocate";
    Free :: (allocator : *TempAllocator, ptr : *void, size : u32) -> void #foreign JoltC "JPH_TempAllocator_Free";
}

TempAllocatorImpl :: struct {
    #as using,except(base) base : TempAllocator;

    Create :: (size : u64) -> *TempAllocatorImpl #foreign JoltC "JPH_TempAllocatorImpl_Create";
}

TempAllocatorImplWithMallocFallback :: struct {
    #as using,except(base) base : TempAllocator;

    Create :: (size : u32) -> *TempAllocatorImplWithMallocFallback #foreign JoltC "JPH_TempAllocatorImplWithMallocFallback_Create";
}

TempAllocatorMalloc :: struct {
    #as using,except(base) base : TempAllocator;

    Create :: () -> *TempAllocatorMalloc #foreign JoltC "JPH_TempAllocatorMalloc_Create";
}

JobSystem :: struct {
    opaque : s8;

    Destroy :: (job_system : *JobSystem) -> void #foreign JoltC "JPH_JobSystem_Destroy";
}

JobSystemSingleThreaded :: struct {
    #as using,except(base) base : JobSystem;

    Create :: (maxJobs : u32) -> *JobSystemSingleThreaded #foreign JoltC "JPH_JobSystemSingleThreaded_Create";
}

JobSystemThreadPool :: struct {
    #as using,except(base) base : JobSystem;

    Create :: (maxJobs : u32, maxBarriers : u32, numThreads : s32) -> *JobSystemThreadPool #foreign JoltC "JPH_JobSystemThreadPool_Create";
}

SharedMutex :: struct {}

Float3 :: struct {
    x : float;
    y : float;
    z : float;
}

AABox :: struct {
    min : Vec3;
    max : Vec3;
}

Plane :: struct {
    normalAndConstant : Vec4;

    Make :: (normal : Vec3, constant : float) -> Plane #foreign JoltC "JPH_Plane_Make";
    Offset :: (plane : Plane, distance : float) -> Plane #foreign JoltC "JPH_Plane_Offset";
    Scaled :: (plane : Plane, scale : Vec3) -> Plane #foreign JoltC "JPH_Plane_Scaled";
    GetTransformed :: (plane : Plane, transform : Mat44) -> Plane #foreign JoltC "JPH_Plane_GetTransformed";
    SignedDistance :: (plane : Plane, point : Vec3) -> float #foreign JoltC "JPH_Plane_SignedDistance";
    ProjectPointOnPlane :: (plane : Plane, point : Vec3) -> Vec3 #foreign JoltC "JPH_Plane_ProjectPointOnPlane";
    FromPointAndNormal :: (point : Vec3, normal : Vec3) -> Plane #foreign JoltC "JPH_Plane_FromPointAndNormal";
}

OrientedBox :: struct {
    orientation : Mat44;
    halfExtents : Vec3;

    OverlapsAABox :: (box : *OrientedBox, otherBox : AABox, epsilon : float) -> bool #foreign JoltC "JPH_OrientedBox_OverlapsAABox";
    OverlapsOrientedBox :: (box : *OrientedBox, otherBox : OrientedBox, epsilon : float) -> bool #foreign JoltC "JPH_OrientedBox_OverlapsOrientedBox";
}

PhysicsSettings :: struct {
    maxInFlightBodyPairs : s32;
    stepListenersBatchSize : s32;
    stepListenerBatchesPerJob : s32;
    baumgarte : float;
    speculativeContactDistance : float;
    penetrationSlop : float;
    linearCastThreshold : float;
    linearCastMaxPenetration : float;
    manifoldTolerance : float;
    maxPenetrationDistance : float;
    bodyPairCacheMaxDeltaPositionSq : float;
    bodyPairCacheCosMaxDeltaRotationDiv2 : float;
    contactNormalCosMaxDeltaRotation : float;
    contactPointPreserveLambdaMaxDistSq : float;
    internalEdgeRemovalVertexToleranceSq : float;
    numVelocitySteps : u32;
    numPositionSteps : u32;
    minVelocityForRestitution : float;
    timeBeforeSleep : float;
    pointVelocitySleepThreshold : float;
    deterministicSimulation : bool;
    constraintWarmStart : bool;
    useBodyPairContactCache : bool;
    useManifoldReduction : bool;
    useLargeIslandSplitter : bool;
    allowSleeping : bool;
    checkActiveEdges : bool;
}

JoltCAllocator :: struct {
    data : *void;
    AllocateFunc : #type (*void, u64) -> *void #c_call;
    FreeFunc : #type (*void, *void) -> void #c_call;

    Allocate :: (allocator : JoltCAllocator, size : u64) -> *void #foreign JoltC "JPH_JoltCAllocator_Allocate";
    Free :: (allocator : JoltCAllocator, ptr : *void) -> void #foreign JoltC "JPH_JoltCAllocator_Free";
}

PhysicsMaterial :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        GetDebugName : #type (*void) -> *s8 #c_call;
        GetDebugColor : #type (*void) -> Color #c_call;
    }

    Create :: (data : *void, funcs : PhysicsMaterial.Funcs, allocator : JoltCAllocator) -> *PhysicsMaterial #foreign JoltC "JPH_PhysicsMaterial_Create";

    Destroy :: (self : *PhysicsMaterial) -> void #foreign JoltC "JPH_PhysicsMaterial_Destroy";
}

Shape :: struct {
    SupportingFace :: struct {
        size : u32;
        elements : [32]Vec3;
    }

    GetTrianglesContext :: struct {
        data : [4288]u8;
    }

    Stats :: struct {
        sizeBytes : u64;
        numTriangles : u32;
    }

    opaque : s8;

    AddRef :: (shape : *Shape) -> void #foreign JoltC "JPH_Shape_AddRef";
    Release :: (shape : *Shape) -> void #foreign JoltC "JPH_Shape_Release";
    GetRefCount :: (shape : *Shape) -> u32 #foreign JoltC "JPH_Shape_GetRefCount";
    GetType :: (shape : *Shape) -> EShapeType #foreign JoltC "JPH_Shape_GetType";
    GetSubType :: (shape : *Shape) -> EShapeSubType #foreign JoltC "JPH_Shape_GetSubType";
    GetUserData :: (shape : *Shape) -> u64 #foreign JoltC "JPH_Shape_GetUserData";
    SetUserData :: (shape : *Shape, userData : u64) -> void #foreign JoltC "JPH_Shape_SetUserData";
    MustBeStatic :: (shape : *Shape) -> bool #foreign JoltC "JPH_Shape_MustBeStatic";
    GetCenterOfMass :: (shape : *Shape) -> Vec3 #foreign JoltC "JPH_Shape_GetCenterOfMass";
    GetLocalBounds :: (shape : *Shape) -> AABox #foreign JoltC "JPH_Shape_GetLocalBounds";
    GetSubShapeIDBitsRecursive :: (shape : *Shape) -> u32 #foreign JoltC "JPH_Shape_GetSubShapeIDBitsRecursive";
    GetWorldSpaceBounds :: (shape : *Shape, centerOfMassTransform : Mat44, scale : Vec3) -> AABox #foreign JoltC "JPH_Shape_GetWorldSpaceBounds";
    GetInnerRadius :: (shape : *Shape) -> float #foreign JoltC "JPH_Shape_GetInnerRadius";
    GetMassProperties :: (shape : *Shape) -> MassProperties #foreign JoltC "JPH_Shape_GetMassProperties";
    GetLeafShape :: (shape : *Shape, subShapeID : SubShapeID, outRemainder : *SubShapeID) -> *Shape #foreign JoltC "JPH_Shape_GetLeafShape";
    GetMaterial :: (shape : *Shape, subShapeID : SubShapeID) -> *PhysicsMaterial #foreign JoltC "JPH_Shape_GetMaterial";
    GetSurfaceNormal :: (shape : *Shape, subShapeID : SubShapeID, localSurfacePosition : Vec3) -> Vec3 #foreign JoltC "JPH_Shape_GetSurfaceNormal";
    GetSupportingFace :: (shape : *Shape, subShapeID : SubShapeID, direction : Vec3, scale : Vec3, centerOfMassTransform : Mat44, outVertices : *Shape.SupportingFace) -> void #foreign JoltC "JPH_Shape_GetSupportingFace";
    GetSubShapeUserData :: (shape : *Shape, subShapeID : SubShapeID) -> u64 #foreign JoltC "JPH_Shape_GetSubShapeUserData";
    GetSubmergedVolume :: (shape : *Shape, centerOfMassTransform : Mat44, scale : Vec3, surface : Plane, outTotalVolume : *float, outSubmergedVolume : *float, outCenterOfBuoyancy : *Vec3) -> void #foreign JoltC "JPH_Shape_GetSubmergedVolume";
    GetTrianglesStart :: (shape : *Shape, ioContext : *Shape.GetTrianglesContext, box : AABox, positionCOM : Vec3, rotation : Quat, scale : Vec3) -> void #foreign JoltC "JPH_Shape_GetTrianglesStart";
    GetTrianglesNext :: (shape : *Shape, ioContext : *Shape.GetTrianglesContext, maxTrianglesRequested : u32, outTriangleVertices : *Float3, outMaterials : **PhysicsMaterial) -> u32 #foreign JoltC "JPH_Shape_GetTrianglesNext";
    GetStats :: (shape : *Shape) -> Shape.Stats #foreign JoltC "JPH_Shape_GetStats";
    GetVolume :: (shape : *Shape) -> float #foreign JoltC "JPH_Shape_GetVolume";
    IsValidScale :: (shape : *Shape, scale : Vec3) -> bool #foreign JoltC "JPH_Shape_IsValidScale";
    MakeScaleValid :: (shape : *Shape, scale : Vec3) -> Vec3 #foreign JoltC "JPH_Shape_MakeScaleValid";
    ScaleShape :: (shape : *Shape, scale : Vec3) -> *Shape #foreign JoltC "JPH_Shape_ScaleShape";
    Draw :: (shape : *Shape, renderer : *DebugRenderer, centerOfMassTransform : RMat44, scale : Vec3, color : Color, useMaterialColors : bool, drawWireframe : bool) -> void #foreign JoltC "JPH_Shape_Draw";
    DrawGetSupportFunction :: (shape : *Shape, renderer : *DebugRenderer, centerOfMassTransform : RMat44, scale : Vec3, color : Color, drawSupportDirection : bool) -> void #foreign JoltC "JPH_Shape_DrawGetSupportFunction";
    DrawGetSupportingFace :: (shape : *Shape, renderer : *DebugRenderer, centerOfMassTransform : RMat44, scale : Vec3) -> void #foreign JoltC "JPH_Shape_DrawGetSupportingFace";
}

ShapeSettings :: struct {
    userData : u64;
}

EmptyShapeSettings :: struct {
    #as using,except(base) base : ShapeSettings;
    centerOfMass : Vec3;

    Default :: () -> EmptyShapeSettings #foreign JoltC "JPH_EmptyShapeSettings_Default";

    CreateShape :: (settings : *EmptyShapeSettings) -> *Shape #foreign JoltC "JPH_EmptyShapeSettings_CreateShape";
}

PlaneShapeSettings :: struct {
    cDefaultHalfExtent :: 1000.0;

    #as using,except(base) base : ShapeSettings;
    plane : Plane;
    material : *PhysicsMaterial;
    halfExtent : float;

    Default :: () -> PlaneShapeSettings #foreign JoltC "JPH_PlaneShapeSettings_Default";

    CreateShape :: (settings : *PlaneShapeSettings) -> *Shape #foreign JoltC "JPH_PlaneShapeSettings_CreateShape";
}

IndexedTriangle :: struct {
    idx : [3]u32;
    materialIndex : u32;
    userData : u32;
}

MeshShapeSettings :: struct {
    cDefaultMaxTrianglesPerLeaf :: 8;
    cDefaultActiveEdgeCosThresholdAngle :: 0.996195;


    EBuildQuality :: enum u32 {
        FavorRuntimePerformance :: 0;
        FavorBuildSpeed :: 1;
    }

    #as using,except(base) base : ShapeSettings;
    numVertices : u32;
    vertices : *Float3;
    numIndexedTriangles : u32;
    indexedTriangles : *IndexedTriangle;
    numMaterials : u32;
    materials : **PhysicsMaterial;
    maxTrianglesPerLeaf : u32;
    activeEdgeCosThresholdAngle : float;
    perTriangleUserData : bool;
    buildQuality : MeshShapeSettings.EBuildQuality;

    Default :: () -> MeshShapeSettings #foreign JoltC "JPH_MeshShapeSettings_Default";

    CreateShape :: (settings : *MeshShapeSettings) -> *Shape #foreign JoltC "JPH_MeshShapeSettings_CreateShape";
}

HeightFieldShapeSettings :: struct {
    cDefaultMinHeightValue :: cLargeFloat;
    cDefaultMaxHeightValue :: (-cLargeFloat);
    cDefaultBlockSize :: 2;
    cDefaultBitsPerSample :: 8;
    cDefaultActiveEdgeCosThresholdAngle :: 0.996195;

    #as using,except(base) base : ShapeSettings;
    offset : Vec3;
    scale : Vec3;
    minHeightValue : float;
    maxHeightValue : float;
    materialsCapacity : u32;
    blockSize : u32;
    bitsPerSample : u32;
    sampleCount : u32;
    heightSamples : *float;
    materialIndices : *u8;
    numMaterials : u32;
    materials : **PhysicsMaterial;
    activeEdgeCosThresholdAngle : float;

    Default :: () -> HeightFieldShapeSettings #foreign JoltC "JPH_HeightFieldShapeSettings_Default";

    CreateShape :: (settings : *HeightFieldShapeSettings) -> *Shape #foreign JoltC "JPH_HeightFieldShapeSettings_CreateShape";
}

ConvexShapeSettings :: struct {
    cDefaultDensity :: 1000.0;
    cDefaultConvexRadius :: 0.05;

    #as using,except(base) base : ShapeSettings;
    material : *PhysicsMaterial;
    density : float;
}

SphereShapeSettings :: struct {
    #as using,except(base) base : ConvexShapeSettings;
    radius : float;

    Default :: () -> SphereShapeSettings #foreign JoltC "JPH_SphereShapeSettings_Default";

    CreateShape :: (settings : *SphereShapeSettings) -> *Shape #foreign JoltC "JPH_SphereShapeSettings_CreateShape";
}

BoxShapeSettings :: struct {
    #as using,except(base) base : ConvexShapeSettings;
    halfExtent : Vec3;
    convexRadius : float;

    Default :: () -> BoxShapeSettings #foreign JoltC "JPH_BoxShapeSettings_Default";

    CreateShape :: (settings : *BoxShapeSettings) -> *Shape #foreign JoltC "JPH_BoxShapeSettings_CreateShape";
}

TriangleShapeSettings :: struct {
    #as using,except(base) base : ConvexShapeSettings;
    v1 : Vec3;
    v2 : Vec3;
    v3 : Vec3;
    convexRadius : float;

    Default :: () -> TriangleShapeSettings #foreign JoltC "JPH_TriangleShapeSettings_Default";

    CreateShape :: (settings : *TriangleShapeSettings) -> *Shape #foreign JoltC "JPH_TriangleShapeSettings_CreateShape";
}

CapsuleShapeSettings :: struct {
    #as using,except(base) base : ConvexShapeSettings;
    radius : float;
    halfHeightOfCylinder : float;

    Default :: () -> CapsuleShapeSettings #foreign JoltC "JPH_CapsuleShapeSettings_Default";

    CreateShape :: (settings : *CapsuleShapeSettings) -> *Shape #foreign JoltC "JPH_CapsuleShapeSettings_CreateShape";
    IsValid :: (settings : *CapsuleShapeSettings) -> bool #foreign JoltC "JPH_CapsuleShapeSettings_IsValid";
    IsSphere :: (settings : *CapsuleShapeSettings) -> bool #foreign JoltC "JPH_CapsuleShapeSettings_IsSphere";
}

TaperedCapsuleShapeSettings :: struct {
    #as using,except(base) base : ConvexShapeSettings;
    halfHeightOfTaperedCylinder : float;
    topRadius : float;
    bottomRadius : float;

    Default :: () -> TaperedCapsuleShapeSettings #foreign JoltC "JPH_TaperedCapsuleShapeSettings_Default";

    CreateShape :: (settings : *TaperedCapsuleShapeSettings) -> *Shape #foreign JoltC "JPH_TaperedCapsuleShapeSettings_CreateShape";
    IsValid :: (settings : *TaperedCapsuleShapeSettings) -> bool #foreign JoltC "JPH_TaperedCapsuleShapeSettings_IsValid";
    IsSphere :: (settings : *TaperedCapsuleShapeSettings) -> bool #foreign JoltC "JPH_TaperedCapsuleShapeSettings_IsSphere";
}

CylinderShapeSettings :: struct {
    #as using,except(base) base : ConvexShapeSettings;
    halfHeight : float;
    radius : float;
    convexRadius : float;

    Default :: () -> CylinderShapeSettings #foreign JoltC "JPH_CylinderShapeSettings_Default";

    CreateShape :: (settings : *CylinderShapeSettings) -> *Shape #foreign JoltC "JPH_CylinderShapeSettings_CreateShape";
}

TaperedCylinderShapeSettings :: struct {
    #as using,except(base) base : ConvexShapeSettings;
    halfHeight : float;
    topRadius : float;
    bottomRadius : float;
    convexRadius : float;

    Default :: () -> TaperedCylinderShapeSettings #foreign JoltC "JPH_TaperedCylinderShapeSettings_Default";

    CreateShape :: (settings : *TaperedCylinderShapeSettings) -> *Shape #foreign JoltC "JPH_TaperedCylinderShapeSettings_CreateShape";
}

ConvexHullShapeSettings :: struct {
    cDefaultMaxErrorConvexRadius :: 0.05;
    cDefaultHullTolerance :: 1.0e-3;

    #as using,except(base) base : ConvexShapeSettings;
    numPoints : u32;
    points : *Vec3;
    maxConvexRadius : float;
    maxErrorConvexRadius : float;
    hullTolerance : float;

    Default :: () -> ConvexHullShapeSettings #foreign JoltC "JPH_ConvexHullShapeSettings_Default";

    CreateShape :: (settings : *ConvexHullShapeSettings) -> *Shape #foreign JoltC "JPH_ConvexHullShapeSettings_CreateShape";
}

CompoundShapeSettings :: struct {
    SubShapeSettings :: struct {
        shape : *Shape;
        position : Vec3;
        rotation : Quat;
        userData : u32;
    }

    #as using,except(base) base : ShapeSettings;
    numSubShapes : u32;
    subShapes : *CompoundShapeSettings.SubShapeSettings;
}

StaticCompoundShapeSettings :: struct {
    #as using,except(base) base : CompoundShapeSettings;

    Default :: () -> StaticCompoundShapeSettings #foreign JoltC "JPH_StaticCompoundShapeSettings_Default";

    CreateShape :: (settings : *StaticCompoundShapeSettings) -> *Shape #foreign JoltC "JPH_StaticCompoundShapeSettings_CreateShape";
}

MutableCompoundShapeSettings :: struct {
    #as using,except(base) base : CompoundShapeSettings;

    Default :: () -> MutableCompoundShapeSettings #foreign JoltC "JPH_MutableCompoundShapeSettings_Default";

    CreateShape :: (settings : *MutableCompoundShapeSettings) -> *Shape #foreign JoltC "JPH_MutableCompoundShapeSettings_CreateShape";
}

DecoratedShapeSettings :: struct {
    #as using,except(base) base : ShapeSettings;
    innerShape : *Shape;
}

RotatedTranslatedShapeSettings :: struct {
    #as using,except(base) base : DecoratedShapeSettings;
    position : Vec3;
    rotation : Quat;

    Default :: () -> RotatedTranslatedShapeSettings #foreign JoltC "JPH_RotatedTranslatedShapeSettings_Default";

    CreateShape :: (settings : *RotatedTranslatedShapeSettings) -> *Shape #foreign JoltC "JPH_RotatedTranslatedShapeSettings_CreateShape";
}

ScaledShapeSettings :: struct {
    #as using,except(base) base : DecoratedShapeSettings;
    scale : Vec3;

    Default :: () -> ScaledShapeSettings #foreign JoltC "JPH_ScaledShapeSettings_Default";

    CreateShape :: (settings : *ScaledShapeSettings) -> *Shape #foreign JoltC "JPH_ScaledShapeSettings_CreateShape";
}

OffsetCenterOfMassShapeSettings :: struct {
    #as using,except(base) base : DecoratedShapeSettings;
    offset : Vec3;

    Default :: () -> OffsetCenterOfMassShapeSettings #foreign JoltC "JPH_OffsetCenterOfMassShapeSettings_Default";

    CreateShape :: (settings : *OffsetCenterOfMassShapeSettings) -> *Shape #foreign JoltC "JPH_OffsetCenterOfMassShapeSettings_CreateShape";
}

EmptyShape :: struct {
    #as using,except(base) base : Shape;
}

PlaneShape :: struct {
    #as using,except(base) base : Shape;

    GetPlane :: (shape : *PlaneShape) -> Plane #foreign JoltC "JPH_PlaneShape_GetPlane";
    GetHalfExtent :: (shape : *PlaneShape) -> float #foreign JoltC "JPH_PlaneShape_GetHalfExtent";
    SetMaterial :: (shape : *PlaneShape, material : *PhysicsMaterial) -> void #foreign JoltC "JPH_PlaneShape_SetMaterial";
    GetMaterial :: (shape : *PlaneShape) -> *PhysicsMaterial #foreign JoltC "JPH_PlaneShape_GetMaterial";
}

MeshShape :: struct {
    #as using,except(base) base : Shape;

    GetMaterialIndex :: (shape : *MeshShape, subShapeID : SubShapeID) -> u32 #foreign JoltC "JPH_MeshShape_GetMaterialIndex";
    GetTriangleUserData :: (shape : *MeshShape, subShapeID : SubShapeID) -> u32 #foreign JoltC "JPH_MeshShape_GetTriangleUserData";
}

HeightFieldShape :: struct {
    #as using,except(base) base : Shape;

    GetSampleCount :: (shape : *HeightFieldShape) -> u32 #foreign JoltC "JPH_HeightFieldShape_GetSampleCount";
    GetBlockSize :: (shape : *HeightFieldShape) -> u32 #foreign JoltC "JPH_HeightFieldShape_GetBlockSize";
    GetMaterial :: (shape : *HeightFieldShape, x : u32, y : u32) -> *PhysicsMaterial #foreign JoltC "JPH_HeightFieldShape_GetMaterial";
    GetPosition :: (shape : *HeightFieldShape, x : u32, y : u32) -> Vec3 #foreign JoltC "JPH_HeightFieldShape_GetPosition";
    IsNoCollision :: (shape : *HeightFieldShape, x : u32, y : u32) -> bool #foreign JoltC "JPH_HeightFieldShape_IsNoCollision";
    ProjectOntoSurface :: (shape : *HeightFieldShape, localPosition : Vec3, outSurfacePosition : *Vec3, outSubShapeID : *SubShapeID) -> bool #foreign JoltC "JPH_HeightFieldShape_ProjectOntoSurface";
    GetSubShapeCoordinates :: (shape : *HeightFieldShape, subShapeID : SubShapeID, outX : *u32, outY : *u32, outTriangleIndex : *u32) -> void #foreign JoltC "JPH_HeightFieldShape_GetSubShapeCoordinates";
    GetMinHeightValue :: (shape : *HeightFieldShape) -> float #foreign JoltC "JPH_HeightFieldShape_GetMinHeightValue";
    GetMaxHeightValue :: (shape : *HeightFieldShape) -> float #foreign JoltC "JPH_HeightFieldShape_GetMaxHeightValue";
    GetHeights :: (shape : *HeightFieldShape, x : u32, y : u32, sizeX : u32, sizeY : u32, outHeights : *float, heightsStride : s64) -> void #foreign JoltC "JPH_HeightFieldShape_GetHeights";
    SetHeights :: (shape : *HeightFieldShape, x : u32, y : u32, sizeX : u32, sizeY : u32, inHeights : *float, heightsStride : s64, allocator : *TempAllocator, activeEdgeCosThresholdAngle : float) -> void #foreign JoltC "JPH_HeightFieldShape_SetHeights";
}

ConvexShape :: struct {
    #as using,except(base) base : Shape;

    SetMaterial :: (shape : *ConvexShape, material : *PhysicsMaterial) -> void #foreign JoltC "JPH_ConvexShape_SetMaterial";
    GetMaterial :: (shape : *ConvexShape) -> *PhysicsMaterial #foreign JoltC "JPH_ConvexShape_GetMaterial";
    SetDensity :: (shape : *ConvexShape, density : float) -> void #foreign JoltC "JPH_ConvexShape_SetDensity";
    GetDensity :: (shape : *ConvexShape) -> float #foreign JoltC "JPH_ConvexShape_GetDensity";
}

SphereShape :: struct {
    #as using,except(base) base : ConvexShape;

    GetRadius :: (shape : *SphereShape) -> float #foreign JoltC "JPH_SphereShape_GetRadius";
}

BoxShape :: struct {
    #as using,except(base) base : ConvexShape;

    GetHalfExtent :: (shape : *BoxShape) -> Vec3 #foreign JoltC "JPH_BoxShape_GetHalfExtent";
    GetConvexRadius :: (shape : *BoxShape) -> float #foreign JoltC "JPH_BoxShape_GetConvexRadius";
}

TriangleShape :: struct {
    #as using,except(base) base : ConvexShape;

    GetVertex1 :: (shape : *TriangleShape) -> Vec3 #foreign JoltC "JPH_TriangleShape_GetVertex1";
    GetVertex2 :: (shape : *TriangleShape) -> Vec3 #foreign JoltC "JPH_TriangleShape_GetVertex2";
    GetVertex3 :: (shape : *TriangleShape) -> Vec3 #foreign JoltC "JPH_TriangleShape_GetVertex3";
    GetVertices :: (shape : *TriangleShape, outV1 : *Vec3, outV2 : *Vec3, outV3 : *Vec3) -> void #foreign JoltC "JPH_TriangleShape_GetVertices";
    GetConvexRadius :: (shape : *TriangleShape) -> float #foreign JoltC "JPH_TriangleShape_GetConvexRadius";
}

CapsuleShape :: struct {
    #as using,except(base) base : ConvexShape;

    GetRadius :: (shape : *CapsuleShape) -> float #foreign JoltC "JPH_CapsuleShape_GetRadius";
    GetHalfHeightOfCylinder :: (shape : *CapsuleShape) -> float #foreign JoltC "JPH_CapsuleShape_GetHalfHeightOfCylinder";
}

TaperedCapsuleShape :: struct {
    #as using,except(base) base : ConvexShape;

    GetTopRadius :: (shape : *TaperedCapsuleShape) -> float #foreign JoltC "JPH_TaperedCapsuleShape_GetTopRadius";
    GetBottomRadius :: (shape : *TaperedCapsuleShape) -> float #foreign JoltC "JPH_TaperedCapsuleShape_GetBottomRadius";
    GetHalfHeight :: (shape : *TaperedCapsuleShape) -> float #foreign JoltC "JPH_TaperedCapsuleShape_GetHalfHeight";
}

CylinderShape :: struct {
    #as using,except(base) base : ConvexShape;

    GetHalfHeight :: (shape : *CylinderShape) -> float #foreign JoltC "JPH_CylinderShape_GetHalfHeight";
    GetRadius :: (shape : *CylinderShape) -> float #foreign JoltC "JPH_CylinderShape_GetRadius";
    GetConvexRadius :: (shape : *CylinderShape) -> float #foreign JoltC "JPH_CylinderShape_GetConvexRadius";
}

TaperedCylinderShape :: struct {
    #as using,except(base) base : ConvexShape;

    GetTopRadius :: (shape : *TaperedCylinderShape) -> float #foreign JoltC "JPH_TaperedCylinderShape_GetTopRadius";
    GetBottomRadius :: (shape : *TaperedCylinderShape) -> float #foreign JoltC "JPH_TaperedCylinderShape_GetBottomRadius";
    GetConvexRadius :: (shape : *TaperedCylinderShape) -> float #foreign JoltC "JPH_TaperedCylinderShape_GetConvexRadius";
    GetHalfHeight :: (shape : *TaperedCylinderShape) -> float #foreign JoltC "JPH_TaperedCylinderShape_GetHalfHeight";
}

ConvexHullShape :: struct {
    #as using,except(base) base : ConvexShape;

    GetConvexRadius :: (shape : *ConvexHullShape) -> float #foreign JoltC "JPH_ConvexHullShape_GetConvexRadius";
    GetNumPoints :: (shape : *ConvexHullShape) -> u32 #foreign JoltC "JPH_ConvexHullShape_GetNumPoints";
    GetPoint :: (shape : *ConvexHullShape, index : u32) -> Vec3 #foreign JoltC "JPH_ConvexHullShape_GetPoint";
    GetNumFaces :: (shape : *ConvexHullShape) -> u32 #foreign JoltC "JPH_ConvexHullShape_GetNumFaces";
    GetNumVerticesInFace :: (shape : *ConvexHullShape, faceIndex : u32) -> u32 #foreign JoltC "JPH_ConvexHullShape_GetNumVerticesInFace";
    GetFaceVertices :: (shape : *ConvexHullShape, faceIndex : u32, maxVertices : u32, outVertices : *u32) -> u32 #foreign JoltC "JPH_ConvexHullShape_GetFaceVertices";
    GetNumPlanes :: (shape : *ConvexHullShape) -> u32 #foreign JoltC "JPH_ConvexHullShape_GetNumPlanes";
    GetPlanes :: (shape : *ConvexHullShape) -> *Plane #foreign JoltC "JPH_ConvexHullShape_GetPlanes";
}

CompoundShape :: struct {
    #as using,except(base) base : Shape;

    GetNumSubShapes :: (shape : *CompoundShape) -> u32 #foreign JoltC "JPH_CompoundShape_GetNumSubShapes";
    GetCompoundUserData :: (shape : *CompoundShape, index : u32) -> u32 #foreign JoltC "JPH_CompoundShape_GetCompoundUserData";
    SetCompoundUserData :: (shape : *CompoundShape, index : u32, userData : u32) -> void #foreign JoltC "JPH_CompoundShape_SetCompoundUserData";
    IsSubShapeIDValid :: (shape : *CompoundShape, subShapeID : SubShapeID) -> bool #foreign JoltC "JPH_CompoundShape_IsSubShapeIDValid";
    GetSubShapeIndexFromID :: (shape : *CompoundShape, subShapeID : SubShapeID, outRemainder : *SubShapeID) -> u32 #foreign JoltC "JPH_CompoundShape_GetSubShapeIndexFromID";
}

StaticCompoundShape :: struct {
    #as using,except(base) base : CompoundShape;
}

MutableCompoundShape :: struct {
    #as using,except(base) base : CompoundShape;

    AddShape :: (shape : *MutableCompoundShape, position : Vec3, rotation : Quat, inShape : *Shape, userData : u32, index : u32) -> u32 #foreign JoltC "JPH_MutableCompoundShape_AddShape";
    RemoveShape :: (shape : *MutableCompoundShape, index : u32) -> void #foreign JoltC "JPH_MutableCompoundShape_RemoveShape";
    ModifyShape :: (shape : *MutableCompoundShape, index : u32, position : Vec3, rotation : Quat) -> void #foreign JoltC "JPH_MutableCompoundShape_ModifyShape";
    ModifyShapeWithShape :: (shape : *MutableCompoundShape, index : u32, position : Vec3, rotation : Quat, inShape : *Shape) -> void #foreign JoltC "JPH_MutableCompoundShape_ModifyShapeWithShape";
    ModifyShapes :: (shape : *MutableCompoundShape, startIndex : u32, number : u32, positions : *Vec3, rotations : *Quat, positionStride : u32, rotationStride : u32) -> void #foreign JoltC "JPH_MutableCompoundShape_ModifyShapes";
    AdjustCenterOfMass :: (shape : *MutableCompoundShape) -> void #foreign JoltC "JPH_MutableCompoundShape_AdjustCenterOfMass";
}

DecoratedShape :: struct {
    #as using,except(base) base : Shape;

    GetInnerShape :: (shape : *DecoratedShape) -> *Shape #foreign JoltC "JPH_DecoratedShape_GetInnerShape";
}

RotatedTranslatedShape :: struct {
    #as using,except(base) base : DecoratedShape;

    GetRotation :: (shape : *RotatedTranslatedShape) -> Quat #foreign JoltC "JPH_RotatedTranslatedShape_GetRotation";
    GetPosition :: (shape : *RotatedTranslatedShape) -> Vec3 #foreign JoltC "JPH_RotatedTranslatedShape_GetPosition";
    TransformScale :: (shape : *RotatedTranslatedShape, scale : Vec3) -> Vec3 #foreign JoltC "JPH_RotatedTranslatedShape_TransformScale";
}

ScaledShape :: struct {
    #as using,except(base) base : DecoratedShape;

    GetScale :: (shape : *ScaledShape) -> Vec3 #foreign JoltC "JPH_ScaledShape_GetScale";
}

OffsetCenterOfMassShape :: struct {
    #as using,except(base) base : DecoratedShape;

    GetOffset :: (shape : *OffsetCenterOfMassShape) -> Vec3 #foreign JoltC "JPH_OffsetCenterOfMassShape_GetOffset";
}

MassProperties :: struct {
    mass : float;
    inertia : Mat44;

    GetEquivalentSolidBoxSize :: (mass : float, inertiaDiagonal : Vec3) -> Vec3 #foreign JoltC "JPH_MassProperties_GetEquivalentSolidBoxSize";

    DecomposePrincipalMomentsOfInertia :: (massProperties : *MassProperties, outRotation : *Mat44, outDiagonal : *Vec3) -> bool #foreign JoltC "JPH_MassProperties_DecomposePrincipalMomentsOfInertia";
    SetMassAndInertiaOfSolidBox :: (massProperties : *MassProperties, boxSize : Vec3, density : float) -> void #foreign JoltC "JPH_MassProperties_SetMassAndInertiaOfSolidBox";
    ScaleToMass :: (massProperties : *MassProperties, mass : float) -> void #foreign JoltC "JPH_MassProperties_ScaleToMass";
    Rotate :: (massProperties : *MassProperties, rotation : Mat44) -> void #foreign JoltC "JPH_MassProperties_Rotate";
    Translate :: (massProperties : *MassProperties, translation : Vec3) -> void #foreign JoltC "JPH_MassProperties_Translate";
    Scale :: (massProperties : *MassProperties, scale : Vec3) -> void #foreign JoltC "JPH_MassProperties_Scale";
}

SubShapeIDCreator :: struct {
    id : SubShapeID;
    currentBit : u32;
}

TransformedShape :: struct {
    shapePositionCOM : RVec3;
    shapeRotation : Quat;
    shape : *Shape;
    shapeScale : Float3;
    bodyID : BodyID;
    subShapeIDCreator : SubShapeIDCreator;
}

Body :: struct {
    FixedToWorld :: () -> *Body #foreign JoltC "JPH_Body_FixedToWorld";

    GetID :: (body : *Body) -> BodyID #foreign JoltC "JPH_Body_GetID";
    GetBodyType :: (body : *Body) -> EBodyType #foreign JoltC "JPH_Body_GetBodyType";
    IsRigidBody :: (body : *Body) -> bool #foreign JoltC "JPH_Body_IsRigidBody";
    IsSoftBody :: (body : *Body) -> bool #foreign JoltC "JPH_Body_IsSoftBody";
    IsActive :: (body : *Body) -> bool #foreign JoltC "JPH_Body_IsActive";
    IsStatic :: (body : *Body) -> bool #foreign JoltC "JPH_Body_IsStatic";
    IsKinematic :: (body : *Body) -> bool #foreign JoltC "JPH_Body_IsKinematic";
    IsDynamic :: (body : *Body) -> bool #foreign JoltC "JPH_Body_IsDynamic";
    CanBeKinematicOrDynamic :: (body : *Body) -> bool #foreign JoltC "JPH_Body_CanBeKinematicOrDynamic";
    SetIsSensor :: (body : *Body, isSensor : bool) -> void #foreign JoltC "JPH_Body_SetIsSensor";
    IsSensor :: (body : *Body) -> bool #foreign JoltC "JPH_Body_IsSensor";
    SetCollideKinematicVsNonDynamic :: (body : *Body, collide : bool) -> void #foreign JoltC "JPH_Body_SetCollideKinematicVsNonDynamic";
    GetCollideKinematicVsNonDynamic :: (body : *Body) -> bool #foreign JoltC "JPH_Body_GetCollideKinematicVsNonDynamic";
    SetUseManifoldReduction :: (body : *Body, useReduction : bool) -> void #foreign JoltC "JPH_Body_SetUseManifoldReduction";
    GetUseManifoldReduction :: (body : *Body) -> bool #foreign JoltC "JPH_Body_GetUseManifoldReduction";
    GetUseManifoldReductionWithBody :: (body : *Body, body2 : *Body) -> bool #foreign JoltC "JPH_Body_GetUseManifoldReductionWithBody";
    SetApplyGyroscopicForce :: (body : *Body, apply : bool) -> void #foreign JoltC "JPH_Body_SetApplyGyroscopicForce";
    GetApplyGyroscopicForce :: (body : *Body) -> bool #foreign JoltC "JPH_Body_GetApplyGyroscopicForce";
    SetEnhancedInternalEdgeRemoval :: (body : *Body, apply : bool) -> void #foreign JoltC "JPH_Body_SetEnhancedInternalEdgeRemoval";
    GetEnhancedInternalEdgeRemoval :: (body : *Body) -> bool #foreign JoltC "JPH_Body_GetEnhancedInternalEdgeRemoval";
    GetEnhancedInternalEdgeRemovalWithBody :: (body : *Body, body2 : *Body) -> bool #foreign JoltC "JPH_Body_GetEnhancedInternalEdgeRemovalWithBody";
    GetMotionType :: (body : *Body) -> EMotionType #foreign JoltC "JPH_Body_GetMotionType";
    SetMotionType :: (body : *Body, motionType : EMotionType) -> void #foreign JoltC "JPH_Body_SetMotionType";
    GetBroadPhaseLayer :: (body : *Body) -> BroadPhaseLayer #foreign JoltC "JPH_Body_GetBroadPhaseLayer";
    GetObjectLayer :: (body : *Body) -> ObjectLayer #foreign JoltC "JPH_Body_GetObjectLayer";
    GetCollisionGroupConst :: (body : *Body) -> *CollisionGroup #foreign JoltC "JPH_Body_GetCollisionGroupConst";
    GetCollisionGroup :: (body : *Body) -> *CollisionGroup #foreign JoltC "JPH_Body_GetCollisionGroup";
    SetCollisionGroup :: (body : *Body, group : *CollisionGroup) -> void #foreign JoltC "JPH_Body_SetCollisionGroup";
    GetAllowSleeping :: (body : *Body) -> bool #foreign JoltC "JPH_Body_GetAllowSleeping";
    SetAllowSleeping :: (body : *Body, allow : bool) -> void #foreign JoltC "JPH_Body_SetAllowSleeping";
    ResetSleepTimer :: (body : *Body) -> void #foreign JoltC "JPH_Body_ResetSleepTimer";
    GetFriction :: (body : *Body) -> float #foreign JoltC "JPH_Body_GetFriction";
    SetFriction :: (body : *Body, friction : float) -> void #foreign JoltC "JPH_Body_SetFriction";
    GetRestitution :: (body : *Body) -> float #foreign JoltC "JPH_Body_GetRestitution";
    SetRestitution :: (body : *Body, restitution : float) -> void #foreign JoltC "JPH_Body_SetRestitution";
    GetLinearVelocity :: (body : *Body) -> Vec3 #foreign JoltC "JPH_Body_GetLinearVelocity";
    SetLinearVelocity :: (body : *Body, linearVelocity : Vec3) -> void #foreign JoltC "JPH_Body_SetLinearVelocity";
    SetLinearVelocityClamped :: (body : *Body, linearVelocity : Vec3) -> void #foreign JoltC "JPH_Body_SetLinearVelocityClamped";
    GetAngularVelocity :: (body : *Body) -> Vec3 #foreign JoltC "JPH_Body_GetAngularVelocity";
    SetAngularVelocity :: (body : *Body, angularVelocity : Vec3) -> void #foreign JoltC "JPH_Body_SetAngularVelocity";
    SetAngularVelocityClamped :: (body : *Body, angularVelocity : Vec3) -> void #foreign JoltC "JPH_Body_SetAngularVelocityClamped";
    GetPointVelocityCOM :: (body : *Body, pointRelativeToCOM : Vec3) -> Vec3 #foreign JoltC "JPH_Body_GetPointVelocityCOM";
    GetPointVelocity :: (body : *Body, point : RVec3) -> Vec3 #foreign JoltC "JPH_Body_GetPointVelocity";
    AddForce :: (body : *Body, force : Vec3) -> void #foreign JoltC "JPH_Body_AddForce";
    AddForceAtPoint :: (body : *Body, force : Vec3, position : RVec3) -> void #foreign JoltC "JPH_Body_AddForceAtPoint";
    AddTorque :: (body : *Body, torque : Vec3) -> void #foreign JoltC "JPH_Body_AddTorque";
    GetAccumulatedForce :: (body : *Body) -> Vec3 #foreign JoltC "JPH_Body_GetAccumulatedForce";
    GetAccumulatedTorque :: (body : *Body) -> Vec3 #foreign JoltC "JPH_Body_GetAccumulatedTorque";
    ResetForce :: (body : *Body) -> void #foreign JoltC "JPH_Body_ResetForce";
    ResetTorque :: (body : *Body) -> void #foreign JoltC "JPH_Body_ResetTorque";
    ResetMotion :: (body : *Body) -> void #foreign JoltC "JPH_Body_ResetMotion";
    GetInverseInertia :: (body : *Body) -> Mat44 #foreign JoltC "JPH_Body_GetInverseInertia";
    AddImpulse :: (body : *Body, impulse : Vec3) -> void #foreign JoltC "JPH_Body_AddImpulse";
    AddImpulseAtPoint :: (body : *Body, impulse : Vec3, position : RVec3) -> void #foreign JoltC "JPH_Body_AddImpulseAtPoint";
    AddAngularImpulse :: (body : *Body, angularImpulse : Vec3) -> void #foreign JoltC "JPH_Body_AddAngularImpulse";
    MoveKinematic :: (body : *Body, targetPosition : RVec3, targetRotation : Quat, deltaTime : float) -> void #foreign JoltC "JPH_Body_MoveKinematic";
    GetSubmergedVolume :: (body : *Body, surfacePosition : RVec3, surfaceNormal : Vec3, outTotalVolume : *float, outSubmergedVolume : *float, outRelativeCenterOfBuoyancy : *Vec3) -> void #foreign JoltC "JPH_Body_GetSubmergedVolume";
    ApplyBuoyancyImpulseWithSurface :: (body : *Body, surfacePosition : RVec3, surfaceNormal : Vec3, buoyancy : float, linearDrag : float, angularDrag : float, fluidVelocity : Vec3, gravity : Vec3, deltaTime : float) -> bool #foreign JoltC "JPH_Body_ApplyBuoyancyImpulseWithSurface";
    ApplyBuoyancyImpulse :: (body : *Body, totalVolume : float, submergedVolume : float, relativeCenterOfBuoyancy : Vec3, buoyancy : float, linearDrag : float, angularDrag : float, fluidVelocity : Vec3, gravity : Vec3, deltaTime : float) -> bool #foreign JoltC "JPH_Body_ApplyBuoyancyImpulse";
    IsInBroadPhase :: (body : *Body) -> bool #foreign JoltC "JPH_Body_IsInBroadPhase";
    IsCollisionCacheInvalid :: (body : *Body) -> bool #foreign JoltC "JPH_Body_IsCollisionCacheInvalid";
    GetShape :: (body : *Body) -> *Shape #foreign JoltC "JPH_Body_GetShape";
    GetPosition :: (body : *Body) -> RVec3 #foreign JoltC "JPH_Body_GetPosition";
    GetRotation :: (body : *Body) -> Quat #foreign JoltC "JPH_Body_GetRotation";
    GetWorldTransform :: (body : *Body) -> RMat44 #foreign JoltC "JPH_Body_GetWorldTransform";
    GetCenterOfMassPosition :: (body : *Body) -> RVec3 #foreign JoltC "JPH_Body_GetCenterOfMassPosition";
    GetCenterOfMassTransform :: (body : *Body) -> RMat44 #foreign JoltC "JPH_Body_GetCenterOfMassTransform";
    GetInverseCenterOfMassTransform :: (body : *Body) -> RMat44 #foreign JoltC "JPH_Body_GetInverseCenterOfMassTransform";
    GetWorldSpaceBounds :: (body : *Body) -> AABox #foreign JoltC "JPH_Body_GetWorldSpaceBounds";
    GetMotionPropertiesConst :: (body : *Body) -> *MotionProperties #foreign JoltC "JPH_Body_GetMotionPropertiesConst";
    GetMotionProperties :: (body : *Body) -> *MotionProperties #foreign JoltC "JPH_Body_GetMotionProperties";
    GetMotionPropertiesUncheckedConst :: (body : *Body) -> *MotionProperties #foreign JoltC "JPH_Body_GetMotionPropertiesUncheckedConst";
    GetMotionPropertiesUnchecked :: (body : *Body) -> *MotionProperties #foreign JoltC "JPH_Body_GetMotionPropertiesUnchecked";
    GetUserData :: (body : *Body) -> u64 #foreign JoltC "JPH_Body_GetUserData";
    SetUserData :: (body : *Body, userData : u64) -> void #foreign JoltC "JPH_Body_SetUserData";
    GetWorldSpaceSurfaceNormal :: (body : *Body, subShapeID : SubShapeID, position : RVec3) -> Vec3 #foreign JoltC "JPH_Body_GetWorldSpaceSurfaceNormal";
    GetTransformedShape :: (body : *Body) -> TransformedShape #foreign JoltC "JPH_Body_GetTransformedShape";
    GetBodyCreationSettings :: (body : *Body) -> BodyCreationSettings #foreign JoltC "JPH_Body_GetBodyCreationSettings";
    ApplyBodyCreationSettings :: (body : *Body, bodyCreationSettings : *BodyCreationSettings, bplInterface : *BroadPhaseLayerInterface) -> void #foreign JoltC "JPH_Body_ApplyBodyCreationSettings";
    GetSoftBodyCreationSettings :: (body : *Body) -> SoftBodyCreationSettings #foreign JoltC "JPH_Body_GetSoftBodyCreationSettings";
    ApplySoftBodyCreationSettings :: (body : *Body, softBodyCreationSettings : *SoftBodyCreationSettings, bplInterface : *BroadPhaseLayerInterface) -> void #foreign JoltC "JPH_Body_ApplySoftBodyCreationSettings";
}

BroadPhaseLayerInterface :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        GetNumBroadPhaseLayers : #type (*void) -> u32 #c_call;
        GetBroadPhaseLayer : #type (*void, ObjectLayer) -> BroadPhaseLayer #c_call;
        GetBroadPhaseLayerName : #type (*void, BroadPhaseLayer) -> *s8 #c_call;
    }

    opaque : s8;

    Create :: (data : *void, funcs : BroadPhaseLayerInterface.Funcs, allocator : JoltCAllocator) -> *BroadPhaseLayerInterface #foreign JoltC "JPH_BroadPhaseLayerInterface_Create";

    Destroy :: (self : *BroadPhaseLayerInterface) -> void #foreign JoltC "JPH_BroadPhaseLayerInterface_Destroy";
    GetNumBroadPhaseLayers :: (bplInterface : *BroadPhaseLayerInterface) -> u32 #foreign JoltC "JPH_BroadPhaseLayerInterface_GetNumBroadPhaseLayers";
    GetBroadPhaseLayer :: (bplInterface : *BroadPhaseLayerInterface, objectLayer : ObjectLayer) -> BroadPhaseLayer #foreign JoltC "JPH_BroadPhaseLayerInterface_GetBroadPhaseLayer";
    GetBroadPhaseLayerName :: (bplInterface : *BroadPhaseLayerInterface, broadPhaseLayer : BroadPhaseLayer) -> *s8 #foreign JoltC "JPH_BroadPhaseLayerInterface_GetBroadPhaseLayerName";
}

BroadPhaseLayerInterfaceTable :: struct {
    #as using,except(base) base : BroadPhaseLayerInterface;

    Create :: (numObjectLayers : u32, numBroadPhaseLayers : u32) -> *BroadPhaseLayerInterfaceTable #foreign JoltC "JPH_BroadPhaseLayerInterfaceTable_Create";

    MapObjectToBroadPhaseLayer :: (table : *BroadPhaseLayerInterfaceTable, objectLayer : ObjectLayer, broadPhaseLayer : BroadPhaseLayer) -> void #foreign JoltC "JPH_BroadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer";
    SetBroadPhaseLayerName :: (table : *BroadPhaseLayerInterfaceTable, broadPhaseLayer : BroadPhaseLayer, name : *s8) -> void #foreign JoltC "JPH_BroadPhaseLayerInterfaceTable_SetBroadPhaseLayerName";
}

BroadPhaseLayerInterfaceMask :: struct {
    #as using,except(base) base : BroadPhaseLayerInterface;

    Create :: (numBroadPhaseLayers : u32) -> *BroadPhaseLayerInterfaceMask #foreign JoltC "JPH_BroadPhaseLayerInterfaceMask_Create";

    ConfigureLayer :: (mask : *BroadPhaseLayerInterfaceMask, broadPhaseLayer : BroadPhaseLayer, groupsToInclude : u32, groupsToExclude : u32) -> void #foreign JoltC "JPH_BroadPhaseLayerInterfaceMask_ConfigureLayer";
    SetBroadPhaseLayerName :: (mask : *BroadPhaseLayerInterfaceMask, broadPhaseLayer : BroadPhaseLayer, name : *s8) -> void #foreign JoltC "JPH_BroadPhaseLayerInterfaceMask_SetBroadPhaseLayerName";
}

ObjectLayerPairFilter :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        ShouldCollide : #type (*void, ObjectLayer, ObjectLayer) -> bool #c_call;
    }

    opaque : s8;

    Create :: (data : *void, funcs : ObjectLayerPairFilter.Funcs, allocator : JoltCAllocator) -> *ObjectLayerPairFilter #foreign JoltC "JPH_ObjectLayerPairFilter_Create";

    Destroy :: (self : *ObjectLayerPairFilter) -> void #foreign JoltC "JPH_ObjectLayerPairFilter_Destroy";
    ShouldCollide :: (filter : *ObjectLayerPairFilter, layer1 : ObjectLayer, layer2 : ObjectLayer) -> bool #foreign JoltC "JPH_ObjectLayerPairFilter_ShouldCollide";
}

ObjectLayerPairFilterTable :: struct {
    #as using,except(base) base : ObjectLayerPairFilter;

    Create :: (numObjectLayers : u32) -> *ObjectLayerPairFilterTable #foreign JoltC "JPH_ObjectLayerPairFilterTable_Create";

    GetNumObjectLayers :: (table : *ObjectLayerPairFilterTable) -> u32 #foreign JoltC "JPH_ObjectLayerPairFilterTable_GetNumObjectLayers";
    EnableCollision :: (table : *ObjectLayerPairFilterTable, layer1 : ObjectLayer, layer2 : ObjectLayer) -> void #foreign JoltC "JPH_ObjectLayerPairFilterTable_EnableCollision";
    DisableCollision :: (table : *ObjectLayerPairFilterTable, layer1 : ObjectLayer, layer2 : ObjectLayer) -> void #foreign JoltC "JPH_ObjectLayerPairFilterTable_DisableCollision";
}

ObjectLayerPairFilterMask :: struct {
    cNumBits :: (OBJECT_LAYER_BITS/2);
    cMask :: ((1<<ObjectLayerPairFilterMask.cNumBits)-1);

    #as using,except(base) base : ObjectLayerPairFilter;

    Create :: () -> *ObjectLayerPairFilterMask #foreign JoltC "JPH_ObjectLayerPairFilterMask_Create";
    GetGroup :: (objectLayer : ObjectLayer) -> u32 #foreign JoltC "JPH_ObjectLayerPairFilterMask_GetGroup";
    GetMask :: (objectLayer : ObjectLayer) -> u32 #foreign JoltC "JPH_ObjectLayerPairFilterMask_GetMask";
    GetObjectLayer :: (group : u32, mask : u32) -> ObjectLayer #foreign JoltC "JPH_ObjectLayerPairFilterMask_GetObjectLayer";
}

ObjectVsBroadPhaseLayerFilter :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        ShouldCollide : #type (*void, ObjectLayer, BroadPhaseLayer) -> bool #c_call;
    }

    opaque : s8;

    Create :: (data : *void, funcs : ObjectVsBroadPhaseLayerFilter.Funcs, allocator : JoltCAllocator) -> *ObjectVsBroadPhaseLayerFilter #foreign JoltC "JPH_ObjectVsBroadPhaseLayerFilter_Create";

    Destroy :: (self : *ObjectVsBroadPhaseLayerFilter) -> void #foreign JoltC "JPH_ObjectVsBroadPhaseLayerFilter_Destroy";
    ShouldCollide :: (filter : *ObjectVsBroadPhaseLayerFilter, objectLayer : ObjectLayer, broadPhaseLayer : BroadPhaseLayer) -> bool #foreign JoltC "JPH_ObjectVsBroadPhaseLayerFilter_ShouldCollide";
}

ObjectVsBroadPhaseLayerFilterTable :: struct {
    #as using,except(base) base : ObjectVsBroadPhaseLayerFilter;

    Create :: (bplInterface : *BroadPhaseLayerInterface, numBroadPhaseLayers : u32, objectLayerPairFilter : *ObjectLayerPairFilter, numObjectLayers : u32) -> *ObjectVsBroadPhaseLayerFilterTable #foreign JoltC "JPH_ObjectVsBroadPhaseLayerFilterTable_Create";
}

ObjectVsBroadPhaseLayerFilterMask :: struct {
    #as using,except(base) base : ObjectVsBroadPhaseLayerFilter;

    Create :: (bplInterface : *BroadPhaseLayerInterfaceMask) -> *ObjectVsBroadPhaseLayerFilterMask #foreign JoltC "JPH_ObjectVsBroadPhaseLayerFilterMask_Create";
}

BroadPhaseLayerFilter :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        ShouldCollide : #type (*void, BroadPhaseLayer) -> bool #c_call;
    }

    opaque : s8;

    Create :: (data : *void, funcs : BroadPhaseLayerFilter.Funcs, allocator : JoltCAllocator) -> *BroadPhaseLayerFilter #foreign JoltC "JPH_BroadPhaseLayerFilter_Create";

    Destroy :: (self : *BroadPhaseLayerFilter) -> void #foreign JoltC "JPH_BroadPhaseLayerFilter_Destroy";
}

ObjectLayerFilter :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        ShouldCollide : #type (*void, ObjectLayer) -> bool #c_call;
    }

    opaque : s8;

    Create :: (data : *void, funcs : ObjectLayerFilter.Funcs, allocator : JoltCAllocator) -> *ObjectLayerFilter #foreign JoltC "JPH_ObjectLayerFilter_Create";

    Destroy :: (self : *ObjectLayerFilter) -> void #foreign JoltC "JPH_ObjectLayerFilter_Destroy";
}

GroupFilter :: struct {
    opaque : s8;
}

BodyFilter :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        ShouldCollide : #type (*void, BodyID) -> bool #c_call;
        ShouldCollideLocked : #type (*void, *Body) -> bool #c_call;
    }

    opaque : s8;

    Create :: (data : *void, funcs : BodyFilter.Funcs, allocator : JoltCAllocator) -> *BodyFilter #foreign JoltC "JPH_BodyFilter_Create";

    Destroy :: (self : *BodyFilter) -> void #foreign JoltC "JPH_BodyFilter_Destroy";
}

IgnoreMultipleBodiesFilter :: struct {
    #as using,except(base) base : BodyFilter;

    Create :: (bodyIDs : *BodyID, numBodies : s32, allocator : JoltCAllocator) -> *IgnoreMultipleBodiesFilter #foreign JoltC "JPH_IgnoreMultipleBodiesFilter_Create";
}

IgnoreSingleBodyFilter :: struct {
    #as using,except(base) base : BodyFilter;

    Create :: (bodyID : BodyID, allocator : JoltCAllocator) -> *IgnoreSingleBodyFilter #foreign JoltC "JPH_IgnoreSingleBodyFilter_Create";
}

IgnoreSingleBodyFilterChained :: struct {
    #as using,except(base) base : BodyFilter;

    Create :: (bodyID : BodyID, otherFilter : *BodyFilter, allocator : JoltCAllocator) -> *IgnoreSingleBodyFilterChained #foreign JoltC "JPH_IgnoreSingleBodyFilterChained_Create";
}

ShapeFilter :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        ShouldCollide : #type (*void, *Shape, SubShapeID) -> bool #c_call;
        ShapesShouldCollide : #type (*void, *Shape, SubShapeID, *Shape, SubShapeID) -> bool #c_call;
    }

    opaque : s8;

    Create :: (data : *void, funcs : ShapeFilter.Funcs, allocator : JoltCAllocator) -> *ShapeFilter #foreign JoltC "JPH_ShapeFilter_Create";

    Destroy :: (self : *ShapeFilter) -> void #foreign JoltC "JPH_ShapeFilter_Destroy";
}

ReversedShapeFilter :: struct {
    #as using,except(base) base : ShapeFilter;

    Create :: (other : *ShapeFilter, allocator : JoltCAllocator) -> *ReversedShapeFilter #foreign JoltC "JPH_ReversedShapeFilter_Create";
}

SimShapeFilter :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        ShouldCollide : #type (*void, *Body, *Shape, SubShapeID, *Body, *Shape, SubShapeID) -> bool #c_call;
    }

    opaque : s8;

    Create :: (data : *void, funcs : SimShapeFilter.Funcs, allocator : JoltCAllocator) -> *SimShapeFilter #foreign JoltC "JPH_SimShapeFilter_Create";

    Destroy :: (self : *SimShapeFilter) -> void #foreign JoltC "JPH_SimShapeFilter_Destroy";
}

BroadPhaseQuery :: struct {
    CastRayHitCallback :: #type (*void, *BroadPhaseCastResult) -> void #c_call;
    CastRayCollectCallback :: #type (*void, *BroadPhaseCastResult) -> float #c_call;

    GetBounds :: (query : *BroadPhaseQuery) -> AABox #foreign JoltC "JPH_BroadPhaseQuery_GetBounds";
    CastRaySimple :: (query : *BroadPhaseQuery, ray : RayCast, collectorType : ECollisionCollectorType, callbackData : *void, callback : BroadPhaseQuery.CastRayHitCallback, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter) -> bool #foreign JoltC "JPH_BroadPhaseQuery_CastRaySimple";
    CastRay :: (query : *BroadPhaseQuery, ray : RayCast, collector : *RayCastBodyCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter) -> void #foreign JoltC "JPH_BroadPhaseQuery_CastRay";
    CollideAABox :: (query : *BroadPhaseQuery, box : AABox, collector : *CollideShapeBodyCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter) -> void #foreign JoltC "JPH_BroadPhaseQuery_CollideAABox";
    CollideSphere :: (query : *BroadPhaseQuery, center : Vec3, radius : float, collector : *CollideShapeBodyCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter) -> void #foreign JoltC "JPH_BroadPhaseQuery_CollideSphere";
    CollidePoint :: (query : *BroadPhaseQuery, point : Vec3, collector : *CollideShapeBodyCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter) -> void #foreign JoltC "JPH_BroadPhaseQuery_CollidePoint";
    CollideOrientedBox :: (query : *BroadPhaseQuery, box : OrientedBox, collector : *CollideShapeBodyCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter) -> void #foreign JoltC "JPH_BroadPhaseQuery_CollideOrientedBox";
    CastAABox :: (query : *BroadPhaseQuery, box : AABoxCast, collector : *CastShapeBodyCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter) -> void #foreign JoltC "JPH_BroadPhaseQuery_CastAABox";
}

NarrowPhaseQuery :: struct {
    CastRayClosest :: (query : *NarrowPhaseQuery, ray : RRayCast, ioHit : *RayCastResult, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter) -> bool #foreign JoltC "JPH_NarrowPhaseQuery_CastRayClosest";
    CastRay :: (query : *NarrowPhaseQuery, ray : RRayCast, settings : RayCastSettings, collector : *CastRayCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter) -> void #foreign JoltC "JPH_NarrowPhaseQuery_CastRay";
    CollidePoint :: (query : *NarrowPhaseQuery, point : RVec3, collector : *CollidePointCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter) -> void #foreign JoltC "JPH_NarrowPhaseQuery_CollidePoint";
    CollideShape :: (query : *NarrowPhaseQuery, shape : *Shape, shapeScale : Vec3, centerOfMassTransform : RMat44, settings : CollideShapeSettings, baseOffset : RVec3, collector : *CollideShapeCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter) -> void #foreign JoltC "JPH_NarrowPhaseQuery_CollideShape";
    CollideShapeWithInternalEdgeRemoval :: (query : *NarrowPhaseQuery, shape : *Shape, shapeScale : Vec3, centerOfMassTransform : RMat44, settings : CollideShapeSettings, baseOffset : RVec3, collector : *CollideShapeCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter) -> void #foreign JoltC "JPH_NarrowPhaseQuery_CollideShapeWithInternalEdgeRemoval";
    CastShape :: (query : *NarrowPhaseQuery, shapeCast : RShapeCast, shapeCastSettings : ShapeCastSettings, baseOffset : RVec3, collector : *CastShapeCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter) -> void #foreign JoltC "JPH_NarrowPhaseQuery_CastShape";
    CollectTransformedShapes :: (query : *NarrowPhaseQuery, box : AABox, collector : *TransformedShapeCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter) -> void #foreign JoltC "JPH_NarrowPhaseQuery_CollectTransformedShapes";
}

CollisionGroup :: struct {
    GroupID :: u32;
    SubGroupID :: u32;

    groupFilter : *GroupFilter;
    groupID : CollisionGroup.GroupID;
    subGroupID : CollisionGroup.SubGroupID;
}

DefaultBroadPhaseLayerFilter :: struct {
    objectVsBroadPhaseLayerFilter : *ObjectVsBroadPhaseLayerFilter;
    layer : ObjectLayer;

    ShouldCollide :: (data : *void, layer : BroadPhaseLayer) -> bool #foreign JoltC "JPH_DefaultBroadPhaseLayerFilter_ShouldCollide";

    CreateFilter :: (filter : *DefaultBroadPhaseLayerFilter, allocator : JoltCAllocator) -> *BroadPhaseLayerFilter #foreign JoltC "JPH_DefaultBroadPhaseLayerFilter_CreateFilter";
}

DefaultObjectLayerFilter :: struct {
    objectLayerPairFilter : *ObjectLayerPairFilter;
    layer : ObjectLayer;

    ShouldCollide :: (data : *void, layer : ObjectLayer) -> bool #foreign JoltC "JPH_DefaultObjectLayerFilter_ShouldCollide";

    CreateFilter :: (filter : *DefaultObjectLayerFilter, allocator : JoltCAllocator) -> *ObjectLayerFilter #foreign JoltC "JPH_DefaultObjectLayerFilter_CreateFilter";
}

RayCast :: struct {
    origin : Vec3;
    direction : Vec3;

    Make :: (origin : Vec3, direction : Vec3, length : float) -> RayCast #foreign JoltC "JPH_RayCast_Make";

    Transformed :: (ray : *RayCast, transform : Mat44) -> RayCast #foreign JoltC "JPH_RayCast_Transformed";
    Translated :: (ray : *RayCast, translation : Vec3) -> RayCast #foreign JoltC "JPH_RayCast_Translated";
    GetPointOnRay :: (ray : *RayCast, fraction : float) -> Vec3 #foreign JoltC "JPH_RayCast_GetPointOnRay";
}

RRayCast :: struct {
    origin : RVec3;
    direction : Vec3;

    Make :: (origin : RVec3, direction : Vec3, length : float) -> RRayCast #foreign JoltC "JPH_RRayCast_Make";

    Transformed :: (ray : *RRayCast, transform : RMat44) -> RRayCast #foreign JoltC "JPH_RRayCast_Transformed";
    Translated :: (ray : *RRayCast, translation : RVec3) -> RRayCast #foreign JoltC "JPH_RRayCast_Translated";
    GetPointOnRay :: (ray : *RRayCast, fraction : float) -> RVec3 #foreign JoltC "JPH_RRayCast_GetPointOnRay";
}

RayCastSettings :: struct {
    backFaceModeTriangles : EBackFaceMode;
    backFaceModeConvex : EBackFaceMode;
    treatConvexAsSolid : bool;

    Default :: () -> RayCastSettings #foreign JoltC "JPH_RayCastSettings_Default";
}

AABoxCast :: struct {
    box : AABox;
    direction : Vec3;
}

BroadPhaseCastResult :: struct {
    bodyID : BodyID;
    fraction : float;
}

RayCastResult :: struct {
    bodyID : BodyID;
    fraction : float;
    subShapeID2 : SubShapeID;

    Default :: () -> RayCastResult #foreign JoltC "JPH_RayCastResult_Default";
}

CollidePointResult :: struct {
    bodyID : BodyID;
    subShapeID : SubShapeID;
}

CollideShapeResult :: struct {
    Face :: struct {
        size : u64;
        elements : [32]Vec3;
    }

    contactPointOn1 : Vec3;
    contactPointOn2 : Vec3;
    penetrationAxis : Vec3;
    penetrationDepth : float;
    subShapeID1 : SubShapeID;
    subShapeID2 : SubShapeID;
    bodyID2 : BodyID;
    shape1Face : CollideShapeResult.Face;
    shape2Face : CollideShapeResult.Face;
}

ShapeCastResult :: struct {
    contactPointOn1 : Vec3;
    contactPointOn2 : Vec3;
    penetrationAxis : Vec3;
    penetrationDepth : float;
    subShapeID1 : SubShapeID;
    subShapeID2 : SubShapeID;
    bodyID2 : BodyID;
    shape1Face : CollideShapeResult.Face;
    shape2Face : CollideShapeResult.Face;
    fraction : float;
    isBackFaceHit : bool;
}

ShapeCastSettings :: struct {
    activeEdgeMode : EActiveEdgeMode;
    collectFacesMode : ECollectFacesMode;
    collisionTolerance : float;
    penetrationTolerance : float;
    activeEdgeMovementDirection : Vec3;
    extraConvexRadius : float;
    backFaceModeTriangles : EBackFaceMode;
    backFaceModeConvex : EBackFaceMode;
    useShrunkenShapeAndConvexRadius : bool;
    returnDeepestPoint : bool;

    Default :: () -> ShapeCastSettings #foreign JoltC "JPH_ShapeCastSettings_Default";
}

CollideShapeSettings :: struct {
    activeEdgeMode : EActiveEdgeMode;
    collectFacesMode : ECollectFacesMode;
    collisionTolerance : float;
    penetrationTolerance : float;
    activeEdgeMovementDirection : Vec3;
    maxSeparationDistance : float;
    backFaceMode : EBackFaceMode;
    internalEdgeRemovalVertexToleranceSq : float;

    Default :: () -> CollideShapeSettings #foreign JoltC "JPH_CollideShapeSettings_Default";
}

RShapeCast :: struct {
    shape : *Shape;
    scale : Vec3;
    centerOfMassStart : RMat44;
    direction : Vec3;
    shapeWorldBounds : AABox;
}

RayCastBodyCollector :: struct {
    Funcs :: struct {
        Destruct : #type (*RayCastBodyCollector, *void) -> void #c_call;
        Reset : #type (*RayCastBodyCollector, *void) -> void #c_call;
        OnBody : #type (*RayCastBodyCollector, *void, *Body) -> void #c_call;
        OnBodyEnd : #type (*RayCastBodyCollector, *void) -> void #c_call;
        SetUserData : #type (*RayCastBodyCollector, *void, u64) -> void #c_call;
        AddHit : #type (*RayCastBodyCollector, *void, BroadPhaseCastResult) -> void #c_call;
    }

    Create :: (data : *void, funcs : RayCastBodyCollector.Funcs, allocator : JoltCAllocator) -> *RayCastBodyCollector #foreign JoltC "JPH_RayCastBodyCollector_Create";

    Destroy :: (self : *RayCastBodyCollector) -> void #foreign JoltC "JPH_RayCastBodyCollector_Destroy";
    UpdateEarlyOutFraction :: (collector : *RayCastBodyCollector, fraction : float) -> void #foreign JoltC "JPH_RayCastBodyCollector_UpdateEarlyOutFraction";
    SetEarlyOutFraction :: (collector : *RayCastBodyCollector, fraction : float) -> void #foreign JoltC "JPH_RayCastBodyCollector_SetEarlyOutFraction";
    GetEarlyOutFraction :: (collector : *RayCastBodyCollector) -> float #foreign JoltC "JPH_RayCastBodyCollector_GetEarlyOutFraction";
    GetPositiveEarlyOutFraction :: (collector : *RayCastBodyCollector) -> float #foreign JoltC "JPH_RayCastBodyCollector_GetPositiveEarlyOutFraction";
    ResetEarlyOutFraction :: (collector : *RayCastBodyCollector) -> void #foreign JoltC "JPH_RayCastBodyCollector_ResetEarlyOutFraction";
    ForceEarlyOut :: (collector : *RayCastBodyCollector) -> void #foreign JoltC "JPH_RayCastBodyCollector_ForceEarlyOut";
    ShouldEarlyOut :: (collector : *RayCastBodyCollector) -> bool #foreign JoltC "JPH_RayCastBodyCollector_ShouldEarlyOut";
}

CastShapeBodyCollector :: struct {
    Funcs :: struct {
        Destruct : #type (*CastShapeBodyCollector, *void) -> void #c_call;
        Reset : #type (*CastShapeBodyCollector, *void) -> void #c_call;
        OnBody : #type (*CastShapeBodyCollector, *void, *Body) -> void #c_call;
        OnBodyEnd : #type (*CastShapeBodyCollector, *void) -> void #c_call;
        SetUserData : #type (*CastShapeBodyCollector, *void, u64) -> void #c_call;
        AddHit : #type (*CastShapeBodyCollector, *void, BroadPhaseCastResult) -> void #c_call;
    }

    Create :: (data : *void, funcs : CastShapeBodyCollector.Funcs, allocator : JoltCAllocator) -> *CastShapeBodyCollector #foreign JoltC "JPH_CastShapeBodyCollector_Create";

    Destroy :: (self : *CastShapeBodyCollector) -> void #foreign JoltC "JPH_CastShapeBodyCollector_Destroy";
    UpdateEarlyOutFraction :: (collector : *CastShapeBodyCollector, fraction : float) -> void #foreign JoltC "JPH_CastShapeBodyCollector_UpdateEarlyOutFraction";
    SetEarlyOutFraction :: (collector : *CastShapeBodyCollector, fraction : float) -> void #foreign JoltC "JPH_CastShapeBodyCollector_SetEarlyOutFraction";
    GetEarlyOutFraction :: (collector : *CastShapeBodyCollector) -> float #foreign JoltC "JPH_CastShapeBodyCollector_GetEarlyOutFraction";
    GetPositiveEarlyOutFraction :: (collector : *CastShapeBodyCollector) -> float #foreign JoltC "JPH_CastShapeBodyCollector_GetPositiveEarlyOutFraction";
    ResetEarlyOutFraction :: (collector : *CastShapeBodyCollector) -> void #foreign JoltC "JPH_CastShapeBodyCollector_ResetEarlyOutFraction";
    ForceEarlyOut :: (collector : *CastShapeBodyCollector) -> void #foreign JoltC "JPH_CastShapeBodyCollector_ForceEarlyOut";
    ShouldEarlyOut :: (collector : *CastShapeBodyCollector) -> bool #foreign JoltC "JPH_CastShapeBodyCollector_ShouldEarlyOut";
}

CollideShapeBodyCollector :: struct {
    Funcs :: struct {
        Destruct : #type (*CollideShapeBodyCollector, *void) -> void #c_call;
        Reset : #type (*CollideShapeBodyCollector, *void) -> void #c_call;
        OnBody : #type (*CollideShapeBodyCollector, *void, *Body) -> void #c_call;
        OnBodyEnd : #type (*CollideShapeBodyCollector, *void) -> void #c_call;
        SetUserData : #type (*CollideShapeBodyCollector, *void, u64) -> void #c_call;
        AddHit : #type (*CollideShapeBodyCollector, *void, BodyID) -> void #c_call;
    }

    Create :: (data : *void, funcs : CollideShapeBodyCollector.Funcs, allocator : JoltCAllocator) -> *CollideShapeBodyCollector #foreign JoltC "JPH_CollideShapeBodyCollector_Create";

    Destroy :: (self : *CollideShapeBodyCollector) -> void #foreign JoltC "JPH_CollideShapeBodyCollector_Destroy";
    UpdateEarlyOutFraction :: (collector : *CollideShapeBodyCollector, fraction : float) -> void #foreign JoltC "JPH_CollideShapeBodyCollector_UpdateEarlyOutFraction";
    SetEarlyOutFraction :: (collector : *CollideShapeBodyCollector, fraction : float) -> void #foreign JoltC "JPH_CollideShapeBodyCollector_SetEarlyOutFraction";
    GetEarlyOutFraction :: (collector : *CollideShapeBodyCollector) -> float #foreign JoltC "JPH_CollideShapeBodyCollector_GetEarlyOutFraction";
    GetPositiveEarlyOutFraction :: (collector : *CollideShapeBodyCollector) -> float #foreign JoltC "JPH_CollideShapeBodyCollector_GetPositiveEarlyOutFraction";
    ResetEarlyOutFraction :: (collector : *CollideShapeBodyCollector) -> void #foreign JoltC "JPH_CollideShapeBodyCollector_ResetEarlyOutFraction";
    ForceEarlyOut :: (collector : *CollideShapeBodyCollector) -> void #foreign JoltC "JPH_CollideShapeBodyCollector_ForceEarlyOut";
    ShouldEarlyOut :: (collector : *CollideShapeBodyCollector) -> bool #foreign JoltC "JPH_CollideShapeBodyCollector_ShouldEarlyOut";
}

CastRayCollector :: struct {
    Funcs :: struct {
        Destruct : #type (*CastRayCollector, *void) -> void #c_call;
        Reset : #type (*CastRayCollector, *void) -> void #c_call;
        OnBody : #type (*CastRayCollector, *void, *Body) -> void #c_call;
        OnBodyEnd : #type (*CastRayCollector, *void) -> void #c_call;
        SetUserData : #type (*CastRayCollector, *void, u64) -> void #c_call;
        AddHit : #type (*CastRayCollector, *void, RayCastResult) -> void #c_call;
    }

    Create :: (data : *void, funcs : CastRayCollector.Funcs, allocator : JoltCAllocator) -> *CastRayCollector #foreign JoltC "JPH_CastRayCollector_Create";

    Destroy :: (self : *CastRayCollector) -> void #foreign JoltC "JPH_CastRayCollector_Destroy";
    UpdateEarlyOutFraction :: (collector : *CastRayCollector, fraction : float) -> void #foreign JoltC "JPH_CastRayCollector_UpdateEarlyOutFraction";
    SetEarlyOutFraction :: (collector : *CastRayCollector, fraction : float) -> void #foreign JoltC "JPH_CastRayCollector_SetEarlyOutFraction";
    GetEarlyOutFraction :: (collector : *CastRayCollector) -> float #foreign JoltC "JPH_CastRayCollector_GetEarlyOutFraction";
    GetPositiveEarlyOutFraction :: (collector : *CastRayCollector) -> float #foreign JoltC "JPH_CastRayCollector_GetPositiveEarlyOutFraction";
    ResetEarlyOutFraction :: (collector : *CastRayCollector) -> void #foreign JoltC "JPH_CastRayCollector_ResetEarlyOutFraction";
    ForceEarlyOut :: (collector : *CastRayCollector) -> void #foreign JoltC "JPH_CastRayCollector_ForceEarlyOut";
    ShouldEarlyOut :: (collector : *CastRayCollector) -> bool #foreign JoltC "JPH_CastRayCollector_ShouldEarlyOut";
}

CastShapeCollector :: struct {
    Funcs :: struct {
        Destruct : #type (*CastShapeCollector, *void) -> void #c_call;
        Reset : #type (*CastShapeCollector, *void) -> void #c_call;
        OnBody : #type (*CastShapeCollector, *void, *Body) -> void #c_call;
        OnBodyEnd : #type (*CastShapeCollector, *void) -> void #c_call;
        SetUserData : #type (*CastShapeCollector, *void, u64) -> void #c_call;
        AddHit : #type (*CastShapeCollector, *void, ShapeCastResult) -> void #c_call;
    }

    Create :: (data : *void, funcs : CastShapeCollector.Funcs, allocator : JoltCAllocator) -> *CastShapeCollector #foreign JoltC "JPH_CastShapeCollector_Create";

    Destroy :: (self : *CastShapeCollector) -> void #foreign JoltC "JPH_CastShapeCollector_Destroy";
    UpdateEarlyOutFraction :: (collector : *CastShapeCollector, fraction : float) -> void #foreign JoltC "JPH_CastShapeCollector_UpdateEarlyOutFraction";
    SetEarlyOutFraction :: (collector : *CastShapeCollector, fraction : float) -> void #foreign JoltC "JPH_CastShapeCollector_SetEarlyOutFraction";
    GetEarlyOutFraction :: (collector : *CastShapeCollector) -> float #foreign JoltC "JPH_CastShapeCollector_GetEarlyOutFraction";
    GetPositiveEarlyOutFraction :: (collector : *CastShapeCollector) -> float #foreign JoltC "JPH_CastShapeCollector_GetPositiveEarlyOutFraction";
    ResetEarlyOutFraction :: (collector : *CastShapeCollector) -> void #foreign JoltC "JPH_CastShapeCollector_ResetEarlyOutFraction";
    ForceEarlyOut :: (collector : *CastShapeCollector) -> void #foreign JoltC "JPH_CastShapeCollector_ForceEarlyOut";
    ShouldEarlyOut :: (collector : *CastShapeCollector) -> bool #foreign JoltC "JPH_CastShapeCollector_ShouldEarlyOut";
}

CollidePointCollector :: struct {
    Funcs :: struct {
        Destruct : #type (*CollidePointCollector, *void) -> void #c_call;
        Reset : #type (*CollidePointCollector, *void) -> void #c_call;
        OnBody : #type (*CollidePointCollector, *void, *Body) -> void #c_call;
        OnBodyEnd : #type (*CollidePointCollector, *void) -> void #c_call;
        SetUserData : #type (*CollidePointCollector, *void, u64) -> void #c_call;
        AddHit : #type (*CollidePointCollector, *void, CollidePointResult) -> void #c_call;
    }

    Create :: (data : *void, funcs : CollidePointCollector.Funcs, allocator : JoltCAllocator) -> *CollidePointCollector #foreign JoltC "JPH_CollidePointCollector_Create";

    Destroy :: (self : *CollidePointCollector) -> void #foreign JoltC "JPH_CollidePointCollector_Destroy";
    UpdateEarlyOutFraction :: (collector : *CollidePointCollector, fraction : float) -> void #foreign JoltC "JPH_CollidePointCollector_UpdateEarlyOutFraction";
    SetEarlyOutFraction :: (collector : *CollidePointCollector, fraction : float) -> void #foreign JoltC "JPH_CollidePointCollector_SetEarlyOutFraction";
    GetEarlyOutFraction :: (collector : *CollidePointCollector) -> float #foreign JoltC "JPH_CollidePointCollector_GetEarlyOutFraction";
    GetPositiveEarlyOutFraction :: (collector : *CollidePointCollector) -> float #foreign JoltC "JPH_CollidePointCollector_GetPositiveEarlyOutFraction";
    ResetEarlyOutFraction :: (collector : *CollidePointCollector) -> void #foreign JoltC "JPH_CollidePointCollector_ResetEarlyOutFraction";
    ForceEarlyOut :: (collector : *CollidePointCollector) -> void #foreign JoltC "JPH_CollidePointCollector_ForceEarlyOut";
    ShouldEarlyOut :: (collector : *CollidePointCollector) -> bool #foreign JoltC "JPH_CollidePointCollector_ShouldEarlyOut";
}

CollideShapeCollector :: struct {
    Funcs :: struct {
        Destruct : #type (*CollideShapeCollector, *void) -> void #c_call;
        Reset : #type (*CollideShapeCollector, *void) -> void #c_call;
        OnBody : #type (*CollideShapeCollector, *void, *Body) -> void #c_call;
        OnBodyEnd : #type (*CollideShapeCollector, *void) -> void #c_call;
        SetUserData : #type (*CollideShapeCollector, *void, u64) -> void #c_call;
        AddHit : #type (*CollideShapeCollector, *void, CollideShapeResult) -> void #c_call;
    }

    Create :: (data : *void, funcs : CollideShapeCollector.Funcs, allocator : JoltCAllocator) -> *CollideShapeCollector #foreign JoltC "JPH_CollideShapeCollector_Create";

    Destroy :: (self : *CollideShapeCollector) -> void #foreign JoltC "JPH_CollideShapeCollector_Destroy";
    UpdateEarlyOutFraction :: (collector : *CollideShapeCollector, fraction : float) -> void #foreign JoltC "JPH_CollideShapeCollector_UpdateEarlyOutFraction";
    SetEarlyOutFraction :: (collector : *CollideShapeCollector, fraction : float) -> void #foreign JoltC "JPH_CollideShapeCollector_SetEarlyOutFraction";
    GetEarlyOutFraction :: (collector : *CollideShapeCollector) -> float #foreign JoltC "JPH_CollideShapeCollector_GetEarlyOutFraction";
    GetPositiveEarlyOutFraction :: (collector : *CollideShapeCollector) -> float #foreign JoltC "JPH_CollideShapeCollector_GetPositiveEarlyOutFraction";
    ResetEarlyOutFraction :: (collector : *CollideShapeCollector) -> void #foreign JoltC "JPH_CollideShapeCollector_ResetEarlyOutFraction";
    ForceEarlyOut :: (collector : *CollideShapeCollector) -> void #foreign JoltC "JPH_CollideShapeCollector_ForceEarlyOut";
    ShouldEarlyOut :: (collector : *CollideShapeCollector) -> bool #foreign JoltC "JPH_CollideShapeCollector_ShouldEarlyOut";
}

TransformedShapeCollector :: struct {
    Funcs :: struct {
        Destruct : #type (*TransformedShapeCollector, *void) -> void #c_call;
        Reset : #type (*TransformedShapeCollector, *void) -> void #c_call;
        OnBody : #type (*TransformedShapeCollector, *void, *Body) -> void #c_call;
        OnBodyEnd : #type (*TransformedShapeCollector, *void) -> void #c_call;
        SetUserData : #type (*TransformedShapeCollector, *void, u64) -> void #c_call;
        AddHit : #type (*TransformedShapeCollector, *void, TransformedShape) -> void #c_call;
    }

    Create :: (data : *void, funcs : TransformedShapeCollector.Funcs, allocator : JoltCAllocator) -> *TransformedShapeCollector #foreign JoltC "JPH_TransformedShapeCollector_Create";

    Destroy :: (self : *TransformedShapeCollector) -> void #foreign JoltC "JPH_TransformedShapeCollector_Destroy";
    UpdateEarlyOutFraction :: (collector : *TransformedShapeCollector, fraction : float) -> void #foreign JoltC "JPH_TransformedShapeCollector_UpdateEarlyOutFraction";
    SetEarlyOutFraction :: (collector : *TransformedShapeCollector, fraction : float) -> void #foreign JoltC "JPH_TransformedShapeCollector_SetEarlyOutFraction";
    GetEarlyOutFraction :: (collector : *TransformedShapeCollector) -> float #foreign JoltC "JPH_TransformedShapeCollector_GetEarlyOutFraction";
    GetPositiveEarlyOutFraction :: (collector : *TransformedShapeCollector) -> float #foreign JoltC "JPH_TransformedShapeCollector_GetPositiveEarlyOutFraction";
    ResetEarlyOutFraction :: (collector : *TransformedShapeCollector) -> void #foreign JoltC "JPH_TransformedShapeCollector_ResetEarlyOutFraction";
    ForceEarlyOut :: (collector : *TransformedShapeCollector) -> void #foreign JoltC "JPH_TransformedShapeCollector_ForceEarlyOut";
    ShouldEarlyOut :: (collector : *TransformedShapeCollector) -> bool #foreign JoltC "JPH_TransformedShapeCollector_ShouldEarlyOut";
}

BodyInterface :: struct {
    CreateBody :: (bodyInterface : *BodyInterface, settings : *BodyCreationSettings) -> *Body #foreign JoltC "JPH_BodyInterface_CreateBody";
    CreateSoftBody :: (bodyInterface : *BodyInterface, settings : *SoftBodyCreationSettings) -> *Body #foreign JoltC "JPH_BodyInterface_CreateSoftBody";
    CreateBodyWithID :: (bodyInterface : *BodyInterface, bodyID : BodyID, settings : *BodyCreationSettings) -> *Body #foreign JoltC "JPH_BodyInterface_CreateBodyWithID";
    CreateSoftBodyWithID :: (bodyInterface : *BodyInterface, bodyID : BodyID, settings : *SoftBodyCreationSettings) -> *Body #foreign JoltC "JPH_BodyInterface_CreateSoftBodyWithID";
    CreateBodyWithoutID :: (bodyInterface : *BodyInterface, settings : *BodyCreationSettings) -> *Body #foreign JoltC "JPH_BodyInterface_CreateBodyWithoutID";
    CreateSoftBodyWithoutID :: (bodyInterface : *BodyInterface, settings : *SoftBodyCreationSettings) -> *Body #foreign JoltC "JPH_BodyInterface_CreateSoftBodyWithoutID";
    DestroyBodyWithoutID :: (bodyInterface : *BodyInterface, body : *Body) -> void #foreign JoltC "JPH_BodyInterface_DestroyBodyWithoutID";
    AssignBodyID :: (bodyInterface : *BodyInterface, ioBody : *Body) -> bool #foreign JoltC "JPH_BodyInterface_AssignBodyID";
    SetBodyID :: (bodyInterface : *BodyInterface, ioBody : *Body, bodyID : BodyID) -> bool #foreign JoltC "JPH_BodyInterface_SetBodyID";
    UnassignBodyID :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> *Body #foreign JoltC "JPH_BodyInterface_UnassignBodyID";
    UnassignBodyIDs :: (bodyInterface : *BodyInterface, bodyIDs : *BodyID, count : s32, outBodies : **Body) -> void #foreign JoltC "JPH_BodyInterface_UnassignBodyIDs";
    DestroyBody :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> void #foreign JoltC "JPH_BodyInterface_DestroyBody";
    DestroyBodies :: (bodyInterface : *BodyInterface, bodyIDs : *BodyID, count : s32) -> void #foreign JoltC "JPH_BodyInterface_DestroyBodies";
    AddBody :: (bodyInterface : *BodyInterface, bodyID : BodyID, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_AddBody";
    RemoveBody :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> void #foreign JoltC "JPH_BodyInterface_RemoveBody";
    IsAdded :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> bool #foreign JoltC "JPH_BodyInterface_IsAdded";
    CreateAndAddBody :: (bodyInterface : *BodyInterface, settings : *BodyCreationSettings, activationMode : EActivation) -> BodyID #foreign JoltC "JPH_BodyInterface_CreateAndAddBody";
    CreateAndAddSoftBody :: (bodyInterface : *BodyInterface, settings : *SoftBodyCreationSettings, activationMode : EActivation) -> BodyID #foreign JoltC "JPH_BodyInterface_CreateAndAddSoftBody";
    ActivateConstraint :: (bodyInterface : *BodyInterface, constraint : *TwoBodyConstraint) -> void #foreign JoltC "JPH_BodyInterface_ActivateConstraint";
    MoveKinematic :: (bodyInterface : *BodyInterface, bodyID : BodyID, targetPosition : RVec3, targetRotation : Quat, deltaTime : float) -> void #foreign JoltC "JPH_BodyInterface_MoveKinematic";
    SetLinearAndAngularVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, linearVelocity : Vec3, angularVelocity : Vec3) -> void #foreign JoltC "JPH_BodyInterface_SetLinearAndAngularVelocity";
    GetLinearAndAngularVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, outLinearVelocity : *Vec3, outAngularVelocity : *Vec3) -> void #foreign JoltC "JPH_BodyInterface_GetLinearAndAngularVelocity";
    SetLinearVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, linearVelocity : Vec3) -> void #foreign JoltC "JPH_BodyInterface_SetLinearVelocity";
    GetLinearVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> Vec3 #foreign JoltC "JPH_BodyInterface_GetLinearVelocity";
    AddLinearVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, linearVelocity : Vec3) -> void #foreign JoltC "JPH_BodyInterface_AddLinearVelocity";
    AddLinearAndAngularVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, linearVelocity : Vec3, angularVelocity : Vec3) -> void #foreign JoltC "JPH_BodyInterface_AddLinearAndAngularVelocity";
    SetAngularVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, angularVelocity : Vec3) -> void #foreign JoltC "JPH_BodyInterface_SetAngularVelocity";
    GetAngularVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> Vec3 #foreign JoltC "JPH_BodyInterface_GetAngularVelocity";
    GetPointVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, point : RVec3) -> Vec3 #foreign JoltC "JPH_BodyInterface_GetPointVelocity";
    SetPositionRotationAndVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, position : RVec3, rotation : Quat, linearVelocity : Vec3, angularVelocity : Vec3) -> void #foreign JoltC "JPH_BodyInterface_SetPositionRotationAndVelocity";
    GetInverseInertia :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> Mat44 #foreign JoltC "JPH_BodyInterface_GetInverseInertia";
    GetTransformedShape :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> TransformedShape #foreign JoltC "JPH_BodyInterface_GetTransformedShape";
    GetUserData :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> u64 #foreign JoltC "JPH_BodyInterface_GetUserData";
    SetUserData :: (bodyInterface : *BodyInterface, bodyID : BodyID, userData : u64) -> void #foreign JoltC "JPH_BodyInterface_SetUserData";
    GetMaterial :: (bodyInterface : *BodyInterface, bodyID : BodyID, subShapeID : SubShapeID) -> *PhysicsMaterial #foreign JoltC "JPH_BodyInterface_GetMaterial";
    InvalidateContactCache :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> void #foreign JoltC "JPH_BodyInterface_InvalidateContactCache";
    AddBodiesPrepare :: (bodyInterface : *BodyInterface, ioBodies : *BodyID, count : s32) -> *void #foreign JoltC "JPH_BodyInterface_AddBodiesPrepare";
    AddBodiesFinalize :: (bodyInterface : *BodyInterface, ioBodies : *BodyID, count : s32, addState : *void, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_AddBodiesFinalize";
    AddBodiesAbort :: (bodyInterface : *BodyInterface, ioBodies : *BodyID, count : s32, addState : *void) -> void #foreign JoltC "JPH_BodyInterface_AddBodiesAbort";
    RemoveBodies :: (bodyInterface : *BodyInterface, ioBodies : *BodyID, count : s32) -> void #foreign JoltC "JPH_BodyInterface_RemoveBodies";
    ActivateBody :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> void #foreign JoltC "JPH_BodyInterface_ActivateBody";
    ActivateBodies :: (bodyInterface : *BodyInterface, bodyIDs : *BodyID, count : s32) -> void #foreign JoltC "JPH_BodyInterface_ActivateBodies";
    ActivateBodiesInAABox :: (bodyInterface : *BodyInterface, inBox : AABox, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter) -> void #foreign JoltC "JPH_BodyInterface_ActivateBodiesInAABox";
    DeactivateBody :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> void #foreign JoltC "JPH_BodyInterface_DeactivateBody";
    DeactivateBodies :: (bodyInterface : *BodyInterface, bodyIDs : *BodyID, count : s32) -> void #foreign JoltC "JPH_BodyInterface_DeactivateBodies";
    IsActive :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> bool #foreign JoltC "JPH_BodyInterface_IsActive";
    ResetSleepTimer :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> void #foreign JoltC "JPH_BodyInterface_ResetSleepTimer";
    GetShape :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> *Shape #foreign JoltC "JPH_BodyInterface_GetShape";
    SetShape :: (bodyInterface : *BodyInterface, bodyID : BodyID, shape : *Shape, updateMassProperties : bool, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_SetShape";
    NotifyShapeChanged :: (bodyInterface : *BodyInterface, bodyID : BodyID, inPreviousCenterOfMass : Vec3, updateMassProperties : bool, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_NotifyShapeChanged";
    SetObjectLayer :: (bodyInterface : *BodyInterface, bodyID : BodyID, layer : ObjectLayer) -> void #foreign JoltC "JPH_BodyInterface_SetObjectLayer";
    GetObjectLayer :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> ObjectLayer #foreign JoltC "JPH_BodyInterface_GetObjectLayer";
    SetPositionAndRotation :: (bodyInterface : *BodyInterface, bodyID : BodyID, position : RVec3, rotation : Quat, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_SetPositionAndRotation";
    SetPositionAndRotationWhenChanged :: (bodyInterface : *BodyInterface, bodyID : BodyID, position : RVec3, rotation : Quat, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_SetPositionAndRotationWhenChanged";
    GetPositionAndRotation :: (bodyInterface : *BodyInterface, bodyID : BodyID, outPosition : *RVec3, outRotation : *Quat) -> void #foreign JoltC "JPH_BodyInterface_GetPositionAndRotation";
    SetPosition :: (bodyInterface : *BodyInterface, bodyID : BodyID, position : RVec3, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_SetPosition";
    GetPosition :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> RVec3 #foreign JoltC "JPH_BodyInterface_GetPosition";
    GetCenterOfMassPosition :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> RVec3 #foreign JoltC "JPH_BodyInterface_GetCenterOfMassPosition";
    SetRotation :: (bodyInterface : *BodyInterface, bodyID : BodyID, rotation : Quat, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_SetRotation";
    GetRotation :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> Quat #foreign JoltC "JPH_BodyInterface_GetRotation";
    GetWorldTransform :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> RMat44 #foreign JoltC "JPH_BodyInterface_GetWorldTransform";
    GetCenterOfMassTransform :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> RMat44 #foreign JoltC "JPH_BodyInterface_GetCenterOfMassTransform";
    AddForce :: (bodyInterface : *BodyInterface, bodyID : BodyID, force : Vec3, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_AddForce";
    AddForceAtPoint :: (bodyInterface : *BodyInterface, bodyID : BodyID, force : Vec3, point : RVec3, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_AddForceAtPoint";
    AddTorque :: (bodyInterface : *BodyInterface, bodyID : BodyID, torque : Vec3, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_AddTorque";
    AddForceAndTorque :: (bodyInterface : *BodyInterface, bodyID : BodyID, force : Vec3, torque : Vec3, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_AddForceAndTorque";
    AddImpulse :: (bodyInterface : *BodyInterface, bodyID : BodyID, impulse : Vec3) -> void #foreign JoltC "JPH_BodyInterface_AddImpulse";
    AddImpulseAtPoint :: (bodyInterface : *BodyInterface, bodyID : BodyID, impulse : Vec3, point : RVec3) -> void #foreign JoltC "JPH_BodyInterface_AddImpulseAtPoint";
    AddAngularImpulse :: (bodyInterface : *BodyInterface, bodyID : BodyID, angularImpulse : Vec3) -> void #foreign JoltC "JPH_BodyInterface_AddAngularImpulse";
    ApplyBuoyancyImpulse :: (bodyInterface : *BodyInterface, bodyID : BodyID, surfacePosition : RVec3, surfaceNormal : Vec3, buoyancy : float, linearDrag : float, angularDrag : float, fluidVelocity : Vec3, gravity : Vec3, deltaTime : float) -> bool #foreign JoltC "JPH_BodyInterface_ApplyBuoyancyImpulse";
    GetBodyType :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> EBodyType #foreign JoltC "JPH_BodyInterface_GetBodyType";
    SetMotionType :: (bodyInterface : *BodyInterface, bodyID : BodyID, motionType : EMotionType, activationMode : EActivation) -> void #foreign JoltC "JPH_BodyInterface_SetMotionType";
    GetMotionType :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> EMotionType #foreign JoltC "JPH_BodyInterface_GetMotionType";
    SetMotionQuality :: (bodyInterface : *BodyInterface, bodyID : BodyID, motionQuality : EMotionQuality) -> void #foreign JoltC "JPH_BodyInterface_SetMotionQuality";
    GetMotionQuality :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> EMotionQuality #foreign JoltC "JPH_BodyInterface_GetMotionQuality";
    SetRestitution :: (bodyInterface : *BodyInterface, bodyID : BodyID, restitution : float) -> void #foreign JoltC "JPH_BodyInterface_SetRestitution";
    GetRestitution :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> float #foreign JoltC "JPH_BodyInterface_GetRestitution";
    SetFriction :: (bodyInterface : *BodyInterface, bodyID : BodyID, friction : float) -> void #foreign JoltC "JPH_BodyInterface_SetFriction";
    GetFriction :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> float #foreign JoltC "JPH_BodyInterface_GetFriction";
    SetGravityFactor :: (bodyInterface : *BodyInterface, bodyID : BodyID, gravityFactor : float) -> void #foreign JoltC "JPH_BodyInterface_SetGravityFactor";
    GetGravityFactor :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> float #foreign JoltC "JPH_BodyInterface_GetGravityFactor";
    SetMaxLinearVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, linearVelocity : float) -> void #foreign JoltC "JPH_BodyInterface_SetMaxLinearVelocity";
    GetMaxLinearVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> float #foreign JoltC "JPH_BodyInterface_GetMaxLinearVelocity";
    SetMaxAngularVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID, angularVelocity : float) -> void #foreign JoltC "JPH_BodyInterface_SetMaxAngularVelocity";
    GetMaxAngularVelocity :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> float #foreign JoltC "JPH_BodyInterface_GetMaxAngularVelocity";
    SetUseManifoldReduction :: (bodyInterface : *BodyInterface, bodyID : BodyID, useReduction : bool) -> void #foreign JoltC "JPH_BodyInterface_SetUseManifoldReduction";
    GetUseManifoldReduction :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> bool #foreign JoltC "JPH_BodyInterface_GetUseManifoldReduction";
    SetIsSensor :: (bodyInterface : *BodyInterface, bodyID : BodyID, isSensor : bool) -> void #foreign JoltC "JPH_BodyInterface_SetIsSensor";
    IsSensor :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> bool #foreign JoltC "JPH_BodyInterface_IsSensor";
    SetCollisionGroup :: (bodyInterface : *BodyInterface, bodyID : BodyID, collisionGroup : *CollisionGroup) -> void #foreign JoltC "JPH_BodyInterface_SetCollisionGroup";
    GetCollisionGroup :: (bodyInterface : *BodyInterface, bodyID : BodyID) -> *CollisionGroup #foreign JoltC "JPH_BodyInterface_GetCollisionGroup";
}

BodyLockInterface :: struct {
    TryGetBody :: (bodyLockInterface : *BodyLockInterface, bodyID : BodyID) -> *Body #foreign JoltC "JPH_BodyLockInterface_TryGetBody";
    LockRead :: (bodyLockInterface : *BodyLockInterface, bodyID : BodyID, outLock : *BodyLockRead) -> void #foreign JoltC "JPH_BodyLockInterface_LockRead";
    UnlockRead :: (bodyLockInterface : *BodyLockInterface, outLock : *BodyLockRead) -> void #foreign JoltC "JPH_BodyLockInterface_UnlockRead";
    LockWrite :: (bodyLockInterface : *BodyLockInterface, bodyID : BodyID, outLock : *BodyLockWrite) -> void #foreign JoltC "JPH_BodyLockInterface_LockWrite";
    UnlockWrite :: (bodyLockInterface : *BodyLockInterface, outLock : *BodyLockWrite) -> void #foreign JoltC "JPH_BodyLockInterface_UnlockWrite";
    LockReadMulti :: (bodyLockInterface : *BodyLockInterface, bodyIDs : *BodyID, numBodies : s32, outLock : *BodyLockMultiRead) -> void #foreign JoltC "JPH_BodyLockInterface_LockReadMulti";
    UnlockReadMulti :: (bodyLockInterface : *BodyLockInterface, outLock : *BodyLockMultiRead) -> void #foreign JoltC "JPH_BodyLockInterface_UnlockReadMulti";
    LockWriteMulti :: (bodyLockInterface : *BodyLockInterface, bodyIDs : *BodyID, numBodies : s32, outLock : *BodyLockMultiWrite) -> void #foreign JoltC "JPH_BodyLockInterface_LockWriteMulti";
    UnlockWriteMulti :: (bodyLockInterface : *BodyLockInterface, outLock : *BodyLockMultiWrite) -> void #foreign JoltC "JPH_BodyLockInterface_UnlockWriteMulti";
    LockReadAll :: (bodyLockInterface : *BodyLockInterface) -> void #foreign JoltC "JPH_BodyLockInterface_LockReadAll";
    UnlockReadAll :: (bodyLockInterface : *BodyLockInterface) -> void #foreign JoltC "JPH_BodyLockInterface_UnlockReadAll";
    LockWriteAll :: (bodyLockInterface : *BodyLockInterface) -> void #foreign JoltC "JPH_BodyLockInterface_LockWriteAll";
    UnlockWriteAll :: (bodyLockInterface : *BodyLockInterface) -> void #foreign JoltC "JPH_BodyLockInterface_UnlockWriteAll";
}

MotionProperties :: struct {}

SoftBodyMotionProperties :: struct {}

BodyManager :: struct {
    MutexMask :: u64;

    EShapeColor :: enum u32 {
        InstanceColor :: 0;
        ShapeTypeColor :: 1;
        MotionTypeColor :: 2;
        SleepColor :: 3;
        IslandColor :: 4;
        MaterialColor :: 5;
    }

    BodyStats :: struct {
        numBodies : u32;
        maxBodies : u32;
        numBodiesStatic : u32;
        numBodiesDynamic : u32;
        numActiveBodiesDynamic : u32;
        numBodiesKinematic : u32;
        numActiveBodiesKinematic : u32;
        numSoftBodies : u32;
        numActiveSoftBodies : u32;
    }

    DrawSettings :: struct {
        drawGetSupportFunction : bool;
        drawSupportDirection : bool;
        drawGetSupportingFace : bool;
        drawShape : bool;
        drawShapeWireframe : bool;
        drawShapeColor : BodyManager.EShapeColor;
        drawBoundingBox : bool;
        drawCenterOfMassTransform : bool;
        drawWorldTransform : bool;
        drawVelocity : bool;
        drawMassAndInertia : bool;
        drawSleepStats : bool;
        drawSoftBodyVertices : bool;
        drawSoftBodyVertexVelocities : bool;
        drawSoftBodyEdgeConstraints : bool;
        drawSoftBodyBendConstraints : bool;
        drawSoftBodyVolumeConstraints : bool;
        drawSoftBodySkinConstraints : bool;
        drawSoftBodyLRAConstraints : bool;
        drawSoftBodyRods : bool;
        drawSoftBodyRodStates : bool;
        drawSoftBodyRodBendTwistConstraints : bool;
        drawSoftBodyPredictedBounds : bool;
        drawSoftBodyConstraintColor : ESoftBodyConstraintColor;
    }
}

BodyCreationSettings :: struct {
    position : RVec3;
    rotation : Quat;
    linearVelocity : Vec3;
    angularVelocity : Vec3;
    userData : u64;
    objectLayer : ObjectLayer;
    collisionGroup : CollisionGroup;
    motionType : EMotionType;
    allowedDOFs : EAllowedDOFs;
    allowDynamicOrKinematic : bool;
    isSensor : bool;
    collideKinematicVsNonDynamic : bool;
    useManifoldReduction : bool;
    applyGyroscopicForce : bool;
    motionQuality : EMotionQuality;
    enhancedInternalEdgeRemoval : bool;
    allowSleeping : bool;
    friction : float;
    restitution : float;
    linearDamping : float;
    angularDamping : float;
    maxLinearVelocity : float;
    maxAngularVelocity : float;
    gravityFactor : float;
    numVelocityStepsOverride : u32;
    numPositionStepsOverride : u32;
    overrideMassProperties : EOverrideMassProperties;
    inertiaMultiplier : float;
    massPropertiesOverride : MassProperties;
    shape : *ShapeSettings;
    shapePtr : *Shape;

    Default :: () -> BodyCreationSettings #foreign JoltC "JPH_BodyCreationSettings_Default";

    ConvertShapeSettings :: (settings : *BodyCreationSettings) -> *Shape #foreign JoltC "JPH_BodyCreationSettings_ConvertShapeSettings";
    HasMassProperties :: (settings : *BodyCreationSettings) -> bool #foreign JoltC "JPH_BodyCreationSettings_HasMassProperties";
    GetMassProperties :: (settings : *BodyCreationSettings) -> MassProperties #foreign JoltC "JPH_BodyCreationSettings_GetMassProperties";
}

SoftBodySharedSettings :: struct {}

SoftBodyCreationSettings :: struct {
    settings : *SoftBodySharedSettings;
    position : RVec3;
    rotation : Quat;
    userData : u64;
    objectLayer : ObjectLayer;
    collisionGroup : CollisionGroup;
    numIterations : u32;
    linearDamping : float;
    maxLinearVelocity : float;
    restitution : float;
    friction : float;
    pressure : float;
    gravityFactor : float;
    vertexRadius : float;
    updatePosition : bool;
    makeRotationIdentity : bool;
    allowSleeping : bool;
    facesDoubleSided : bool;

    Default :: () -> SoftBodyCreationSettings #foreign JoltC "JPH_SoftBodyCreationSettings_Default";
}

BodyLockRead :: struct {
    bodyLockMutex : *SharedMutex;
    body : *Body;
}

BodyLockWrite :: struct {
    bodyLockMutex : *SharedMutex;
    body : *Body;
}

BodyLockMultiRead :: struct {
    mutexMask : BodyManager.MutexMask;
    bodyIDs : *BodyID;
    numBodies : s32;

    GetBody :: (lock : *BodyLockMultiRead, bodyLockInterface : *BodyLockInterface, bodyIndex : s32) -> *Body #foreign JoltC "JPH_BodyLockMultiRead_GetBody";
}

BodyLockMultiWrite :: struct {
    mutexMask : BodyManager.MutexMask;
    bodyIDs : *BodyID;
    numBodies : s32;

    GetBody :: (lock : *BodyLockMultiWrite, bodyLockInterface : *BodyLockInterface, bodyIndex : s32) -> *Body #foreign JoltC "JPH_BodyLockMultiWrite_GetBody";
}

DebugRenderer :: struct {
    ECastShadow :: enum u32 {
        On :: 0;
        Off :: 1;
    }

    EDrawMode :: enum u32 {
        Solid :: 0;
        Wireframe :: 1;
    }

    ECullMode :: enum u32 {
        CullBackFace :: 0;
        CullFrontFace :: 1;
        Off :: 2;
    }

    opaque : s8;

    Destroy :: (self : *DebugRenderer) -> void #foreign JoltC "JPH_DebugRenderer_Destroy";
    NextFrame :: (self : *DebugRenderer) -> void #foreign JoltC "JPH_DebugRenderer_NextFrame";
}

DebugRendererSimple :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        DrawLine : #type (*void, RVec3, RVec3, Color) -> void #c_call;
        DrawTriangle : #type (*void, RVec3, RVec3, RVec3, Color, DebugRenderer.ECastShadow) -> void #c_call;
        DrawText3D : #type (*void, RVec3, *s8, u64, Color, float) -> void #c_call;
    }

    #as using,except(base) base : DebugRenderer;

    Create :: (data : *void, funcs : DebugRendererSimple.Funcs, allocator : JoltCAllocator) -> *DebugRenderer #foreign JoltC "JPH_DebugRendererSimple_Create";
}

BodyDrawFilter :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        ShouldDraw : #type (*void, *Body) -> bool #c_call;
    }

    Create :: (data : *void, funcs : BodyDrawFilter.Funcs, allocator : JoltCAllocator) -> *BodyDrawFilter #foreign JoltC "JPH_BodyDrawFilter_Create";

    Destroy :: (self : *BodyDrawFilter) -> void #foreign JoltC "JPH_BodyDrawFilter_Destroy";
}

PhysicsSystem :: struct {
    Create :: (settings : PhysicsSystemSettings) -> *PhysicsSystem #foreign JoltC "JPH_PhysicsSystem_Create";

    Destroy :: (system : *PhysicsSystem) -> void #foreign JoltC "JPH_PhysicsSystem_Destroy";
    SetPhysicsSettings :: (system : *PhysicsSystem, settings : PhysicsSettings) -> void #foreign JoltC "JPH_PhysicsSystem_SetPhysicsSettings";
    GetPhysicsSettings :: (system : *PhysicsSystem) -> PhysicsSettings #foreign JoltC "JPH_PhysicsSystem_GetPhysicsSettings";
    SetGravity :: (system : *PhysicsSystem, gravity : Vec3) -> void #foreign JoltC "JPH_PhysicsSystem_SetGravity";
    GetGravity :: (system : *PhysicsSystem) -> Vec3 #foreign JoltC "JPH_PhysicsSystem_GetGravity";
    GetNumBodies :: (system : *PhysicsSystem) -> u32 #foreign JoltC "JPH_PhysicsSystem_GetNumBodies";
    GetNumActiveBodies :: (system : *PhysicsSystem, type : EBodyType) -> u32 #foreign JoltC "JPH_PhysicsSystem_GetNumActiveBodies";
    GetMaxBodies :: (system : *PhysicsSystem) -> u32 #foreign JoltC "JPH_PhysicsSystem_GetMaxBodies";
    GetBodyStats :: (system : *PhysicsSystem) -> BodyManager.BodyStats #foreign JoltC "JPH_PhysicsSystem_GetBodyStats";
    GetBodies :: (system : *PhysicsSystem, outIDs : **BodyID, allocator : JoltCAllocator) -> u32 #foreign JoltC "JPH_PhysicsSystem_GetBodies";
    GetActiveBodies :: (system : *PhysicsSystem, type : EBodyType, outIDs : **BodyID, allocator : JoltCAllocator) -> u32 #foreign JoltC "JPH_PhysicsSystem_GetActiveBodies";
    GetActiveBodiesUnsafe :: (system : *PhysicsSystem, type : EBodyType) -> *BodyID #foreign JoltC "JPH_PhysicsSystem_GetActiveBodiesUnsafe";
    WereBodiesInContact :: (system : *PhysicsSystem, body1ID : BodyID, body2ID : BodyID) -> bool #foreign JoltC "JPH_PhysicsSystem_WereBodiesInContact";
    GetBounds :: (system : *PhysicsSystem) -> AABox #foreign JoltC "JPH_PhysicsSystem_GetBounds";
    GetBodyInterface :: (system : *PhysicsSystem) -> *BodyInterface #foreign JoltC "JPH_PhysicsSystem_GetBodyInterface";
    GetBodyInterfaceConst :: (system : *PhysicsSystem) -> *BodyInterface #foreign JoltC "JPH_PhysicsSystem_GetBodyInterfaceConst";
    GetBodyInterfaceNoLock :: (system : *PhysicsSystem) -> *BodyInterface #foreign JoltC "JPH_PhysicsSystem_GetBodyInterfaceNoLock";
    GetBodyInterfaceNoLockConst :: (system : *PhysicsSystem) -> *BodyInterface #foreign JoltC "JPH_PhysicsSystem_GetBodyInterfaceNoLockConst";
    GetBroadPhaseQuery :: (system : *PhysicsSystem) -> *BroadPhaseQuery #foreign JoltC "JPH_PhysicsSystem_GetBroadPhaseQuery";
    GetNarrowPhaseQuery :: (system : *PhysicsSystem) -> *NarrowPhaseQuery #foreign JoltC "JPH_PhysicsSystem_GetNarrowPhaseQuery";
    GetNarrowPhaseQueryNoLock :: (system : *PhysicsSystem) -> *NarrowPhaseQuery #foreign JoltC "JPH_PhysicsSystem_GetNarrowPhaseQueryNoLock";
    GetBodyLockInterface :: (system : *PhysicsSystem) -> *BodyLockInterface #foreign JoltC "JPH_PhysicsSystem_GetBodyLockInterface";
    GetBodyLockInterfaceNoLock :: (system : *PhysicsSystem) -> *BodyLockInterface #foreign JoltC "JPH_PhysicsSystem_GetBodyLockInterfaceNoLock";
    GetBroadPhaseLayerInterface :: (system : *PhysicsSystem) -> *BroadPhaseLayerInterface #foreign JoltC "JPH_PhysicsSystem_GetBroadPhaseLayerInterface";
    GetObjectVsBroadPhaseLayerFilter :: (system : *PhysicsSystem) -> *ObjectVsBroadPhaseLayerFilter #foreign JoltC "JPH_PhysicsSystem_GetObjectVsBroadPhaseLayerFilter";
    GetObjectLayerPairFilter :: (system : *PhysicsSystem) -> *ObjectLayerPairFilter #foreign JoltC "JPH_PhysicsSystem_GetObjectLayerPairFilter";
    GetDefaultBroadPhaseLayerFilter :: (system : *PhysicsSystem, layer : ObjectLayer) -> DefaultBroadPhaseLayerFilter #foreign JoltC "JPH_PhysicsSystem_GetDefaultBroadPhaseLayerFilter";
    GetDefaultLayerFilter :: (system : *PhysicsSystem, layer : ObjectLayer) -> DefaultObjectLayerFilter #foreign JoltC "JPH_PhysicsSystem_GetDefaultLayerFilter";
    SetSimShapeFilter :: (system : *PhysicsSystem, shapeFilter : *SimShapeFilter) -> void #foreign JoltC "JPH_PhysicsSystem_SetSimShapeFilter";
    GetSimShapeFilter :: (system : *PhysicsSystem) -> *SimShapeFilter #foreign JoltC "JPH_PhysicsSystem_GetSimShapeFilter";
    AddConstraint :: (system : *PhysicsSystem, constraint : *Constraint) -> void #foreign JoltC "JPH_PhysicsSystem_AddConstraint";
    RemoveConstraint :: (system : *PhysicsSystem, constraint : *Constraint) -> void #foreign JoltC "JPH_PhysicsSystem_RemoveConstraint";
    AddConstraints :: (system : *PhysicsSystem, constraints : **Constraint, numConstraints : s32) -> void #foreign JoltC "JPH_PhysicsSystem_AddConstraints";
    RemoveConstraints :: (system : *PhysicsSystem, constraints : **Constraint, numConstraints : s32) -> void #foreign JoltC "JPH_PhysicsSystem_RemoveConstraints";
    AddStepListener :: (system : *PhysicsSystem, listener : *PhysicsStepListener) -> void #foreign JoltC "JPH_PhysicsSystem_AddStepListener";
    RemoveStepListener :: (system : *PhysicsSystem, listener : *PhysicsStepListener) -> void #foreign JoltC "JPH_PhysicsSystem_RemoveStepListener";
    OptimizeBroadPhase :: (system : *PhysicsSystem) -> void #foreign JoltC "JPH_PhysicsSystem_OptimizeBroadPhase";
    Update :: (system : *PhysicsSystem, deltaTime : float, collisionSteps : s32, tempAllocator : *TempAllocator, jobSystem : *JobSystem) -> EPhysicsUpdateError #foreign JoltC "JPH_PhysicsSystem_Update";
    DrawBodies :: (system : *PhysicsSystem, settings : *BodyManager.DrawSettings, renderer : *DebugRenderer, bodyFilter : *BodyDrawFilter) -> void #foreign JoltC "JPH_PhysicsSystem_DrawBodies";
    DrawConstraints :: (system : *PhysicsSystem, renderer : *DebugRenderer) -> void #foreign JoltC "JPH_PhysicsSystem_DrawConstraints";
    DrawConstraintLimits :: (system : *PhysicsSystem, renderer : *DebugRenderer) -> void #foreign JoltC "JPH_PhysicsSystem_DrawConstraintLimits";
    DrawConstraintReferenceFrame :: (system : *PhysicsSystem, renderer : *DebugRenderer) -> void #foreign JoltC "JPH_PhysicsSystem_DrawConstraintReferenceFrame";
}

PhysicsSystemSettings :: struct {
    maxBodies : u32;
    numBodyMutexes : u32;
    maxBodyPairs : u32;
    maxContactConstraints : u32;
    broadPhaseLayerInterface : *BroadPhaseLayerInterface;
    objectVsBroadPhaseLayerFilter : *ObjectVsBroadPhaseLayerFilter;
    objectLayerPairFilter : *ObjectLayerPairFilter;
}

PhysicsStepListenerContext :: struct {
    deltaTime : float;
    isFirstStep : bool;
    isLastStep : bool;
    physicsSystem : *PhysicsSystem;
}

PhysicsStepListener :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        OnStep : #type (*void, *PhysicsStepListenerContext) -> void #c_call;
    }

    Create :: (data : *void, funcs : PhysicsStepListener.Funcs, allocator : JoltCAllocator) -> *PhysicsStepListener #foreign JoltC "JPH_PhysicsStepListener_Create";

    Destroy :: (listener : *PhysicsStepListener) -> void #foreign JoltC "JPH_PhysicsStepListener_Destroy";
}

SpringSettings :: struct {
    mode : ESpringMode;
    union {
        frequency : float;
        stiffness : float;
    }
    damping : float;

    Default :: () -> SpringSettings #foreign JoltC "JPH_SpringSettings_Default";
    Make :: (mode : ESpringMode, frequencyOrStiffness : float, damping : float) -> SpringSettings #foreign JoltC "JPH_SpringSettings_Make";
}

MotorSettings :: struct {
    springSettings : SpringSettings;
    minForceLimit : float;
    maxForceLimit : float;
    minTorqueLimit : float;
    maxTorqueLimit : float;

    Default :: () -> MotorSettings #foreign JoltC "JPH_MotorSettings_Default";
}

ConstraintSettings :: struct {
    enabled : bool;
    constraintPriority : u32;
    numVelocityStepsOverride : u32;
    numPositionStepsOverride : u32;
    drawConstraintSize : float;
    userData : u64;
}

TwoBodyConstraintSettings :: struct {
    #as using,except(base) base : ConstraintSettings;
}

ConeConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    point1 : RVec3;
    twistAxis1 : Vec3;
    point2 : RVec3;
    twistAxis2 : Vec3;
    halfConeAngle : float;

    Default :: () -> ConeConstraintSettings #foreign JoltC "JPH_ConeConstraintSettings_Default";

    CreateConstraint :: (settings : *ConeConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_ConeConstraintSettings_CreateConstraint";
}

DistanceConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    point1 : RVec3;
    point2 : RVec3;
    minDistance : float;
    maxDistance : float;
    limitsSpringSettings : SpringSettings;

    Default :: () -> DistanceConstraintSettings #foreign JoltC "JPH_DistanceConstraintSettings_Default";

    CreateConstraint :: (settings : *DistanceConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_DistanceConstraintSettings_CreateConstraint";
}

FixedConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    autoDetectPoint : bool;
    point1 : RVec3;
    axisX1 : Vec3;
    axisY1 : Vec3;
    point2 : RVec3;
    axisX2 : Vec3;
    axisY2 : Vec3;

    Default :: () -> FixedConstraintSettings #foreign JoltC "JPH_FixedConstraintSettings_Default";

    CreateConstraint :: (settings : *FixedConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_FixedConstraintSettings_CreateConstraint";
}

GearConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    hingeAxis1 : Vec3;
    hingeAxis2 : Vec3;
    ratio : float;

    Default :: () -> GearConstraintSettings #foreign JoltC "JPH_GearConstraintSettings_Default";

    CreateConstraint :: (settings : *GearConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_GearConstraintSettings_CreateConstraint";
}

HingeConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    point1 : RVec3;
    hingeAxis1 : Vec3;
    normalAxis1 : Vec3;
    point2 : RVec3;
    hingeAxis2 : Vec3;
    normalAxis2 : Vec3;
    limitsMin : float;
    limitsMax : float;
    limitsSpringSettings : SpringSettings;
    maxFrictionTorque : float;
    motorSettings : MotorSettings;

    Default :: () -> HingeConstraintSettings #foreign JoltC "JPH_HingeConstraintSettings_Default";

    CreateConstraint :: (settings : *HingeConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_HingeConstraintSettings_CreateConstraint";
}

PathConstraintPath :: struct {
    opaque : s8;

    Destroy :: (path : *PathConstraintPath) -> void #foreign JoltC "JPH_PathConstraintPath_Destroy";
    GetPathMaxFraction :: (path : *PathConstraintPath) -> float #foreign JoltC "JPH_PathConstraintPath_GetPathMaxFraction";
    GetClosestPoint :: (path : *PathConstraintPath, position : Vec3, fractionHint : float) -> float #foreign JoltC "JPH_PathConstraintPath_GetClosestPoint";
    GetPointOnPath :: (path : *PathConstraintPath, fraction : float, outPathPosition : *Vec3, outPathTangent : *Vec3, outPathNormal : *Vec3, outPathBinormal : *Vec3) -> void #foreign JoltC "JPH_PathConstraintPath_GetPointOnPath";
    SetIsLooping :: (path : *PathConstraintPath, isLooping : bool) -> void #foreign JoltC "JPH_PathConstraintPath_SetIsLooping";
    IsLooping :: (path : *PathConstraintPath) -> bool #foreign JoltC "JPH_PathConstraintPath_IsLooping";
    DrawPath :: (path : *PathConstraintPath, renderer : *DebugRenderer, baseTransform : RMat44) -> void #foreign JoltC "JPH_PathConstraintPath_DrawPath";
}

PathConstraintPathHermite :: struct {
    #as using,except(base) base : PathConstraintPath;

    Create :: () -> *PathConstraintPathHermite #foreign JoltC "JPH_PathConstraintPathHermite_Create";

    AddPoint :: (path : *PathConstraintPathHermite, position : Vec3, tangent : Vec3, normal : Vec3) -> void #foreign JoltC "JPH_PathConstraintPathHermite_AddPoint";
}

PathConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    path : *PathConstraintPath;
    pathPosition : Vec3;
    pathRotation : Quat;
    pathFraction : float;
    maxFrictionForce : float;
    positionMotorSettings : MotorSettings;
    rotationConstraintType : EPathRotationConstraintType;

    Default :: () -> PathConstraintSettings #foreign JoltC "JPH_PathConstraintSettings_Default";

    CreateConstraint :: (settings : *PathConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_PathConstraintSettings_CreateConstraint";
}

PointConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    point1 : RVec3;
    point2 : RVec3;

    Default :: () -> PointConstraintSettings #foreign JoltC "JPH_PointConstraintSettings_Default";

    CreateConstraint :: (settings : *PointConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_PointConstraintSettings_CreateConstraint";
}

PulleyConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    bodyPoint1 : RVec3;
    fixedPoint1 : RVec3;
    bodyPoint2 : RVec3;
    fixedPoint2 : RVec3;
    ratio : float;
    minLength : float;
    maxLength : float;

    Default :: () -> PulleyConstraintSettings #foreign JoltC "JPH_PulleyConstraintSettings_Default";

    CreateConstraint :: (settings : *PulleyConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_PulleyConstraintSettings_CreateConstraint";
}

RackAndPinionConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    hingeAxis : Vec3;
    sliderAxis : Vec3;
    ratio : float;

    Default :: () -> RackAndPinionConstraintSettings #foreign JoltC "JPH_RackAndPinionConstraintSettings_Default";

    CreateConstraint :: (settings : *RackAndPinionConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_RackAndPinionConstraintSettings_CreateConstraint";
}

SixDOFConstraintSettings :: struct {
    EAxis :: enum u32 {
        TranslationX :: 0;
        TranslationY :: 1;
        TranslationZ :: 2;
        RotationX :: 3;
        RotationY :: 4;
        RotationZ :: 5;
        Num :: 6;
        NumTranslation :: 3;
    }

    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    position1 : RVec3;
    axisX1 : Vec3;
    axisY1 : Vec3;
    position2 : RVec3;
    axisX2 : Vec3;
    axisY2 : Vec3;
    maxFriction : [6]float;
    swingType : ESwingType;
    limitMin : [6]float;
    limitMax : [6]float;
    limitsSpringSettings : [3]SpringSettings;
    motorSettings : [6]MotorSettings;

    Default :: () -> SixDOFConstraintSettings #foreign JoltC "JPH_SixDOFConstraintSettings_Default";

    CreateConstraint :: (settings : *SixDOFConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_SixDOFConstraintSettings_CreateConstraint";
    MakeFreeAxis :: (settings : *SixDOFConstraintSettings, axis : SixDOFConstraintSettings.EAxis) -> void #foreign JoltC "JPH_SixDOFConstraintSettings_MakeFreeAxis";
    IsFreeAxis :: (settings : *SixDOFConstraintSettings, axis : SixDOFConstraintSettings.EAxis) -> bool #foreign JoltC "JPH_SixDOFConstraintSettings_IsFreeAxis";
    MakeFixedAxis :: (settings : *SixDOFConstraintSettings, axis : SixDOFConstraintSettings.EAxis) -> void #foreign JoltC "JPH_SixDOFConstraintSettings_MakeFixedAxis";
    IsFixedAxis :: (settings : *SixDOFConstraintSettings, axis : SixDOFConstraintSettings.EAxis) -> bool #foreign JoltC "JPH_SixDOFConstraintSettings_IsFixedAxis";
    SetLimitedAxis :: (settings : *SixDOFConstraintSettings, axis : SixDOFConstraintSettings.EAxis, min : float, max : float) -> void #foreign JoltC "JPH_SixDOFConstraintSettings_SetLimitedAxis";
}

SliderConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    autoDetectPoint : bool;
    point1 : RVec3;
    sliderAxis1 : Vec3;
    normalAxis1 : Vec3;
    point2 : RVec3;
    sliderAxis2 : Vec3;
    normalAxis2 : Vec3;
    limitsMin : float;
    limitsMax : float;
    limitsSpringSettings : SpringSettings;
    maxFrictionForce : float;
    motorSettings : MotorSettings;

    Default :: () -> SliderConstraintSettings #foreign JoltC "JPH_SliderConstraintSettings_Default";

    CreateConstraint :: (settings : *SliderConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_SliderConstraintSettings_CreateConstraint";
}

SwingTwistConstraintSettings :: struct {
    #as using,except(base) base : TwoBodyConstraintSettings;
    space : EConstraintSpace;
    position1 : RVec3;
    twistAxis1 : Vec3;
    planeAxis1 : Vec3;
    position2 : RVec3;
    twistAxis2 : Vec3;
    planeAxis2 : Vec3;
    swingType : ESwingType;
    normalHalfConeAngle : float;
    planeHalfConeAngle : float;
    twistMinAngle : float;
    twistMaxAngle : float;
    maxFrictionTorque : float;
    swingMotorSettings : MotorSettings;
    twistMotorSettings : MotorSettings;

    Default :: () -> SwingTwistConstraintSettings #foreign JoltC "JPH_SwingTwistConstraintSettings_Default";

    CreateConstraint :: (settings : *SwingTwistConstraintSettings, body1 : *Body, body2 : *Body) -> *TwoBodyConstraint #foreign JoltC "JPH_SwingTwistConstraintSettings_CreateConstraint";
}

Constraint :: struct {
    opaque : s8;

    Destroy :: (constraint : *Constraint) -> void #foreign JoltC "JPH_Constraint_Destroy";
    GetType :: (constraint : *Constraint) -> EConstraintType #foreign JoltC "JPH_Constraint_GetType";
    GetSubType :: (constraint : *Constraint) -> EConstraintSubType #foreign JoltC "JPH_Constraint_GetSubType";
    GetConstraintPriority :: (constraint : *Constraint) -> u32 #foreign JoltC "JPH_Constraint_GetConstraintPriority";
    SetConstraintPriority :: (constraint : *Constraint, priority : u32) -> void #foreign JoltC "JPH_Constraint_SetConstraintPriority";
    GetNumVelocityStepsOverride :: (constraint : *Constraint) -> u32 #foreign JoltC "JPH_Constraint_GetNumVelocityStepsOverride";
    SetNumVelocityStepsOverride :: (constraint : *Constraint, steps : u32) -> void #foreign JoltC "JPH_Constraint_SetNumVelocityStepsOverride";
    GetNumPositionStepsOverride :: (constraint : *Constraint) -> u32 #foreign JoltC "JPH_Constraint_GetNumPositionStepsOverride";
    SetNumPositionStepsOverride :: (constraint : *Constraint, steps : u32) -> void #foreign JoltC "JPH_Constraint_SetNumPositionStepsOverride";
    SetEnabled :: (constraint : *Constraint, enabled : bool) -> void #foreign JoltC "JPH_Constraint_SetEnabled";
    GetEnabled :: (constraint : *Constraint) -> bool #foreign JoltC "JPH_Constraint_GetEnabled";
    GetDrawConstraintSize :: (constraint : *Constraint) -> float #foreign JoltC "JPH_Constraint_GetDrawConstraintSize";
    SetDrawConstraintSize :: (constraint : *Constraint, inSize : float) -> void #foreign JoltC "JPH_Constraint_SetDrawConstraintSize";
}

TwoBodyConstraint :: struct {
    #as using,except(base) base : Constraint;

    GetBody1 :: (constraint : *TwoBodyConstraint) -> *Body #foreign JoltC "JPH_TwoBodyConstraint_GetBody1";
    GetBody2 :: (constraint : *TwoBodyConstraint) -> *Body #foreign JoltC "JPH_TwoBodyConstraint_GetBody2";
}

ConeConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    SetHalfConeAngle :: (constraint : *ConeConstraint, halfConeAngle : float) -> void #foreign JoltC "JPH_ConeConstraint_SetHalfConeAngle";
    GetCosHalfConeAngle :: (constraint : *ConeConstraint) -> float #foreign JoltC "JPH_ConeConstraint_GetCosHalfConeAngle";
}

DistanceConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    SetDistance :: (constraint : *DistanceConstraint, minDistance : float, maxDistance : float) -> void #foreign JoltC "JPH_DistanceConstraint_SetDistance";
    GetMinDistance :: (constraint : *DistanceConstraint) -> float #foreign JoltC "JPH_DistanceConstraint_GetMinDistance";
    GetMaxDistance :: (constraint : *DistanceConstraint) -> float #foreign JoltC "JPH_DistanceConstraint_GetMaxDistance";
    GetLimitsSpringSettingsConst :: (constraint : *DistanceConstraint) -> *SpringSettings #foreign JoltC "JPH_DistanceConstraint_GetLimitsSpringSettingsConst";
    GetLimitsSpringSettings :: (constraint : *DistanceConstraint) -> *SpringSettings #foreign JoltC "JPH_DistanceConstraint_GetLimitsSpringSettings";
    SetLimitsSpringSettings :: (constraint : *DistanceConstraint, limitsSpringSettings : SpringSettings) -> void #foreign JoltC "JPH_DistanceConstraint_SetLimitsSpringSettings";
}

FixedConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;
}

GearConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    SetConstraints :: (constraint : *GearConstraint, gear1 : *Constraint, gear2 : *Constraint) -> void #foreign JoltC "JPH_GearConstraint_SetConstraints";
}

HingeConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    GetLocalSpacePoint1 :: (constraint : *HingeConstraint) -> Vec3 #foreign JoltC "JPH_HingeConstraint_GetLocalSpacePoint1";
    GetLocalSpacePoint2 :: (constraint : *HingeConstraint) -> Vec3 #foreign JoltC "JPH_HingeConstraint_GetLocalSpacePoint2";
    GetLocalSpaceHingeAxis1 :: (constraint : *HingeConstraint) -> Vec3 #foreign JoltC "JPH_HingeConstraint_GetLocalSpaceHingeAxis1";
    GetLocalSpaceHingeAxis2 :: (constraint : *HingeConstraint) -> Vec3 #foreign JoltC "JPH_HingeConstraint_GetLocalSpaceHingeAxis2";
    GetLocalSpaceNormalAxis1 :: (constraint : *HingeConstraint) -> Vec3 #foreign JoltC "JPH_HingeConstraint_GetLocalSpaceNormalAxis1";
    GetLocalSpaceNormalAxis2 :: (constraint : *HingeConstraint) -> Vec3 #foreign JoltC "JPH_HingeConstraint_GetLocalSpaceNormalAxis2";
    GetCurrentAngle :: (constraint : *HingeConstraint) -> float #foreign JoltC "JPH_HingeConstraint_GetCurrentAngle";
    SetMaxFrictionTorque :: (constraint : *HingeConstraint, frictionTorque : float) -> void #foreign JoltC "JPH_HingeConstraint_SetMaxFrictionTorque";
    GetMaxFrictionTorque :: (constraint : *HingeConstraint) -> float #foreign JoltC "JPH_HingeConstraint_GetMaxFrictionTorque";
    GetMotorSettingsConst :: (constraint : *HingeConstraint) -> *MotorSettings #foreign JoltC "JPH_HingeConstraint_GetMotorSettingsConst";
    GetMotorSettings :: (constraint : *HingeConstraint) -> *MotorSettings #foreign JoltC "JPH_HingeConstraint_GetMotorSettings";
    SetMotorState :: (constraint : *HingeConstraint, state : EMotorState) -> void #foreign JoltC "JPH_HingeConstraint_SetMotorState";
    GetMotorState :: (constraint : *HingeConstraint) -> EMotorState #foreign JoltC "JPH_HingeConstraint_GetMotorState";
    SetTargetAngularVelocity :: (constraint : *HingeConstraint, angularVelocity : float) -> void #foreign JoltC "JPH_HingeConstraint_SetTargetAngularVelocity";
    GetTargetAngularVelocity :: (constraint : *HingeConstraint) -> float #foreign JoltC "JPH_HingeConstraint_GetTargetAngularVelocity";
    SetTargetAngle :: (constraint : *HingeConstraint, angle : float) -> void #foreign JoltC "JPH_HingeConstraint_SetTargetAngle";
    GetTargetAngle :: (constraint : *HingeConstraint) -> float #foreign JoltC "JPH_HingeConstraint_GetTargetAngle";
    SetTargetOrientationBS :: (constraint : *HingeConstraint, orientation : Quat) -> void #foreign JoltC "JPH_HingeConstraint_SetTargetOrientationBS";
    SetLimits :: (constraint : *HingeConstraint, limitsMin : float, limitsMax : float) -> void #foreign JoltC "JPH_HingeConstraint_SetLimits";
    GetLimitsMin :: (constraint : *HingeConstraint) -> float #foreign JoltC "JPH_HingeConstraint_GetLimitsMin";
    GetLimitsMax :: (constraint : *HingeConstraint) -> float #foreign JoltC "JPH_HingeConstraint_GetLimitsMax";
    HasLimits :: (constraint : *HingeConstraint) -> bool #foreign JoltC "JPH_HingeConstraint_HasLimits";
    GetLimitsSpringSettingsConst :: (constraint : *HingeConstraint) -> *SpringSettings #foreign JoltC "JPH_HingeConstraint_GetLimitsSpringSettingsConst";
    GetLimitsSpringSettings :: (constraint : *HingeConstraint) -> *SpringSettings #foreign JoltC "JPH_HingeConstraint_GetLimitsSpringSettings";
    SetLimitsSpringSettings :: (constraint : *HingeConstraint, limitsSpringSettings : SpringSettings) -> void #foreign JoltC "JPH_HingeConstraint_SetLimitsSpringSettings";
}

PathConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    SetPath :: (constraint : *PathConstraint, path : *PathConstraintPath, pathFraction : float) -> void #foreign JoltC "JPH_PathConstraint_SetPath";
    GetPath :: (constraint : *PathConstraint) -> *PathConstraintPath #foreign JoltC "JPH_PathConstraint_GetPath";
    GetPathFraction :: (constraint : *PathConstraint) -> float #foreign JoltC "JPH_PathConstraint_GetPathFraction";
    SetMaxFrictionForce :: (constraint : *PathConstraint, frictionForce : float) -> void #foreign JoltC "JPH_PathConstraint_SetMaxFrictionForce";
    GetMaxFrictionForce :: (constraint : *PathConstraint) -> float #foreign JoltC "JPH_PathConstraint_GetMaxFrictionForce";
    GetPositionMotorSettingsConst :: (constraint : *PathConstraint) -> *MotorSettings #foreign JoltC "JPH_PathConstraint_GetPositionMotorSettingsConst";
    GetPositionMotorSettings :: (constraint : *PathConstraint) -> *MotorSettings #foreign JoltC "JPH_PathConstraint_GetPositionMotorSettings";
    SetPositionMotorState :: (constraint : *PathConstraint, state : EMotorState) -> void #foreign JoltC "JPH_PathConstraint_SetPositionMotorState";
    GetPositionMotorState :: (constraint : *PathConstraint) -> EMotorState #foreign JoltC "JPH_PathConstraint_GetPositionMotorState";
    SetTargetVelocity :: (constraint : *PathConstraint, velocity : float) -> void #foreign JoltC "JPH_PathConstraint_SetTargetVelocity";
    GetTargetVelocity :: (constraint : *PathConstraint) -> float #foreign JoltC "JPH_PathConstraint_GetTargetVelocity";
    SetTargetPathFraction :: (constraint : *PathConstraint, fraction : float) -> void #foreign JoltC "JPH_PathConstraint_SetTargetPathFraction";
    GetTargetPathFraction :: (constraint : *PathConstraint) -> float #foreign JoltC "JPH_PathConstraint_GetTargetPathFraction";
}

PointConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    SetPoint1 :: (constraint : *PointConstraint, space : EConstraintSpace, point1 : RVec3) -> void #foreign JoltC "JPH_PointConstraint_SetPoint1";
    SetPoint2 :: (constraint : *PointConstraint, space : EConstraintSpace, point2 : RVec3) -> void #foreign JoltC "JPH_PointConstraint_SetPoint2";
    GetLocalSpacePoint1 :: (constraint : *PointConstraint) -> Vec3 #foreign JoltC "JPH_PointConstraint_GetLocalSpacePoint1";
    GetLocalSpacePoint2 :: (constraint : *PointConstraint) -> Vec3 #foreign JoltC "JPH_PointConstraint_GetLocalSpacePoint2";
}

PulleyConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    SetLength :: (constraint : *PulleyConstraint, minLength : float, maxLength : float) -> void #foreign JoltC "JPH_PulleyConstraint_SetLength";
    GetMinLength :: (constraint : *PulleyConstraint) -> float #foreign JoltC "JPH_PulleyConstraint_GetMinLength";
    GetMaxLength :: (constraint : *PulleyConstraint) -> float #foreign JoltC "JPH_PulleyConstraint_GetMaxLength";
    GetCurrentLength :: (constraint : *PulleyConstraint) -> float #foreign JoltC "JPH_PulleyConstraint_GetCurrentLength";
}

RackAndPinionConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    SetConstraints :: (constraints : *RackAndPinionConstraint, pinion : *Constraint, rack : *Constraint) -> void #foreign JoltC "JPH_RackAndPinionConstraint_SetConstraints";
}

SixDOFConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    SetTranslationLimits :: (constraint : *SixDOFConstraint, limitMin : Vec3, limitMax : Vec3) -> void #foreign JoltC "JPH_SixDOFConstraint_SetTranslationLimits";
    SetRotationLimits :: (constraint : *SixDOFConstraint, limitMin : Vec3, limitMax : Vec3) -> void #foreign JoltC "JPH_SixDOFConstraint_SetRotationLimits";
    GetLimitsMin :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis) -> float #foreign JoltC "JPH_SixDOFConstraint_GetLimitsMin";
    GetLimitsMax :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis) -> float #foreign JoltC "JPH_SixDOFConstraint_GetLimitsMax";
    GetTranslationLimitsMin :: (constraint : *SixDOFConstraint) -> Vec3 #foreign JoltC "JPH_SixDOFConstraint_GetTranslationLimitsMin";
    GetTranslationLimitsMax :: (constraint : *SixDOFConstraint) -> Vec3 #foreign JoltC "JPH_SixDOFConstraint_GetTranslationLimitsMax";
    GetRotationLimitsMin :: (constraint : *SixDOFConstraint) -> Vec3 #foreign JoltC "JPH_SixDOFConstraint_GetRotationLimitsMin";
    GetRotationLimitsMax :: (constraint : *SixDOFConstraint) -> Vec3 #foreign JoltC "JPH_SixDOFConstraint_GetRotationLimitsMax";
    IsFixedAxis :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis) -> bool #foreign JoltC "JPH_SixDOFConstraint_IsFixedAxis";
    IsFreeAxis :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis) -> bool #foreign JoltC "JPH_SixDOFConstraint_IsFreeAxis";
    GetLimitsSpringSettings :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis) -> *SpringSettings #foreign JoltC "JPH_SixDOFConstraint_GetLimitsSpringSettings";
    SetLimitsSpringSettings :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis, limitsSpringSettings : SpringSettings) -> void #foreign JoltC "JPH_SixDOFConstraint_SetLimitsSpringSettings";
    SetMaxFriction :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis, friction : float) -> void #foreign JoltC "JPH_SixDOFConstraint_SetMaxFriction";
    GetMaxFriction :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis) -> float #foreign JoltC "JPH_SixDOFConstraint_GetMaxFriction";
    GetRotationInConstraintSpace :: (constraint : *SixDOFConstraint) -> Quat #foreign JoltC "JPH_SixDOFConstraint_GetRotationInConstraintSpace";
    GetMotorSettings :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis) -> *MotorSettings #foreign JoltC "JPH_SixDOFConstraint_GetMotorSettings";
    GetMotorSettingsConst :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis) -> *MotorSettings #foreign JoltC "JPH_SixDOFConstraint_GetMotorSettingsConst";
    SetMotorState :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis, state : EMotorState) -> void #foreign JoltC "JPH_SixDOFConstraint_SetMotorState";
    GetMotorState :: (constraint : *SixDOFConstraint, axis : SixDOFConstraintSettings.EAxis) -> EMotorState #foreign JoltC "JPH_SixDOFConstraint_GetMotorState";
    GetTargetVelocityCS :: (constraint : *SixDOFConstraint) -> Vec3 #foreign JoltC "JPH_SixDOFConstraint_GetTargetVelocityCS";
    SetTargetVelocityCS :: (constraint : *SixDOFConstraint, velocity : Vec3) -> void #foreign JoltC "JPH_SixDOFConstraint_SetTargetVelocityCS";
    SetTargetAngularVelocityCS :: (constraint : *SixDOFConstraint, angularVelocity : Vec3) -> void #foreign JoltC "JPH_SixDOFConstraint_SetTargetAngularVelocityCS";
    GetTargetAngularVelocityCS :: (constraint : *SixDOFConstraint) -> Vec3 #foreign JoltC "JPH_SixDOFConstraint_GetTargetAngularVelocityCS";
    GetTargetPositionCS :: (constraint : *SixDOFConstraint) -> Vec3 #foreign JoltC "JPH_SixDOFConstraint_GetTargetPositionCS";
    SetTargetPositionCS :: (constraint : *SixDOFConstraint, position : Vec3) -> void #foreign JoltC "JPH_SixDOFConstraint_SetTargetPositionCS";
    SetTargetOrientationCS :: (constraint : *SixDOFConstraint, prientation : Quat) -> void #foreign JoltC "JPH_SixDOFConstraint_SetTargetOrientationCS";
    GetTargetOrientationCS :: (constraint : *SixDOFConstraint) -> Quat #foreign JoltC "JPH_SixDOFConstraint_GetTargetOrientationCS";
    SetTargetOrientationBS :: (constraint : *SixDOFConstraint, orientation : Quat) -> void #foreign JoltC "JPH_SixDOFConstraint_SetTargetOrientationBS";
}

SliderConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    GetCurrentPosition :: (constraint : *SliderConstraint) -> float #foreign JoltC "JPH_SliderConstraint_GetCurrentPosition";
    SetMaxFrictionForce :: (constraint : *SliderConstraint, frictionForce : float) -> void #foreign JoltC "JPH_SliderConstraint_SetMaxFrictionForce";
    GetMaxFrictionForce :: (constraint : *SliderConstraint) -> float #foreign JoltC "JPH_SliderConstraint_GetMaxFrictionForce";
    GetMotorSettings :: (constraint : *SliderConstraint) -> *MotorSettings #foreign JoltC "JPH_SliderConstraint_GetMotorSettings";
    GetMotorSettingsConst :: (constraint : *SliderConstraint) -> *MotorSettings #foreign JoltC "JPH_SliderConstraint_GetMotorSettingsConst";
    SetMotorState :: (constraint : *SliderConstraint, state : EMotorState) -> void #foreign JoltC "JPH_SliderConstraint_SetMotorState";
    GetMotorState :: (constraint : *SliderConstraint) -> EMotorState #foreign JoltC "JPH_SliderConstraint_GetMotorState";
    SetTargetVelocity :: (constraint : *SliderConstraint, velocity : float) -> void #foreign JoltC "JPH_SliderConstraint_SetTargetVelocity";
    GetTargetVelocity :: (constraint : *SliderConstraint) -> float #foreign JoltC "JPH_SliderConstraint_GetTargetVelocity";
    SetTargetPosition :: (constraint : *SliderConstraint, position : float) -> void #foreign JoltC "JPH_SliderConstraint_SetTargetPosition";
    GetTargetPosition :: (constraint : *SliderConstraint) -> float #foreign JoltC "JPH_SliderConstraint_GetTargetPosition";
    SetLimits :: (constraint : *SliderConstraint, limitsMin : float, limitsMax : float) -> void #foreign JoltC "JPH_SliderConstraint_SetLimits";
    GetLimitsMin :: (constraint : *SliderConstraint) -> float #foreign JoltC "JPH_SliderConstraint_GetLimitsMin";
    GetLimitsMax :: (constraint : *SliderConstraint) -> float #foreign JoltC "JPH_SliderConstraint_GetLimitsMax";
    HasLimits :: (constraint : *SliderConstraint) -> bool #foreign JoltC "JPH_SliderConstraint_HasLimits";
    GetLimitsSpringSettingsConst :: (constraint : *SliderConstraint) -> *SpringSettings #foreign JoltC "JPH_SliderConstraint_GetLimitsSpringSettingsConst";
    GetLimitsSpringSettings :: (constraint : *SliderConstraint) -> *SpringSettings #foreign JoltC "JPH_SliderConstraint_GetLimitsSpringSettings";
    SetLimitsSpringSettings :: (constraint : *SliderConstraint, limitsSpringSettings : SpringSettings) -> void #foreign JoltC "JPH_SliderConstraint_SetLimitsSpringSettings";
}

SwingTwistConstraint :: struct {
    #as using,except(base) base : TwoBodyConstraint;

    GetLocalSpacePosition1 :: (constraint : *SwingTwistConstraint) -> Vec3 #foreign JoltC "JPH_SwingTwistConstraint_GetLocalSpacePosition1";
    GetLocalSpacePosition2 :: (constraint : *SwingTwistConstraint) -> Vec3 #foreign JoltC "JPH_SwingTwistConstraint_GetLocalSpacePosition2";
    GetConstraintToBody1 :: (constraint : *SwingTwistConstraint) -> Quat #foreign JoltC "JPH_SwingTwistConstraint_GetConstraintToBody1";
    GetConstraintToBody2 :: (constraint : *SwingTwistConstraint) -> Quat #foreign JoltC "JPH_SwingTwistConstraint_GetConstraintToBody2";
    GetNormalHalfConeAngle :: (constraint : *SwingTwistConstraint) -> float #foreign JoltC "JPH_SwingTwistConstraint_GetNormalHalfConeAngle";
    SetNormalHalfConeAngle :: (constraint : *SwingTwistConstraint, angle : float) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetNormalHalfConeAngle";
    GetPlaneHalfConeAngle :: (constraint : *SwingTwistConstraint) -> float #foreign JoltC "JPH_SwingTwistConstraint_GetPlaneHalfConeAngle";
    SetPlaneHalfConeAngle :: (constraint : *SwingTwistConstraint, angle : float) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetPlaneHalfConeAngle";
    GetTwistMinAngle :: (constraint : *SwingTwistConstraint) -> float #foreign JoltC "JPH_SwingTwistConstraint_GetTwistMinAngle";
    SetTwistMinAngle :: (constraint : *SwingTwistConstraint, angle : float) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetTwistMinAngle";
    GetTwistMaxAngle :: (constraint : *SwingTwistConstraint) -> float #foreign JoltC "JPH_SwingTwistConstraint_GetTwistMaxAngle";
    SetTwistMaxAngle :: (constraint : *SwingTwistConstraint, angle : float) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetTwistMaxAngle";
    GetSwingMotorSettingsConst :: (constraint : *SwingTwistConstraint) -> *MotorSettings #foreign JoltC "JPH_SwingTwistConstraint_GetSwingMotorSettingsConst";
    GetSwingMotorSettings :: (constraint : *SwingTwistConstraint) -> *MotorSettings #foreign JoltC "JPH_SwingTwistConstraint_GetSwingMotorSettings";
    GetTwistMotorSettingsConst :: (constraint : *SwingTwistConstraint) -> *MotorSettings #foreign JoltC "JPH_SwingTwistConstraint_GetTwistMotorSettingsConst";
    GetTwistMotorSettings :: (constraint : *SwingTwistConstraint) -> *MotorSettings #foreign JoltC "JPH_SwingTwistConstraint_GetTwistMotorSettings";
    SetMaxFrictionTorque :: (constraint : *SwingTwistConstraint, frictionTorque : float) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetMaxFrictionTorque";
    GetMaxFrictionTorque :: (constraint : *SwingTwistConstraint) -> float #foreign JoltC "JPH_SwingTwistConstraint_GetMaxFrictionTorque";
    SetSwingMotorState :: (constraint : *SwingTwistConstraint, state : EMotorState) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetSwingMotorState";
    GetSwingMotorState :: (constraint : *SwingTwistConstraint) -> EMotorState #foreign JoltC "JPH_SwingTwistConstraint_GetSwingMotorState";
    SetTwistMotorState :: (constraint : *SwingTwistConstraint, state : EMotorState) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetTwistMotorState";
    GetTwistMotorState :: (constraint : *SwingTwistConstraint) -> EMotorState #foreign JoltC "JPH_SwingTwistConstraint_GetTwistMotorState";
    SetTargetAngularVelocityCS :: (constraint : *SwingTwistConstraint, angularVelocity : Vec3) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetTargetAngularVelocityCS";
    GetTargetAngularVelocityCS :: (constraint : *SwingTwistConstraint) -> Vec3 #foreign JoltC "JPH_SwingTwistConstraint_GetTargetAngularVelocityCS";
    SetTargetAngularVelocityBS :: (constraint : *SwingTwistConstraint, angularVelocity : Vec3) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetTargetAngularVelocityBS";
    SetTargetOrientationCS :: (constraint : *SwingTwistConstraint, orientation : Quat) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetTargetOrientationCS";
    GetTargetOrientationCS :: (constraint : *SwingTwistConstraint) -> Quat #foreign JoltC "JPH_SwingTwistConstraint_GetTargetOrientationCS";
    SetTargetOrientationBS :: (constraint : *SwingTwistConstraint, orientation : Quat) -> void #foreign JoltC "JPH_SwingTwistConstraint_SetTargetOrientationBS";
    GetRotationInConstraintSpace :: (constraint : *SwingTwistConstraint) -> Quat #foreign JoltC "JPH_SwingTwistConstraint_GetRotationInConstraintSpace";
}

CharacterBase :: struct {
    opaque : s8;

    Destroy :: (character : *CharacterBase) -> void #foreign JoltC "JPH_CharacterBase_Destroy";
    Release :: (character : *CharacterBase) -> void #foreign JoltC "JPH_CharacterBase_Release";
    SetMaxSlopeAngle :: (character : *CharacterBase, maxSlopeAngle : float) -> void #foreign JoltC "JPH_CharacterBase_SetMaxSlopeAngle";
    GetCosMaxSlopeAngle :: (character : *CharacterBase) -> float #foreign JoltC "JPH_CharacterBase_GetCosMaxSlopeAngle";
    SetUp :: (character : *CharacterBase, up : Vec3) -> void #foreign JoltC "JPH_CharacterBase_SetUp";
    GetUp :: (character : *CharacterBase) -> Vec3 #foreign JoltC "JPH_CharacterBase_GetUp";
    GetSupportingVolume :: (character : *CharacterBase) -> Plane #foreign JoltC "JPH_CharacterBase_GetSupportingVolume";
    SetSupportingVolume :: (character : *CharacterBase, plane : Plane) -> void #foreign JoltC "JPH_CharacterBase_SetSupportingVolume";
    IsSlopeTooSteep :: (character : *CharacterBase, normal : Vec3) -> bool #foreign JoltC "JPH_CharacterBase_IsSlopeTooSteep";
    GetShape :: (character : *CharacterBase) -> *Shape #foreign JoltC "JPH_CharacterBase_GetShape";
    GetGroundState :: (character : *CharacterBase) -> ECharacterGroundState #foreign JoltC "JPH_CharacterBase_GetGroundState";
    IsSupported :: (character : *CharacterBase) -> bool #foreign JoltC "JPH_CharacterBase_IsSupported";
    GetGroundPosition :: (character : *CharacterBase) -> RVec3 #foreign JoltC "JPH_CharacterBase_GetGroundPosition";
    GetGroundNormal :: (character : *CharacterBase) -> Vec3 #foreign JoltC "JPH_CharacterBase_GetGroundNormal";
    GetGroundVelocity :: (character : *CharacterBase) -> Vec3 #foreign JoltC "JPH_CharacterBase_GetGroundVelocity";
    GetGroundMaterial :: (character : *CharacterBase) -> *PhysicsMaterial #foreign JoltC "JPH_CharacterBase_GetGroundMaterial";
    GetGroundBodyID :: (character : *CharacterBase) -> BodyID #foreign JoltC "JPH_CharacterBase_GetGroundBodyID";
    GetGroundSubShapeID :: (character : *CharacterBase) -> SubShapeID #foreign JoltC "JPH_CharacterBase_GetGroundSubShapeID";
    GetGroundUserData :: (character : *CharacterBase) -> u64 #foreign JoltC "JPH_CharacterBase_GetGroundUserData";
}

CharacterSettings :: struct {
    up : Vec3;
    supportingVolume : Plane;
    maxSlopeAngle : float;
    enhancedInternalEdgeRemoval : bool;
    shape : *Shape;
    layer : ObjectLayer;
    mass : float;
    friction : float;
    gravityFactor : float;
    allowedDOFs : EAllowedDOFs;

    Default :: () -> CharacterSettings #foreign JoltC "JPH_CharacterSettings_Default";
}

Character :: struct {
    #as using,except(base) base : CharacterBase;

    Create :: (settings : *CharacterSettings, position : RVec3, rotation : Quat, userData : u64, system : *PhysicsSystem) -> *Character #foreign JoltC "JPH_Character_Create";

    AddToPhysicsSystem :: (character : *Character, activationMode : EActivation, lockBodies : bool) -> void #foreign JoltC "JPH_Character_AddToPhysicsSystem";
    RemoveFromPhysicsSystem :: (character : *Character, lockBodies : bool) -> void #foreign JoltC "JPH_Character_RemoveFromPhysicsSystem";
    Activate :: (character : *Character, lockBodies : bool) -> void #foreign JoltC "JPH_Character_Activate";
    PostSimulation :: (character : *Character, maxSeparationDistance : float, lockBodies : bool) -> void #foreign JoltC "JPH_Character_PostSimulation";
    SetLinearAndAngularVelocity :: (character : *Character, linearVelocity : Vec3, angularVelocity : Vec3, lockBodies : bool) -> void #foreign JoltC "JPH_Character_SetLinearAndAngularVelocity";
    GetLinearVelocity :: (character : *Character, lockBodies : bool) -> Vec3 #foreign JoltC "JPH_Character_GetLinearVelocity";
    SetLinearVelocity :: (character : *Character, linearVelocity : Vec3, lockBodies : bool) -> void #foreign JoltC "JPH_Character_SetLinearVelocity";
    AddLinearVelocity :: (character : *Character, linearVelocity : Vec3, lockBodies : bool) -> void #foreign JoltC "JPH_Character_AddLinearVelocity";
    AddImpulse :: (character : *Character, impulse : Vec3, lockBodies : bool) -> void #foreign JoltC "JPH_Character_AddImpulse";
    GetBodyID :: (character : *Character) -> BodyID #foreign JoltC "JPH_Character_GetBodyID";
    GetPositionAndRotation :: (character : *Character, outPosition : *RVec3, outRotation : *Quat, lockBodies : bool) -> void #foreign JoltC "JPH_Character_GetPositionAndRotation";
    SetPositionAndRotation :: (character : *Character, position : RVec3, rotation : Quat, activationMode : EActivation, lockBodies : bool) -> void #foreign JoltC "JPH_Character_SetPositionAndRotation";
    GetPosition :: (character : *Character, lockBodies : bool) -> RVec3 #foreign JoltC "JPH_Character_GetPosition";
    SetPosition :: (character : *Character, position : RVec3, activationMode : EActivation, lockBodies : bool) -> void #foreign JoltC "JPH_Character_SetPosition";
    GetRotation :: (character : *Character, lockBodies : bool) -> Quat #foreign JoltC "JPH_Character_GetRotation";
    SetRotation :: (character : *Character, rotation : Quat, activationMode : EActivation, lockBodies : bool) -> void #foreign JoltC "JPH_Character_SetRotation";
    GetCenterOfMassPosition :: (character : *Character, lockBodies : bool) -> RVec3 #foreign JoltC "JPH_Character_GetCenterOfMassPosition";
    GetWorldTransform :: (character : *Character, lockBodies : bool) -> RMat44 #foreign JoltC "JPH_Character_GetWorldTransform";
    GetLayer :: (character : *Character) -> ObjectLayer #foreign JoltC "JPH_Character_GetLayer";
    SetLayer :: (character : *Character, layer : ObjectLayer, lockBodies : bool) -> void #foreign JoltC "JPH_Character_SetLayer";
    SetShape :: (character : *Character, shape : *Shape, maxPenetrationDepth : float, lockBodies : bool) -> bool #foreign JoltC "JPH_Character_SetShape";
    GetTransformedShape :: (character : *Character, lockBodies : bool) -> TransformedShape #foreign JoltC "JPH_Character_GetTransformedShape";
    CheckCollision :: (character : *Character, position : RVec3, rotation : Quat, movementDirection : Vec3, maxSeparationDistance : float, shape : *Shape, baseOffset : RVec3, collector : *CollideShapeCollector, lockBodies : bool) -> void #foreign JoltC "JPH_Character_CheckCollision";
    GetCharacterSettings :: (character : *Character, lockBodies : bool) -> CharacterSettings #foreign JoltC "JPH_Character_GetCharacterSettings";
}

CharacterVirtualSettings :: struct {
    up : Vec3;
    supportingVolume : Plane;
    maxSlopeAngle : float;
    enhancedInternalEdgeRemoval : bool;
    shape : *Shape;
    id : CharacterID;
    mass : float;
    maxStrength : float;
    shapeOffset : Vec3;
    backFaceMode : EBackFaceMode;
    predictiveContactDistance : float;
    maxCollisionIterations : u32;
    maxConstraintIterations : u32;
    minTimeRemaining : float;
    collisionTolerance : float;
    characterPadding : float;
    maxNumHits : u32;
    hitReductionCosMaxAngle : float;
    penetrationRecoverySpeed : float;
    innerBodyShape : *Shape;
    innerBodyIDOverride : BodyID;
    innerBodyLayer : ObjectLayer;

    Default :: () -> CharacterVirtualSettings #foreign JoltC "JPH_CharacterVirtualSettings_Default";
}

CharacterVirtual :: struct {
    ExtendedUpdateSettings :: struct {
        stickToFloorStepDown : Vec3;
        walkStairsStepUp : Vec3;
        walkStairsMinStepForward : float;
        walkStairsStepForwardTest : float;
        walkStairsCosAngleForwardContact : float;
        walkStairsStepDownExtra : Vec3;

        Default :: () -> CharacterVirtual.ExtendedUpdateSettings #foreign JoltC "JPH_CharacterVirtual_ExtendedUpdateSettings_Default";
    }

    #as using,except(base) base : CharacterBase;

    Create :: (settings : *CharacterVirtualSettings, position : RVec3, rotation : Quat, userData : u64, system : *PhysicsSystem) -> *CharacterVirtual #foreign JoltC "JPH_CharacterVirtual_Create";

    GetID :: (character : *CharacterVirtual) -> CharacterID #foreign JoltC "JPH_CharacterVirtual_GetID";
    SetListener :: (character : *CharacterVirtual, listener : *CharacterContactListener) -> void #foreign JoltC "JPH_CharacterVirtual_SetListener";
    GetListener :: (character : *CharacterVirtual) -> *CharacterContactListener #foreign JoltC "JPH_CharacterVirtual_GetListener";
    GetLinearVelocity :: (character : *CharacterVirtual) -> Vec3 #foreign JoltC "JPH_CharacterVirtual_GetLinearVelocity";
    SetLinearVelocity :: (character : *CharacterVirtual, linearVelocity : Vec3) -> void #foreign JoltC "JPH_CharacterVirtual_SetLinearVelocity";
    GetPosition :: (character : *CharacterVirtual) -> RVec3 #foreign JoltC "JPH_CharacterVirtual_GetPosition";
    SetPosition :: (character : *CharacterVirtual, position : RVec3) -> void #foreign JoltC "JPH_CharacterVirtual_SetPosition";
    GetRotation :: (character : *CharacterVirtual) -> Quat #foreign JoltC "JPH_CharacterVirtual_GetRotation";
    SetRotation :: (character : *CharacterVirtual, rotation : Quat) -> void #foreign JoltC "JPH_CharacterVirtual_SetRotation";
    GetCenterOfMassPosition :: (character : *CharacterVirtual) -> RVec3 #foreign JoltC "JPH_CharacterVirtual_GetCenterOfMassPosition";
    GetWorldTransform :: (character : *CharacterVirtual) -> RMat44 #foreign JoltC "JPH_CharacterVirtual_GetWorldTransform";
    GetCenterOfMassTransform :: (character : *CharacterVirtual) -> RMat44 #foreign JoltC "JPH_CharacterVirtual_GetCenterOfMassTransform";
    GetMass :: (character : *CharacterVirtual) -> float #foreign JoltC "JPH_CharacterVirtual_GetMass";
    SetMass :: (character : *CharacterVirtual, mass : float) -> void #foreign JoltC "JPH_CharacterVirtual_SetMass";
    GetMaxStrength :: (character : *CharacterVirtual) -> float #foreign JoltC "JPH_CharacterVirtual_GetMaxStrength";
    SetMaxStrength :: (character : *CharacterVirtual, maxStrength : float) -> void #foreign JoltC "JPH_CharacterVirtual_SetMaxStrength";
    GetPenetrationRecoverySpeed :: (character : *CharacterVirtual) -> float #foreign JoltC "JPH_CharacterVirtual_GetPenetrationRecoverySpeed";
    SetPenetrationRecoverySpeed :: (character : *CharacterVirtual, speed : float) -> void #foreign JoltC "JPH_CharacterVirtual_SetPenetrationRecoverySpeed";
    GetEnhancedInternalEdgeRemoval :: (character : *CharacterVirtual) -> bool #foreign JoltC "JPH_CharacterVirtual_GetEnhancedInternalEdgeRemoval";
    SetEnhancedInternalEdgeRemoval :: (character : *CharacterVirtual, apply : bool) -> void #foreign JoltC "JPH_CharacterVirtual_SetEnhancedInternalEdgeRemoval";
    GetCharacterPadding :: (character : *CharacterVirtual) -> float #foreign JoltC "JPH_CharacterVirtual_GetCharacterPadding";
    GetMaxNumHits :: (character : *CharacterVirtual) -> u32 #foreign JoltC "JPH_CharacterVirtual_GetMaxNumHits";
    SetMaxNumHits :: (character : *CharacterVirtual, maxHits : u32) -> void #foreign JoltC "JPH_CharacterVirtual_SetMaxNumHits";
    GetHitReductionCosMaxAngle :: (character : *CharacterVirtual) -> float #foreign JoltC "JPH_CharacterVirtual_GetHitReductionCosMaxAngle";
    SetHitReductionCosMaxAngle :: (character : *CharacterVirtual, cosMaxAngle : float) -> void #foreign JoltC "JPH_CharacterVirtual_SetHitReductionCosMaxAngle";
    GetMaxHitsExceeded :: (character : *CharacterVirtual) -> bool #foreign JoltC "JPH_CharacterVirtual_GetMaxHitsExceeded";
    GetShapeOffset :: (character : *CharacterVirtual) -> Vec3 #foreign JoltC "JPH_CharacterVirtual_GetShapeOffset";
    SetShapeOffset :: (character : *CharacterVirtual, shapeOffset : Vec3) -> void #foreign JoltC "JPH_CharacterVirtual_SetShapeOffset";
    GetUserData :: (character : *CharacterVirtual) -> u64 #foreign JoltC "JPH_CharacterVirtual_GetUserData";
    SetUserData :: (character : *CharacterVirtual, userData : u64) -> void #foreign JoltC "JPH_CharacterVirtual_SetUserData";
    GetInnerBodyID :: (character : *CharacterVirtual) -> BodyID #foreign JoltC "JPH_CharacterVirtual_GetInnerBodyID";
    CancelVelocityTowardsSteepSlopes :: (character : *CharacterVirtual, desiredVelocity : Vec3) -> Vec3 #foreign JoltC "JPH_CharacterVirtual_CancelVelocityTowardsSteepSlopes";
    StartTrackingContactChanges :: (character : *CharacterVirtual) -> void #foreign JoltC "JPH_CharacterVirtual_StartTrackingContactChanges";
    FinishTrackingContactChanges :: (character : *CharacterVirtual) -> void #foreign JoltC "JPH_CharacterVirtual_FinishTrackingContactChanges";
    Update :: (character : *CharacterVirtual, deltaTime : float, gravity : Vec3, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter, allocator : *TempAllocator) -> void #foreign JoltC "JPH_CharacterVirtual_Update";
    CanWalkStairs :: (character : *CharacterVirtual, linearVelocity : Vec3) -> bool #foreign JoltC "JPH_CharacterVirtual_CanWalkStairs";
    WalkStairs :: (character : *CharacterVirtual, deltaTime : float, stepUp : Vec3, stepForward : Vec3, stepForwardTest : Vec3, stepDownExtra : Vec3, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter, allocator : *TempAllocator) -> bool #foreign JoltC "JPH_CharacterVirtual_WalkStairs";
    StickToFloor :: (character : *CharacterVirtual, stepDown : Vec3, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter, allocator : *TempAllocator) -> bool #foreign JoltC "JPH_CharacterVirtual_StickToFloor";
    ExtendedUpdate :: (character : *CharacterVirtual, deltaTime : float, gravity : Vec3, settings : *CharacterVirtual.ExtendedUpdateSettings, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter, allocator : *TempAllocator) -> void #foreign JoltC "JPH_CharacterVirtual_ExtendedUpdate";
    RefreshContacts :: (character : *CharacterVirtual, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter, allocator : *TempAllocator) -> void #foreign JoltC "JPH_CharacterVirtual_RefreshContacts";
    UpdateGroundVelocity :: (character : *CharacterVirtual) -> void #foreign JoltC "JPH_CharacterVirtual_UpdateGroundVelocity";
    SetShape :: (character : *CharacterVirtual, shape : *Shape, maxPenetrationDepth : float, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter, allocator : *TempAllocator) -> bool #foreign JoltC "JPH_CharacterVirtual_SetShape";
    SetInnerBodyShape :: (character : *CharacterVirtual, shape : *Shape) -> void #foreign JoltC "JPH_CharacterVirtual_SetInnerBodyShape";
    GetTransformedShape :: (character : *CharacterVirtual) -> TransformedShape #foreign JoltC "JPH_CharacterVirtual_GetTransformedShape";
    CheckCollision :: (character : *CharacterVirtual, position : RVec3, rotation : Quat, movementDirection : Vec3, maxSeparationDistance : float, shape : *Shape, baseOffset : RVec3, ioCollector : *CollideShapeCollector, broadPhaseLayerFilter : *BroadPhaseLayerFilter, objectLayerFilter : *ObjectLayerFilter, bodyFilter : *BodyFilter, shapeFilter : *ShapeFilter) -> void #foreign JoltC "JPH_CharacterVirtual_CheckCollision";
    GetCharacterVirtualSettings :: (character : *CharacterVirtual) -> CharacterVirtualSettings #foreign JoltC "JPH_CharacterVirtual_GetCharacterVirtualSettings";
    HasCollidedWithBody :: (character : *CharacterVirtual, body : BodyID) -> bool #foreign JoltC "JPH_CharacterVirtual_HasCollidedWithBody";
    HasCollidedWithCharacterByID :: (character : *CharacterVirtual, characterID : CharacterID) -> bool #foreign JoltC "JPH_CharacterVirtual_HasCollidedWithCharacterByID";
    HasCollidedWithCharacter :: (character : *CharacterVirtual, otherCharacter : *CharacterVirtual) -> bool #foreign JoltC "JPH_CharacterVirtual_HasCollidedWithCharacter";
}

CharacterContact :: struct {
    bodyB : BodyID;
    characterIDB : CharacterID;
    subShapeIDB : SubShapeID;
    position : RVec3;
    linearVelocity : Vec3;
    contactNormal : Vec3;
    surfaceNormal : Vec3;
    distance : float;
    fraction : float;
    motionTypeB : EMotionType;
    isSensorB : bool;
    characterB : *CharacterVirtual;
    userData : u64;
    material : *PhysicsMaterial;
    hadCollision : bool;
    wasDiscarded : bool;
    canPushCharacter : bool;
    isBackFacingContact : bool;
}

CharacterContactSettings :: struct {
    canPushCharacter : bool;
    canReceiveImpulses : bool;

    Default :: () -> CharacterContactSettings #foreign JoltC "JPH_CharacterContactSettings_Default";
}

CharacterContactListener :: struct {
    Funcs :: struct {
        Destruct : #type (*void) -> void #c_call;
        OnAdjustBodyVelocity : #type (*void, *CharacterVirtual, *Body, *Vec3, *Vec3) -> void #c_call;
        OnContactValidate : #type (*void, *CharacterVirtual, *CharacterContact) -> bool #c_call;
        OnContactAdded : #type (*void, *CharacterVirtual, *CharacterContact, *CharacterContactSettings) -> void #c_call;
        OnContactPersisted : #type (*void, *CharacterVirtual, *CharacterContact, *CharacterContactSettings) -> void #c_call;
        OnContactRemoved : #type (*void, *CharacterVirtual, BodyID, SubShapeID) -> void #c_call;
        OnCharacterContactValidate : #type (*void, *CharacterVirtual, *CharacterContact) -> bool #c_call;
        OnCharacterContactAdded : #type (*void, *CharacterVirtual, *CharacterContact, *CharacterContactSettings) -> void #c_call;
        OnCharacterContactPersisted : #type (*void, *CharacterVirtual, *CharacterContact, *CharacterContactSettings) -> void #c_call;
        OnCharacterContactRemoved : #type (*void, *CharacterVirtual, CharacterID, SubShapeID) -> void #c_call;
        OnContactSolve : #type (*void, *CharacterVirtual, BodyID, SubShapeID, RVec3, Vec3, Vec3, *PhysicsMaterial, Vec3, *Vec3) -> void #c_call;
        OnCharacterContactSolve : #type (*void, *CharacterVirtual, *CharacterVirtual, SubShapeID, RVec3, Vec3, Vec3, *PhysicsMaterial, Vec3, *Vec3) -> void #c_call;
    }

    Create :: (data : *void, funcs : CharacterContactListener.Funcs, allocator : JoltCAllocator) -> *CharacterContactListener #foreign JoltC "JPH_CharacterContactListener_Create";

    Destroy :: (self : *CharacterContactListener) -> void #foreign JoltC "JPH_CharacterContactListener_Destroy";
}

// Functions

DegreesToRadians :: (degrees : float) -> float #foreign JoltC "JPH_DegreesToRadians";
RadiansToDegrees :: (radians : float) -> float #foreign JoltC "JPH_RadiansToDegrees";
RegisterDefaultAllocator :: () -> void #foreign JoltC "JPH_RegisterDefaultAllocator";
RegisterDefaultTraceHandler :: () -> void #foreign JoltC "JPH_RegisterDefaultTraceHandler";
RegisterDefaultAssertFailedHandler :: () -> void #foreign JoltC "JPH_RegisterDefaultAssertFailedHandler";
SetAllocatorFunctions :: (allocate : AllocateFunction, reallocate : ReallocateFunction, free : FreeFunction, alignedAllocate : AlignedAllocateFunction, alignedFree : AlignedFreeFunction) -> void #foreign JoltC "JPH_SetAllocatorFunctions";
SetTraceHandler :: (handler : TraceHandler) -> void #foreign JoltC "JPH_SetTraceHandler";
SetAssertFailedHandler :: (handler : AssertFailedHandler) -> void #foreign JoltC "JPH_SetAssertFailedHandler";
CreateFactory :: () -> void #foreign JoltC "JPH_CreateFactory";
DestroyFactory :: () -> void #foreign JoltC "JPH_DestroyFactory";
RegisterTypes :: () -> void #foreign JoltC "JPH_RegisterTypes";
UnregisterTypes :: () -> void #foreign JoltC "JPH_UnregisterTypes";
Allocate :: (size : u64) -> *void #foreign JoltC "JPH_Allocate";
Reallocate :: (block : *void, oldSize : u64, newSize : u64) -> *void #foreign JoltC "JPH_Reallocate";
Free :: (block : *void) -> void #foreign JoltC "JPH_Free";
AlignedAllocate :: (size : u64, alignment : u64) -> *void #foreign JoltC "JPH_AlignedAllocate";
AlignedFree :: (block : *void) -> void #foreign JoltC "JPH_AlignedFree";
GetJoltVersionID :: () -> u64 #foreign JoltC "JPH_GetJoltVersionID";
NextCharacterID :: () -> CharacterID #foreign JoltC "JPH_NextCharacterID";
