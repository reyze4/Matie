﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    /// Логика взаимодействия для RegPage.xaml
    /// </summary>
    public partial class RegPage : Page
    {
        public RegPage()
        {
            InitializeComponent();
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            if (TbLogin.Text.Trim().Length <= 0 || PbPassword.Password.Trim().Length <= 0)
            {
                MessageBox.Show("Заполните все поля!");
            }
            else
            {
                App.LoggedUser = App.DB.User.ToList().Find(x => x.Name == TbLogin.Text);
                if (App.LoggedUser != null)
                {
                    MessageBox.Show("Такой логин уже существует!");
                }
                else
                {
                    App.DB.User.Add(new User()
                    {
                        Name = TbLogin.Text.Trim(),
                        Password = PbPassword.Password.Trim(),
                    });
                    App.DB.SaveChanges();
                    NavigationService.Navigate(new AuthPage());
                }

            }
        }

        private void BtnRegFinish_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
