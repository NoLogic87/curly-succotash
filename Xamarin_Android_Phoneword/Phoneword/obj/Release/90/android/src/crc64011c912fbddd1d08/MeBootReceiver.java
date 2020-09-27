package crc64011c912fbddd1d08;


public class MeBootReceiver
	extends android.telephony.PhoneStateListener
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onCallStateChanged:(ILjava/lang/String;)V:GetOnCallStateChanged_ILjava_lang_String_Handler\n" +
			"";
		mono.android.Runtime.register ("Phoneword.MeBootReceiver, Phoneword", MeBootReceiver.class, __md_methods);
	}


	public MeBootReceiver ()
	{
		super ();
		if (getClass () == MeBootReceiver.class)
			mono.android.TypeManager.Activate ("Phoneword.MeBootReceiver, Phoneword", "", this, new java.lang.Object[] {  });
	}


	public void onCallStateChanged (int p0, java.lang.String p1)
	{
		n_onCallStateChanged (p0, p1);
	}

	private native void n_onCallStateChanged (int p0, java.lang.String p1);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
