//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp1Tests.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Administrator
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public Nullable<int> FeedID { get; set; }
    
        public virtual Feed Feed { get; set; }
    }
}
