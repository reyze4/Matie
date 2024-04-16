using System;
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
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();
            if (maxPage * 5 < App.DB.Feed.Where(x => x.IsDelete != true).Count())
                maxPage += 1;
            TbCounter.Text = App.DB.Feed.Where(x => x.IsDelete != true).Count().ToString();
            Update();
            LblPages.Content = $"{fakePage}/{maxPage}";
            Update();

        }
        int numberPage = 0;
        int count = 5;
        int maxPage = App.DB.Feed.Where(x => x.IsDelete != true).Count() / 5;
        int fakePage = 1;
        int ButtonPage;

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEditPage(new Feed()));
        }

        private void Update()
        {
            if (fakePage > maxPage)
            {
                fakePage = maxPage;
            }

            IEnumerable<Feed> partsList = App.DB.Feed.Where(x => x.IsDelete != true);
            if(FilterCB.SelectedIndex==1)
            {
                partsList=partsList.OrderBy(x=>x.Name);
            }
            partsList = partsList.Skip(count * numberPage).Take(count);
            KormDG.ItemsSource = partsList; /*алан пидорас и булат*/
        }

        private void GeneratePageNumbers()
        {
            SPanelPages.Children.Clear();
            for (int i = 1; i <= maxPage; i++)
            {
                ButtonPage = i;
                Button btn = new Button();
                btn.Content = i;
                btn.Width = 28;
                btn.Margin = new Thickness(10, 0, 0, 0);
                btn.Click += PageButton_Click;
                SPanelPages.Children.Add(btn);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Update();
            GeneratePageNumbers();
        }

        private void BtnLastPage_Click(object sender, RoutedEventArgs e)
        {
            numberPage = maxPage - 1;
            fakePage = maxPage;
            Update();
            LblPages.Content = $"{fakePage}/{maxPage}";
        }

        private void BtnNextPage_Click(object sender, RoutedEventArgs e)
        {
            numberPage++;
            fakePage++;
            if (numberPage == maxPage)
            {
                numberPage = maxPage - 1;
                fakePage--;
            }

            if (fakePage < maxPage + 1)
            {
                Update();

                LblPages.Content = $"{fakePage}/{maxPage}";
            }
        }

        private void BtnPreviousPage_Click(object sender, RoutedEventArgs e)
        {
            numberPage--;
            fakePage--;
            if (numberPage < 0)
                numberPage = 0;
            if (fakePage < 1)
                fakePage = 1;
            Update();

            LblPages.Content = $"{fakePage}/{maxPage}";
        }

        private void BtnFirstPage_Click(object sender, RoutedEventArgs e)
        {
            numberPage = 0;
            Update();
            fakePage = 1;
            LblPages.Content = $"{fakePage}/{maxPage}";
        }

        public void LinkEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedItem = (sender as Hyperlink).DataContext as Feed;
            NavigationService.Navigate(new AddEditPage(selectedItem));
        }

        private void LinkDelete_Click(object sender, RoutedEventArgs e)
        {
            var selectedItem = (sender as Hyperlink).DataContext as Feed;
            selectedItem.IsDelete = true;
            App.DB.SaveChanges();
        }

        private void PageButton_Click(object sender, RoutedEventArgs e)
        {
            var b = sender as Button;
            string c = b.Content.ToString();
            int a = int.Parse(c) -1;
            numberPage = a;

            Update();
            LblPages.Content = $"{fakePage}/{maxPage}";

        }

        private void FilterCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
    }
}
