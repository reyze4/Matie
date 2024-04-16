using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfApp1.Model;
using WpfApp1.Pages;

namespace WpfApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        Feed contextProduct;
        public AddEditPage(Feed product)
        {
            InitializeComponent();
            contextProduct = product;
            DataContext = contextProduct;
        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, @"[A-zА-я,]") == false)
            {
                e.Handled = true;
            }
        }

        private void TextBox_PreviewTextInput_1(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, @"[0-9]") == false)
            {
                e.Handled = true;
            }
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            string errorMessage = "";
            if (string.IsNullOrWhiteSpace(contextProduct.Name))
            {
                errorMessage += "Введите название\n";
            }
            if (contextProduct.Price <= 0)
            {
                errorMessage += "Введите корректную цену\n";
            }
            if (string.IsNullOrWhiteSpace(contextProduct.Description))
            {
                errorMessage += "Введите описание \n";
            }
           
            if (string.IsNullOrWhiteSpace(errorMessage) == false)
            {
                MessageBox.Show(errorMessage);
                return;
            }
            if (contextProduct.ID == 0)
            {
                App.DB.Feed.Add(contextProduct);
            }
            contextProduct.DateTime=DateTime.Now;
            App.DB.SaveChanges();
            NavigationService.GoBack();
        }

        private void EditImgBtn_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog();
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                contextProduct.Image = File.ReadAllBytes(dialog.FileName);
                DataContext = null;
                DataContext = contextProduct;
                App.DB.SaveChanges();
            }
        }
    }
}
