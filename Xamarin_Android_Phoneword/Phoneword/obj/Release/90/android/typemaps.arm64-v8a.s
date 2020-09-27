	.arch	armv8-a
	.file	"typemaps.arm64-v8a.s"

/* map_module_count: START */
	.section	.rodata.map_module_count,"a",@progbits
	.type	map_module_count, @object
	.p2align	2
	.global	map_module_count
map_module_count:
	.size	map_module_count, 4
	.word	4
/* map_module_count: END */

/* java_type_count: START */
	.section	.rodata.java_type_count,"a",@progbits
	.type	java_type_count, @object
	.p2align	2
	.global	java_type_count
java_type_count:
	.size	java_type_count, 4
	.word	198
/* java_type_count: END */

/* java_name_width: START */
	.section	.rodata.java_name_width,"a",@progbits
	.type	java_name_width, @object
	.p2align	2
	.global	java_name_width
java_name_width:
	.size	java_name_width, 4
	.word	75
/* java_name_width: END */

	.include	"typemaps.shared.inc"
	.include	"typemaps.arm64-v8a-managed.inc"

/* Managed to Java map: START */
	.section	.data.rel.map_modules,"aw",@progbits
	.type	map_modules, @object
	.p2align	3
	.global	map_modules
map_modules:
	/* module_uuid: a3c7e937-02f3-4516-853a-34a9b32532f7 */
	.byte	0x37, 0xe9, 0xc7, 0xa3, 0xf3, 0x02, 0x16, 0x45, 0x85, 0x3a, 0x34, 0xa9, 0xb3, 0x25, 0x32, 0xf7
	/* entry_count */
	.word	7
	/* duplicate_count */
	.word	1
	/* map */
	.xword	module0_managed_to_java
	/* duplicate_map */
	.xword	module0_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.Compat */
	.xword	.L.map_aname.0
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: 14b08268-a422-4a88-b07f-19891d6cab7a */
	.byte	0x68, 0x82, 0xb0, 0x14, 0x22, 0xa4, 0x88, 0x4a, 0xb0, 0x7f, 0x19, 0x89, 0x1d, 0x6c, 0xab, 0x7a
	/* entry_count */
	.word	5
	/* duplicate_count */
	.word	0
	/* map */
	.xword	module1_managed_to_java
	/* duplicate_map */
	.xword	0
	/* assembly_name: Phoneword */
	.xword	.L.map_aname.1
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: 2b7d578b-107d-4f49-bf98-36b804c64d54 */
	.byte	0x8b, 0x57, 0x7d, 0x2b, 0x7d, 0x10, 0x49, 0x4f, 0xbf, 0x98, 0x36, 0xb8, 0x04, 0xc6, 0x4d, 0x54
	/* entry_count */
	.word	1
	/* duplicate_count */
	.word	0
	/* map */
	.xword	module2_managed_to_java
	/* duplicate_map */
	.xword	0
	/* assembly_name: Xamarin.Essentials */
	.xword	.L.map_aname.2
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: 6129cc97-2f65-47e7-bb79-deb7be2ca44d */
	.byte	0x97, 0xcc, 0x29, 0x61, 0x65, 0x2f, 0xe7, 0x47, 0xbb, 0x79, 0xde, 0xb7, 0xbe, 0x2c, 0xa4, 0x4d
	/* entry_count */
	.word	185
	/* duplicate_count */
	.word	28
	/* map */
	.xword	module3_managed_to_java
	/* duplicate_map */
	.xword	module3_managed_to_java_duplicates
	/* assembly_name: Mono.Android */
	.xword	.L.map_aname.3
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	.size	map_modules, 288
/* Managed to Java map: END */

/* Java to managed map: START */
	.section	.rodata.map_java,"a",@progbits
	.type	map_java, @object
	.p2align	2
	.global	map_java
map_java:
	/* #0 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554652
	/* java_name */
	.ascii	"android/app/Activity"
	.zero	55

	/* #1 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554653
	/* java_name */
	.ascii	"android/app/Application"
	.zero	52

	/* #2 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554655
	/* java_name */
	.ascii	"android/app/Application$ActivityLifecycleCallbacks"
	.zero	25

	/* #3 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554657
	/* java_name */
	.ascii	"android/app/Notification"
	.zero	51

	/* #4 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554658
	/* java_name */
	.ascii	"android/app/Notification$Builder"
	.zero	43

	/* #5 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554663
	/* java_name */
	.ascii	"android/app/NotificationChannel"
	.zero	44

	/* #6 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554659
	/* java_name */
	.ascii	"android/app/NotificationManager"
	.zero	44

	/* #7 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554665
	/* java_name */
	.ascii	"android/app/Service"
	.zero	56

	/* #8 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554672
	/* java_name */
	.ascii	"android/content/BroadcastReceiver"
	.zero	42

	/* #9 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554679
	/* java_name */
	.ascii	"android/content/ComponentCallbacks"
	.zero	41

	/* #10 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554681
	/* java_name */
	.ascii	"android/content/ComponentCallbacks2"
	.zero	40

	/* #11 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554674
	/* java_name */
	.ascii	"android/content/ComponentName"
	.zero	46

	/* #12 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554670
	/* java_name */
	.ascii	"android/content/Context"
	.zero	52

	/* #13 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554676
	/* java_name */
	.ascii	"android/content/ContextWrapper"
	.zero	45

	/* #14 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554671
	/* java_name */
	.ascii	"android/content/Intent"
	.zero	53

	/* #15 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554682
	/* java_name */
	.ascii	"android/content/IntentSender"
	.zero	47

	/* #16 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554688
	/* java_name */
	.ascii	"android/content/SharedPreferences"
	.zero	42

	/* #17 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554684
	/* java_name */
	.ascii	"android/content/SharedPreferences$Editor"
	.zero	35

	/* #18 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554686
	/* java_name */
	.ascii	"android/content/SharedPreferences$OnSharedPreferenceChangeListener"
	.zero	9

	/* #19 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554690
	/* java_name */
	.ascii	"android/content/pm/ApplicationInfo"
	.zero	41

	/* #20 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554691
	/* java_name */
	.ascii	"android/content/pm/PackageInfo"
	.zero	45

	/* #21 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554693
	/* java_name */
	.ascii	"android/content/pm/PackageItemInfo"
	.zero	41

	/* #22 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554694
	/* java_name */
	.ascii	"android/content/pm/PackageManager"
	.zero	42

	/* #23 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554697
	/* java_name */
	.ascii	"android/content/res/ColorStateList"
	.zero	41

	/* #24 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554698
	/* java_name */
	.ascii	"android/content/res/Configuration"
	.zero	42

	/* #25 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554699
	/* java_name */
	.ascii	"android/content/res/Resources"
	.zero	46

	/* #26 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554642
	/* java_name */
	.ascii	"android/graphics/Matrix"
	.zero	52

	/* #27 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554643
	/* java_name */
	.ascii	"android/graphics/Point"
	.zero	53

	/* #28 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554644
	/* java_name */
	.ascii	"android/graphics/Rect"
	.zero	54

	/* #29 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554645
	/* java_name */
	.ascii	"android/graphics/RectF"
	.zero	53

	/* #30 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554646
	/* java_name */
	.ascii	"android/graphics/drawable/Drawable"
	.zero	41

	/* #31 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554648
	/* java_name */
	.ascii	"android/graphics/drawable/Drawable$Callback"
	.zero	32

	/* #32 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554634
	/* java_name */
	.ascii	"android/net/ConnectivityManager"
	.zero	44

	/* #33 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554636
	/* java_name */
	.ascii	"android/net/Network"
	.zero	56

	/* #34 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554637
	/* java_name */
	.ascii	"android/net/NetworkCapabilities"
	.zero	44

	/* #35 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554638
	/* java_name */
	.ascii	"android/net/NetworkInfo"
	.zero	52

	/* #36 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554639
	/* java_name */
	.ascii	"android/net/Uri"
	.zero	60

	/* #37 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554616
	/* java_name */
	.ascii	"android/os/BaseBundle"
	.zero	54

	/* #38 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554617
	/* java_name */
	.ascii	"android/os/Build"
	.zero	59

	/* #39 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554618
	/* java_name */
	.ascii	"android/os/Build$VERSION"
	.zero	51

	/* #40 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554620
	/* java_name */
	.ascii	"android/os/Bundle"
	.zero	58

	/* #41 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554621
	/* java_name */
	.ascii	"android/os/Environment"
	.zero	53

	/* #42 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554615
	/* java_name */
	.ascii	"android/os/Handler"
	.zero	57

	/* #43 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554625
	/* java_name */
	.ascii	"android/os/IBinder"
	.zero	57

	/* #44 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554623
	/* java_name */
	.ascii	"android/os/IBinder$DeathRecipient"
	.zero	42

	/* #45 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554627
	/* java_name */
	.ascii	"android/os/IInterface"
	.zero	54

	/* #46 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554630
	/* java_name */
	.ascii	"android/os/Looper"
	.zero	58

	/* #47 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554631
	/* java_name */
	.ascii	"android/os/Parcel"
	.zero	58

	/* #48 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554629
	/* java_name */
	.ascii	"android/os/Parcelable"
	.zero	54

	/* #49 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554614
	/* java_name */
	.ascii	"android/preference/PreferenceManager"
	.zero	39

	/* #50 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554745
	/* java_name */
	.ascii	"android/runtime/JavaProxyThrowable"
	.zero	41

	/* #51 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554435
	/* java_name */
	.ascii	"android/support/v13/view/DragAndDropPermissionsCompat"
	.zero	22

	/* #52 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554438
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat"
	.zero	38

	/* #53 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554440
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat$PermissionCompatDelegate"
	.zero	13

	/* #54 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554441
	/* java_name */
	.ascii	"android/support/v4/app/SharedElementCallback"
	.zero	31

	/* #55 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554443
	/* java_name */
	.ascii	"android/support/v4/app/SharedElementCallback$OnSharedElementsReadyListener"
	.zero	1

	/* #56 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"android/support/v4/content/ContextCompat"
	.zero	35

	/* #57 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"android/support/v4/content/PermissionChecker"
	.zero	31

	/* #58 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554612
	/* java_name */
	.ascii	"android/telephony/PhoneStateListener"
	.zero	39

	/* #59 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554610
	/* java_name */
	.ascii	"android/telephony/TelephonyManager"
	.zero	41

	/* #60 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554609
	/* java_name */
	.ascii	"android/util/AttributeSet"
	.zero	50

	/* #61 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554607
	/* java_name */
	.ascii	"android/util/DisplayMetrics"
	.zero	48

	/* #62 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554606
	/* java_name */
	.ascii	"android/util/Log"
	.zero	59

	/* #63 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554551
	/* java_name */
	.ascii	"android/view/ActionMode"
	.zero	52

	/* #64 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554553
	/* java_name */
	.ascii	"android/view/ActionMode$Callback"
	.zero	43

	/* #65 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554556
	/* java_name */
	.ascii	"android/view/ActionProvider"
	.zero	48

	/* #66 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554565
	/* java_name */
	.ascii	"android/view/ContextMenu"
	.zero	51

	/* #67 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554563
	/* java_name */
	.ascii	"android/view/ContextMenu$ContextMenuInfo"
	.zero	35

	/* #68 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554558
	/* java_name */
	.ascii	"android/view/ContextThemeWrapper"
	.zero	43

	/* #69 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554559
	/* java_name */
	.ascii	"android/view/Display"
	.zero	55

	/* #70 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554560
	/* java_name */
	.ascii	"android/view/DragEvent"
	.zero	53

	/* #71 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554574
	/* java_name */
	.ascii	"android/view/InputEvent"
	.zero	52

	/* #72 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554536
	/* java_name */
	.ascii	"android/view/KeyEvent"
	.zero	54

	/* #73 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554538
	/* java_name */
	.ascii	"android/view/KeyEvent$Callback"
	.zero	45

	/* #74 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554539
	/* java_name */
	.ascii	"android/view/LayoutInflater"
	.zero	48

	/* #75 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554541
	/* java_name */
	.ascii	"android/view/LayoutInflater$Factory"
	.zero	40

	/* #76 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554543
	/* java_name */
	.ascii	"android/view/LayoutInflater$Factory2"
	.zero	39

	/* #77 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554567
	/* java_name */
	.ascii	"android/view/Menu"
	.zero	58

	/* #78 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554573
	/* java_name */
	.ascii	"android/view/MenuItem"
	.zero	54

	/* #79 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554569
	/* java_name */
	.ascii	"android/view/MenuItem$OnActionExpandListener"
	.zero	31

	/* #80 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554571
	/* java_name */
	.ascii	"android/view/MenuItem$OnMenuItemClickListener"
	.zero	30

	/* #81 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554544
	/* java_name */
	.ascii	"android/view/MotionEvent"
	.zero	51

	/* #82 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554591
	/* java_name */
	.ascii	"android/view/SearchEvent"
	.zero	51

	/* #83 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554577
	/* java_name */
	.ascii	"android/view/SubMenu"
	.zero	55

	/* #84 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554528
	/* java_name */
	.ascii	"android/view/View"
	.zero	58

	/* #85 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554530
	/* java_name */
	.ascii	"android/view/View$OnClickListener"
	.zero	42

	/* #86 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554533
	/* java_name */
	.ascii	"android/view/View$OnCreateContextMenuListener"
	.zero	30

	/* #87 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554595
	/* java_name */
	.ascii	"android/view/ViewGroup"
	.zero	53

	/* #88 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554596
	/* java_name */
	.ascii	"android/view/ViewGroup$LayoutParams"
	.zero	40

	/* #89 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554579
	/* java_name */
	.ascii	"android/view/ViewManager"
	.zero	51

	/* #90 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554581
	/* java_name */
	.ascii	"android/view/ViewParent"
	.zero	52

	/* #91 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554545
	/* java_name */
	.ascii	"android/view/ViewTreeObserver"
	.zero	46

	/* #92 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554547
	/* java_name */
	.ascii	"android/view/ViewTreeObserver$OnPreDrawListener"
	.zero	28

	/* #93 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554548
	/* java_name */
	.ascii	"android/view/Window"
	.zero	56

	/* #94 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554550
	/* java_name */
	.ascii	"android/view/Window$Callback"
	.zero	47

	/* #95 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554584
	/* java_name */
	.ascii	"android/view/WindowManager"
	.zero	49

	/* #96 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554582
	/* java_name */
	.ascii	"android/view/WindowManager$LayoutParams"
	.zero	36

	/* #97 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554599
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityEvent"
	.zero	30

	/* #98 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554605
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityEventSource"
	.zero	24

	/* #99 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554600
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityRecord"
	.zero	29

	/* #100 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554524
	/* java_name */
	.ascii	"android/widget/Button"
	.zero	54

	/* #101 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554525
	/* java_name */
	.ascii	"android/widget/EditText"
	.zero	52

	/* #102 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554523
	/* java_name */
	.ascii	"android/widget/TextView"
	.zero	52

	/* #103 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554526
	/* java_name */
	.ascii	"android/widget/Toast"
	.zero	55

	/* #104 */
	/* module_index */
	.word	1
	/* type_token_id */
	.word	33554439
	/* java_name */
	.ascii	"crc64011c912fbddd1d08/ForegroundService"
	.zero	36

	/* #105 */
	/* module_index */
	.word	1
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"crc64011c912fbddd1d08/MainActivity"
	.zero	41

	/* #106 */
	/* module_index */
	.word	1
	/* type_token_id */
	.word	33554441
	/* java_name */
	.ascii	"crc64011c912fbddd1d08/MeBootReceiver"
	.zero	39

	/* #107 */
	/* module_index */
	.word	1
	/* type_token_id */
	.word	33554438
	/* java_name */
	.ascii	"crc64011c912fbddd1d08/MyBootReceiver"
	.zero	39

	/* #108 */
	/* module_index */
	.word	1
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"crc64011c912fbddd1d08/NetChangedReceiver"
	.zero	35

	/* #109 */
	/* module_index */
	.word	2
	/* type_token_id */
	.word	33554456
	/* java_name */
	.ascii	"crc64a0e0a82d0db9a07d/ActivityLifecycleContextListener"
	.zero	21

	/* #110 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554869
	/* java_name */
	.ascii	"java/io/Closeable"
	.zero	58

	/* #111 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554865
	/* java_name */
	.ascii	"java/io/File"
	.zero	63

	/* #112 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554866
	/* java_name */
	.ascii	"java/io/FileDescriptor"
	.zero	53

	/* #113 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554867
	/* java_name */
	.ascii	"java/io/FileInputStream"
	.zero	52

	/* #114 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554871
	/* java_name */
	.ascii	"java/io/Flushable"
	.zero	58

	/* #115 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554874
	/* java_name */
	.ascii	"java/io/IOException"
	.zero	56

	/* #116 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554872
	/* java_name */
	.ascii	"java/io/InputStream"
	.zero	56

	/* #117 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554877
	/* java_name */
	.ascii	"java/io/OutputStream"
	.zero	55

	/* #118 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554879
	/* java_name */
	.ascii	"java/io/PrintWriter"
	.zero	56

	/* #119 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554876
	/* java_name */
	.ascii	"java/io/Serializable"
	.zero	55

	/* #120 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554880
	/* java_name */
	.ascii	"java/io/StringWriter"
	.zero	55

	/* #121 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554881
	/* java_name */
	.ascii	"java/io/Writer"
	.zero	61

	/* #122 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554836
	/* java_name */
	.ascii	"java/lang/Appendable"
	.zero	55

	/* #123 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554814
	/* java_name */
	.ascii	"java/lang/Boolean"
	.zero	58

	/* #124 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554815
	/* java_name */
	.ascii	"java/lang/Byte"
	.zero	61

	/* #125 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554837
	/* java_name */
	.ascii	"java/lang/CharSequence"
	.zero	53

	/* #126 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554816
	/* java_name */
	.ascii	"java/lang/Character"
	.zero	56

	/* #127 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554817
	/* java_name */
	.ascii	"java/lang/Class"
	.zero	60

	/* #128 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554833
	/* java_name */
	.ascii	"java/lang/ClassCastException"
	.zero	47

	/* #129 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554818
	/* java_name */
	.ascii	"java/lang/ClassNotFoundException"
	.zero	43

	/* #130 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554840
	/* java_name */
	.ascii	"java/lang/Cloneable"
	.zero	56

	/* #131 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554842
	/* java_name */
	.ascii	"java/lang/Comparable"
	.zero	55

	/* #132 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554819
	/* java_name */
	.ascii	"java/lang/Double"
	.zero	59

	/* #133 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554834
	/* java_name */
	.ascii	"java/lang/Error"
	.zero	60

	/* #134 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554820
	/* java_name */
	.ascii	"java/lang/Exception"
	.zero	56

	/* #135 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554821
	/* java_name */
	.ascii	"java/lang/Float"
	.zero	60

	/* #136 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554843
	/* java_name */
	.ascii	"java/lang/IllegalArgumentException"
	.zero	41

	/* #137 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554844
	/* java_name */
	.ascii	"java/lang/IllegalStateException"
	.zero	44

	/* #138 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554845
	/* java_name */
	.ascii	"java/lang/IndexOutOfBoundsException"
	.zero	40

	/* #139 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554823
	/* java_name */
	.ascii	"java/lang/Integer"
	.zero	58

	/* #140 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554848
	/* java_name */
	.ascii	"java/lang/LinkageError"
	.zero	53

	/* #141 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554824
	/* java_name */
	.ascii	"java/lang/Long"
	.zero	61

	/* #142 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554849
	/* java_name */
	.ascii	"java/lang/NoClassDefFoundError"
	.zero	45

	/* #143 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554850
	/* java_name */
	.ascii	"java/lang/NullPointerException"
	.zero	45

	/* #144 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554851
	/* java_name */
	.ascii	"java/lang/Number"
	.zero	59

	/* #145 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554825
	/* java_name */
	.ascii	"java/lang/Object"
	.zero	59

	/* #146 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554853
	/* java_name */
	.ascii	"java/lang/ReflectiveOperationException"
	.zero	37

	/* #147 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554847
	/* java_name */
	.ascii	"java/lang/Runnable"
	.zero	57

	/* #148 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554826
	/* java_name */
	.ascii	"java/lang/RuntimeException"
	.zero	49

	/* #149 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554827
	/* java_name */
	.ascii	"java/lang/Short"
	.zero	60

	/* #150 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554828
	/* java_name */
	.ascii	"java/lang/String"
	.zero	59

	/* #151 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554830
	/* java_name */
	.ascii	"java/lang/Thread"
	.zero	59

	/* #152 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554832
	/* java_name */
	.ascii	"java/lang/Throwable"
	.zero	56

	/* #153 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554854
	/* java_name */
	.ascii	"java/lang/UnsupportedOperationException"
	.zero	36

	/* #154 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554856
	/* java_name */
	.ascii	"java/lang/annotation/Annotation"
	.zero	44

	/* #155 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554858
	/* java_name */
	.ascii	"java/lang/reflect/AnnotatedElement"
	.zero	41

	/* #156 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554860
	/* java_name */
	.ascii	"java/lang/reflect/GenericDeclaration"
	.zero	39

	/* #157 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554862
	/* java_name */
	.ascii	"java/lang/reflect/Type"
	.zero	53

	/* #158 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554864
	/* java_name */
	.ascii	"java/lang/reflect/TypeVariable"
	.zero	45

	/* #159 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554769
	/* java_name */
	.ascii	"java/net/InetSocketAddress"
	.zero	49

	/* #160 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554770
	/* java_name */
	.ascii	"java/net/Proxy"
	.zero	61

	/* #161 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554771
	/* java_name */
	.ascii	"java/net/ProxySelector"
	.zero	53

	/* #162 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554773
	/* java_name */
	.ascii	"java/net/SocketAddress"
	.zero	53

	/* #163 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554775
	/* java_name */
	.ascii	"java/net/URI"
	.zero	63

	/* #164 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554790
	/* java_name */
	.ascii	"java/nio/Buffer"
	.zero	60

	/* #165 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554792
	/* java_name */
	.ascii	"java/nio/ByteBuffer"
	.zero	56

	/* #166 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554797
	/* java_name */
	.ascii	"java/nio/channels/ByteChannel"
	.zero	46

	/* #167 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554799
	/* java_name */
	.ascii	"java/nio/channels/Channel"
	.zero	50

	/* #168 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554794
	/* java_name */
	.ascii	"java/nio/channels/FileChannel"
	.zero	46

	/* #169 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554801
	/* java_name */
	.ascii	"java/nio/channels/GatheringByteChannel"
	.zero	37

	/* #170 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554803
	/* java_name */
	.ascii	"java/nio/channels/InterruptibleChannel"
	.zero	37

	/* #171 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554805
	/* java_name */
	.ascii	"java/nio/channels/ReadableByteChannel"
	.zero	38

	/* #172 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554807
	/* java_name */
	.ascii	"java/nio/channels/ScatteringByteChannel"
	.zero	36

	/* #173 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554809
	/* java_name */
	.ascii	"java/nio/channels/SeekableByteChannel"
	.zero	38

	/* #174 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554811
	/* java_name */
	.ascii	"java/nio/channels/WritableByteChannel"
	.zero	38

	/* #175 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554812
	/* java_name */
	.ascii	"java/nio/channels/spi/AbstractInterruptibleChannel"
	.zero	25

	/* #176 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554778
	/* java_name */
	.ascii	"java/security/KeyStore"
	.zero	53

	/* #177 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554780
	/* java_name */
	.ascii	"java/security/KeyStore$LoadStoreParameter"
	.zero	34

	/* #178 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554782
	/* java_name */
	.ascii	"java/security/KeyStore$ProtectionParameter"
	.zero	33

	/* #179 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554783
	/* java_name */
	.ascii	"java/security/cert/Certificate"
	.zero	45

	/* #180 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554785
	/* java_name */
	.ascii	"java/security/cert/CertificateFactory"
	.zero	38

	/* #181 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554788
	/* java_name */
	.ascii	"java/security/cert/X509Certificate"
	.zero	41

	/* #182 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554787
	/* java_name */
	.ascii	"java/security/cert/X509Extension"
	.zero	43

	/* #183 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554737
	/* java_name */
	.ascii	"java/util/ArrayList"
	.zero	56

	/* #184 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554726
	/* java_name */
	.ascii	"java/util/Collection"
	.zero	55

	/* #185 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554728
	/* java_name */
	.ascii	"java/util/HashMap"
	.zero	58

	/* #186 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554746
	/* java_name */
	.ascii	"java/util/HashSet"
	.zero	58

	/* #187 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554777
	/* java_name */
	.ascii	"java/util/Iterator"
	.zero	57

	/* #188 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554517
	/* java_name */
	.ascii	"javax/net/ssl/TrustManager"
	.zero	49

	/* #189 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554520
	/* java_name */
	.ascii	"javax/net/ssl/TrustManagerFactory"
	.zero	42

	/* #190 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554519
	/* java_name */
	.ascii	"javax/net/ssl/X509TrustManager"
	.zero	45

	/* #191 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554904
	/* java_name */
	.ascii	"mono/android/TypeManager"
	.zero	51

	/* #192 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554722
	/* java_name */
	.ascii	"mono/android/runtime/InputStreamAdapter"
	.zero	36

	/* #193 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	0
	/* java_name */
	.ascii	"mono/android/runtime/JavaArray"
	.zero	45

	/* #194 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554743
	/* java_name */
	.ascii	"mono/android/runtime/JavaObject"
	.zero	44

	/* #195 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554761
	/* java_name */
	.ascii	"mono/android/runtime/OutputStreamAdapter"
	.zero	35

	/* #196 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554531
	/* java_name */
	.ascii	"mono/android/view/View_OnClickListenerImplementor"
	.zero	26

	/* #197 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554831
	/* java_name */
	.ascii	"mono/java/lang/RunnableImplementor"
	.zero	41

	.size	map_java, 16434
/* Java to managed map: END */

