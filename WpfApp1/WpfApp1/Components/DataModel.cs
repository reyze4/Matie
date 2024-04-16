using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApp1
{
    public class DataModel
    {
            private DateTime lastModified;

            public DataModel()
            {
                lastModified = DateTime.Now;
            }

            public DateTime LastModified
            {
                get { return lastModified; }
            }

            public void UpdateData()
            {
                // Логика обновления данных
                lastModified = DateTime.Now;
            } 
    }
}
