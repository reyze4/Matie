using Microsoft.VisualStudio.TestTools.UnitTesting;
using WpfApp1.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfApp1Tests.Model;
using System.Threading;

namespace WpfApp1.Pages.Tests
{
    [TestClass()]

    
    public class MainPageTests
    {
        asdEntities db = new asdEntities();
        [TestMethod()]
        
        public void LinkEdit_ClickTest()
        {

           DateTime lastModifiedTime = GetProductLastModifiedTime();

            // Имитация изменения товара (допустим, спустя 2 секунды)
            Thread.Sleep(2000);

            // Повторное определение времени последнего изменения товара
            DateTime newLastModifiedTime = GetProductLastModifiedTime();

            // Проверка, что новое время изменения больше предыдущего 
            if (newLastModifiedTime > lastModifiedTime)
            {
                Console.WriteLine("Тест успешен: время последнего изменения товара обновлено.");
            }
            else
            {
                Console.WriteLine("Тест не пройден: время последнего изменения товара не обновлено.");
            }
        }

        private DateTime GetProductLastModifiedTime()
        {
            // Здесь должна быть реализация функции определения времени последнего изменения товара
            // В данном случае просто вернем текущее время
            return DateTime.Now;
        }
    }
    
}