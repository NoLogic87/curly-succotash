using Android;
using Android.App;
using Android.Content;
using Android.Net;
using Android.OS;
using Android.Runtime;
using Android.Telephony;
using Android.Util;
using Android.Widget;
using SQLite;
using System.Collections.Generic;
using System.IO;
using Xamarin.Essentials;
using SEnvironment = System.Environment;
using Environment = Android.OS.Environment;
using Phoneword.Resources.ORM.OrmRelation;
using NetworkAccess = Xamarin.Essentials.NetworkAccess;
using System.Collections.Specialized;
using System;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;

namespace Phoneword
{
    /// <summary>
    /// 网络状态变更
    /// </summary>
    [BroadcastReceiver(Enabled = true, Exported = false)]
    [IntentFilter(new[] { "android.net.conn.CONNECTIVITY_CHANGE" })]
    public class NetChangedReceiver : BroadcastReceiver
    {
        public ConnectivityManager ConnectivityManager { get; set; }

        public override void OnReceive(Context context, Intent intent)
        {
            NetworkInfo networkInfo = ConnectivityManager.ActiveNetworkInfo;
            if (networkInfo != null && networkInfo.IsAvailable)
                Toast.MakeText(context, "网络状态有效", ToastLength.Short).Show();//信息弹出
            else
                Toast.MakeText(context, "网络状态无效", ToastLength.Short).Show();
        }
    }

    /// <summary>
    /// 用户呼出事件
    /// </summary>
    [BroadcastReceiver(Enabled = true)]
    [IntentFilter(new[] { Intent.ActionNewOutgoingCall})]
    public class MyBootReceiver : BroadcastReceiver
    {
        private string Type { get; set; }
        public override void OnReceive(Context context, Intent intent)
        {
            string dbPath = Path.Combine(SEnvironment.GetFolderPath(SEnvironment.SpecialFolder.Personal), "SQLite.db3");//得到程序内部储存路径
            SQLiteConnection db = new SQLiteConnection(dbPath);
            db.CreateTable<Temporary>();//创建表
            Temporary newTemporary = new Temporary
            { 
                id=0,
                message="用户呼出",
                time=DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
            };
            
            db.Insert(newTemporary);
            
            if (intent.Action == "android.intent.action.NEW_OUTGOING_CALL")
            {
                Type = "用户拨打号码";
            }
            else
            {
                Type = "已监听到通话类型变更";
            }
            Toast.MakeText(context, Type, ToastLength.Short).Show();//信息弹出
        }
    }

    /// <summary>
    /// 前台进程服务
    /// </summary>
    [Service]
    public class ForegroundService : Service
    {
        // Magical code that makes the service do wonderful things.
        public override IBinder OnBind(Intent intent)
        {
            return null;
        }

        public override void OnCreate()
        {
            base.OnCreate();
            Log.Debug("xamarin", "创建服务");
        }

        /// <summary>
        /// 申明前台服务
        /// </summary>
        /// <param name="intent"></param>
        /// <param name="flags"></param>
        /// <param name="startId"></param>
        /// <returns></returns>
        public const int SERVICE_RUNNING_NOTIFICATION_ID = 10000;
        public override StartCommandResult OnStartCommand(Intent intent, StartCommandFlags flags, int startId)
        {
            CreateNotificationChannel();//创建通知通道
            NotificationManager notificationManager = 
                GetSystemService(Context.NotificationService) as NotificationManager;
            var notification = new Notification.Builder(this, "Pre通知通道1")
            .SetContentTitle(Resources.GetString(Resource.String.app_name))
            .SetContentText("正在监听通话事件,请不要关闭本软件")
            .SetSmallIcon(Resource.Drawable.notification_bg)
            .SetOngoing(true)
            .Build();

            StartForeground(SERVICE_RUNNING_NOTIFICATION_ID, notification);
            notificationManager.Notify(SERVICE_RUNNING_NOTIFICATION_ID, notification);
            //android.permission.ACCESS_COARSE_LOCATION
            Authority();
            return StartCommandResult.Sticky;
        }

        /// <summary>
        /// 权限处理
        /// </summary>
        public async void Authority()
        {
            var status = await Permissions.CheckStatusAsync<ReadWriteStoragePermission>();
            //var status = await Permissions.CheckStatusAsync<Permissions.LocationWhenInUse>();
            await Permissions.RequestAsync<ReadWriteStoragePermission>();
        }

        public override void OnDestroy()
        {
            base.OnDestroy();
            Log.Debug("xamarin", "关闭服务");
        }
        /// <summary>
        /// 创建通知通道
        /// </summary>
        void CreateNotificationChannel()
        {
            if (Build.VERSION.SdkInt < BuildVersionCodes.O)
            {
                // Notification channels are new in API 26 (and not a part of the
                // support library). There is no need to create a notification
                // channel on older versions of Android.
                return;
            }
            var channelName = Resources.GetString(Resource.String.app_name);
            var channelDescription = GetString(Resource.String.channelDescription);
            var channel = new NotificationChannel("Pre通知通道1", channelName, NotificationImportance.Default)
            {
                Description = channelDescription
            };

            var notificationManager = (NotificationManager)GetSystemService(NotificationService);
            notificationManager.CreateNotificationChannel(channel);
        }
    }

    /// <summary>
    /// 自定义权限请求
    /// </summary>
    public class ReadWriteStoragePermission : Permissions.BasePlatformPermission
    {
        public override (string androidPermission, bool isRuntime)[] RequiredPermissions => new List<(string androidPermission, bool isRuntime)>
        {
            (Manifest.Permission.ReadPhoneState, true),
            (Manifest.Permission.ProcessOutgoingCalls, true),
            (Manifest.Permission.CallPhone, true),
            (Manifest.Permission.ReadExternalStorage, true),
            (Manifest.Permission.WriteExternalStorage, true),
            (Manifest.Permission.ReadCallLog, true),
            (Manifest.Permission.AccessNetworkState, true),
            (Manifest.Permission.AnswerPhoneCalls, true),
            (Manifest.Permission.ForegroundService, true),
        }.ToArray();
    }

    //通话监听器
    public class MeBootReceiver : PhoneStateListener
    {
        public override void OnCallStateChanged([GeneratedEnum] CallState state, string phoneNumber)
        {
            string data = state.ToString().ToUpper();

            if (data == TelephonyManager.ExtraStateIdle)
            {
                string sre = Aren(phoneNumber);
                //闲置
                //SaveCountAsync(28);
                ////通话结束  
                //string path = Flier();
                //var backingFile = Path.Combine(Xamarin.Essentials.FileSystem.AppDataDirectory, "wwise_cfg.txt");
                //var reader = new StreamReader(backingFile, true);

                //string text = System.IO.File.ReadAllText(backingFile);//文件内容
                //FileInfo fi = new FileInfo(backingFile);//得到文件对象
                //string date1 = fi.CreationTime.ToString();//文件创建时间
                //string date2 = fi.LastWriteTime.ToString();//文件写入时间
                //string date3 = fi.LastAccessTime.ToString();//文件访问时间
                //string date4 = fi.LastWriteTime.ToString();//文件上次修改时间
            }
            else if (data == TelephonyManager.ExtraStateOffhook)
            {
                //震铃
            }
            else if (data == TelephonyManager.ExtraStateRinging)
            {

            }
            base.OnCallStateChanged(state, phoneNumber);
        }

        /// <summary>
        /// 挂机事件处理
        /// </summary>
        /// <param name="phoneNumber">通话号码</param>
        /// <returns></returns>
        public string Aren(string phoneNumber)
        {
            string fern = Environment.ExternalStorageState;//外部储存状态
            _ = Environment.MediaMountedReadOnly.Equals(Environment.ExternalStorageState);
            _ = Environment.MediaMounted.Equals(Environment.ExternalStorageState);

            var status = Permissions.CheckStatusAsync<ReadWriteStoragePermission>();
            if (fern != Environment.MediaMounted)
                return "";
            //表示媒体已经装载可以使用
            string path = ApiSwap.Flier();
            DirectoryInfo root = new DirectoryInfo(path);
            FileInfo[] files = null;
            try
            {
                files = root.GetFiles();
            }
            catch
            {
                return "媒体文件读取错误";
            }
            string dbPath = Path.Combine(SEnvironment.GetFolderPath(SEnvironment.SpecialFolder.Personal), "SQLite.db3");//得到程序内部储存路径
            SQLiteConnection db = new SQLiteConnection(dbPath);//实例化数据库
            db.CreateTable<Stock>();//创建表
            db.CreateTable<Temporary>();//创建表
            foreach (var arr in files)
            {
                DateTime date4 = arr.LastWriteTime;//文件上次修改时间
                TimeSpan time = DateTime.Now.Subtract(date4);//时间差
                string Name = arr.Name;
                if (time.TotalMinutes < 2 && Name.Contains(phoneNumber))
                {
                    string ype = "呼出类型";
                    List<Temporary> newTemporary = db.Table<Temporary>().ToList();
                    if (newTemporary.Count > 0)
                        ype = "呼出类型";
                    db.DeleteAll<Temporary>();
                    var newStock = new Stock
                    {
                        Number = phoneNumber,
                        ExtNo = "100",
                        Yype=ype,
                        FileName = Name,
                        Datetime = DateTime.Now.ToString(),
                        FileState=false,
                        FormState=false,
                    };
                    db.Insert(newStock);
                }
            }
            UploadingTemporary();
            return "";
        }


        /// <summary>
        /// 表单上传
        /// </summary>
        /// <returns></returns>
        public string UploadingTemporary()
        {
            var current = Connectivity.NetworkAccess;//得到当前网络状态
            if (current != NetworkAccess.Internet)
                return "";
            string dbPath = Path.Combine(SEnvironment.GetFolderPath(SEnvironment.SpecialFolder.Personal), "SQLite.db3");//得到程序内部储存路径
            SQLiteConnection db = new SQLiteConnection(dbPath);//实例化数据库
            List<Stock> stockList = db.Table<Stock>().Where(it => it.FileState == false && it.FormState == false).ToList();
            foreach (var arr in stockList)
            {
                string guid = Guid.NewGuid().ToString("N");
                string key = ApiSwap.CreatMD5($"M=2001&GUIDKEY={guid}");
                string SubFun = "1";//上传还是更新
                string BusId = "10000";//登陆返回的 EnterpriseID
                string AgentID = "user";//登陆名称
                string TeleNumber = arr.Number;//通话号码
                string VoiceUri = arr.FileName;//文件名称
                int TalkType = "呼入类型" == "呼入类型" ? 1 : 2;
                string StartTime = arr.Datetime;//开始时间,这边随便给
                string StopTime = arr.Datetime;//结束时间
                string VocId = guid;//录音ID
                string CallResult = "0";
                JObject crr = ApiSwap.login("user", "user123", "");
                JObject Data = new JObject
                {
                    { "SubFun",SubFun},
                    { "BusId",BusId},
                    { "AgentID",AgentID},
                    { "TeleNumber",TeleNumber},
                    { "VoiceUri",VoiceUri},
                    { "TalkType",TalkType},
                    { "StartTime",StartTime},
                    { "StopTime",StopTime},
                    { "VocId",VocId},
                    { "CallResult",CallResult}
                };

                JObject @object = new JObject
                {
                   {"M",2014},
                   { "EnterpriseID", ""},
                   { "UserAccount","user"},
                   { "Edition","5"},
                   { "GUIDKEY",guid},
                   { "LoginKey",crr["LoginKey"].ToString()},
                   { "KEY",key},
                   { "Data",Data.ToString()}
                };
                JObject brr = ApiSwap.ApiCall(@object);
                if (brr["State"].ToString() == "1000")
                {
                    arr.FormState = true;
                }
            }
            return "";
        }

        /// <summary>
        /// 文件上传
        /// </summary>
        /// <returns></returns>
        public string Uploading()
        {
            var current = Connectivity.NetworkAccess;//得到当前网络状态
            if (current != NetworkAccess.Internet)
                return "";
            string dbPath = Path.Combine(SEnvironment.GetFolderPath(SEnvironment.SpecialFolder.Personal), "SQLite.db3");//得到程序内部储存路径
            SQLiteConnection db = new SQLiteConnection(dbPath);//实例化数据库
            List<Stock> stockList = db.Table<Stock>().Where(it => it.FileState == false && it.FormState == true).ToList();

            ApiSwap api = new ApiSwap();
            foreach (var arr in stockList)
            {
                string filePath = $"{ApiSwap.Flier()}/{arr.FileName}";
                string guid = Guid.NewGuid().ToString("N");
                string key = ApiSwap.CreatMD5($"M=2001&GUIDKEY={guid}");
                FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                string BlockData = api.FileToBase64String(fs);
                FileInfo fileInfo = new FileInfo(filePath);
                string FileName = fileInfo.Name;
                string Position = "0";
                string BlockSize = fileInfo.Length.ToString();
                string IsLastBlock = "1";
                JObject Data = new JObject
                {
                    { "FileName",FileName},
                    { "Position",Position},
                    { "StartTime",DateTime.Now.ToString("yyyyMMdd")},
                    { "BlockSize",BlockSize},
                    { "IsLastBlock",IsLastBlock},
                    { "BlockData",BlockData}
                };
                JObject crr = ApiSwap.login("admin", "admin", "");

                JObject @object = new JObject
                {
                        {"M",2015},
                        { "EnterpriseID", ""},
                        { "UserAccount","user"},
                        { "Edition","5"},
                        { "GUIDKEY",guid},
                        { "LoginKey",crr["LoginKey"].ToString()},
                        { "KEY",key},
                        { "Data",Data.ToString()}
                };
                JObject brr = ApiSwap.ApiCall(@object);
            }
            return "";
        }
    }
}