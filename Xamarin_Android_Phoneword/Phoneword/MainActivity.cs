using Android.App;
using Android.Content;
using Android.OS;
using Android.Telephony;
using Android.Widget;
using Newtonsoft.Json.Linq;

namespace Phoneword
{
    [Activity(Label = "Phone Word", MainLauncher = true, Icon = "@drawable/icon")]
    public class MainActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Main);

            //创建电话监听器
            TelephonyManager tm = (TelephonyManager)GetSystemService(Context.TelephonyService);
            tm.Listen(new MeBootReceiver(), PhoneStateListenerFlags.CallState);
            //加载Xamarin.Essentials
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            //Get our UI controls from the loaded layout
            EditText PhoneNumberText = FindViewById<EditText>(Resource.Id.PhoneNumberText);//企业账号
            EditText editText1 = FindViewById<EditText>(Resource.Id.editText1);//用户名
            EditText editText2 = FindViewById<EditText>(Resource.Id.editText2);//密码
            Button translateButton = FindViewById<Button>(Resource.Id.TranslateButton);


            //启动前台服务
            if (Build.VERSION.SdkInt >= BuildVersionCodes.O)
            {
                StartForegroundService(new Intent(this, typeof(ForegroundService)));
            }
            else
            {
                StartService(new Intent(this, typeof(ForegroundService)));
            }

            //Intent downloadIntent = new Intent(this, typeof(ForegroundService));

            // Add code to translate number
            string translatedNumber = string.Empty;

            translateButton.Click += (sender, e) =>
            {

                JObject data = ApiSwap.login(editText1.Text, editText2.Text, PhoneNumberText.Text);
                
                ISharedPreferences sp = GetSharedPreferences("abc", FileCreationMode.Append);
                ISharedPreferencesEditor editor = sp.Edit();
                editor.PutInt("BookId", 1);
                editor.PutString("BookName", "C#6.0入门");
                editor.PutFloat("BookPrice", 58.7f);
                editor.Apply();

                // Translate user’s alphanumeric phone number to numeric
                //translatedNumber = PhonewordTranslator.ToNumber(phoneNumberText.Text);
                //if (string.IsNullOrWhiteSpace(translatedNumber))
                //{
                //    translatedPhoneWord.Text = string.Empty;
                //}
                //else
                //{
                //    translatedPhoneWord.Text = translatedNumber;
                //}
            };
        }
    }
}