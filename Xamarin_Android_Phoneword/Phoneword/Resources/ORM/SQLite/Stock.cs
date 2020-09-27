using SQLite;

namespace Phoneword.Resources.ORM.OrmRelation
{
    /// <summary>
    /// 通话表单记录
    /// </summary>
    [Table("Items")]
    public class Stock
    {
        /// <summary>
        /// Id 
        /// </summary>
        [PrimaryKey, Column("_id")]
        public int Id { get; set; }

        /// <summary>
        /// 通话类型
        /// </summary>
        public string Yype { get; set; }

        /// <summary>
        /// 目标号码
        /// </summary>
        public string Number { get; set; }

        /// <summary>
        /// 用户工号
        /// </summary>
        public string ExtNo { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// 记录时间
        /// </summary>
        public string Datetime { get; set; }

        /// <summary>
        /// 文件上传状态
        /// </summary>
        public bool FileState { get; set; }

        /// <summary>
        /// 表单上传状态
        /// </summary>
        public bool FormState { get; set; }

    }

    /// <summary>
    /// 临时表用来记录用户是否拨号
    /// </summary>
    public class Temporary
    {
        public int id { get; set; }

        public string message { get; set; }

        public string time { get; set; }
    }
}