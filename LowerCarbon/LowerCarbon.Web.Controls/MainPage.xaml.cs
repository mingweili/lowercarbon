using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Windows.Browser;
using System.Text;
using LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef;

namespace LowerCarbon.Web.Controls
{
    public partial class MainPage : UserControl
    {
        private string username = string.Empty;
        private string password = string.Empty;
        
        public MainPage()
        {
            InitializeComponent();

            // 页面初始化逻辑

            // cookie格式:start=date;end=date

        }

#region tab跳转代码
        // welcome 0
        // house 1
        // airplane 2
        // car  3
        // motorbike 4
        // bus 5
        // secondary 6
        // result 7
        private void gotoHouseBtn_Click(object sender, RoutedEventArgs e)
        {
            // 数据检查，暂时忽略

            // 检查时候选择country，必须必选
            float total = 0;

            
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("total", total);
            this.tabControlCarbonCalculator.SelectedIndex = 1;
        }

        private void gotoWelcomeBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 0;
        }


        private void gotoAirplaneBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 2;
        }

        private void goBackToHouseBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 1;
        }

        private void gotoCarBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 3;
        }

        private void goBackToAirplaneBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 2;
        }

        private void gotoMotorbikeBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 4;
        }

        private void goBackToCarBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 3;
        }

        private void gotoBusBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 5;
        }

        private void goBackToMotorbikeBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 4;
        }

        private void gotoSecondary_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 6;
        }

        private void goBackToBusBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 5;
        }

        private void gotoResiltBtn_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 7;
        }

        private void goBackToSecondary_Click(object sender, RoutedEventArgs e)
        {
            this.tabControlCarbonCalculator.SelectedIndex = 6;
        }
#endregion

#region 页面逻辑代码
        private void savaTimeBtn_Click(object sender, RoutedEventArgs e)
        {
            // 数据写入silverlight的独立存储中
            DateTime start = this.datePickerStart.SelectedDate.Value;
            DateTime end = this.datePickerEnd.SelectedDate.Value;

            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("start", start);
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("end", end);            
        }
#endregion

        private void calculateHousrCarbonBtn_Click(object sender, RoutedEventArgs e)
        {
            // 检查数据是否为空，暂时忽略

            // 开始计算碳排放量，显示
            //int familyMemberNum = int.Parse(this.comboBoxFamilyMemberNum.SelectedItem.ToString());
            double electricityAmount = double.Parse(this.textBoxElectricity.Text);
            double naturalGasAmount = double.Parse(this.textBoxNaturalGas.Text);
            double heatingOilAmount = double.Parse(this.textBoxHeatingOil.Text);
            double coalAmount = double.Parse(this.textBoxCoal.Text);
            // 天然气
            double LPGAmount = double.Parse(this.textBoxLPG.Text);
            double woodenPelletsAmount = double.Parse(this.textBoxWoodenPellets.Text);

            // 逻辑上计算碳排放量
            double total =  electricityAmount * 0.9 + naturalGasAmount + heatingOilAmount +
                coalAmount + LPGAmount + woodenPelletsAmount;

            // 更新 IsolatedStorage中total变量
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("total", total);

            // 更新显示
            this.textBlockHouseResult.Text = "总计房屋碳足迹 = " + total + "吨的二氧化碳";

            // 将房屋的碳排放量保存起来
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("house", total);
        }

        private void comboBoxCountries_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }


        private void buttonCalculateAirPlaneResult_Click(object sender, RoutedEventArgs e)
        {
            // 数据验证

            // 通过计算，显示结果
            string type = this.comboBoxAirPlaneType.SelectedItem.ToString();
            string from = this.comboBoxFrom.SelectedIndex.ToString();
            string to = this.comboBoxTo.SelectedIndex.ToString();
            string airPlaneClass = this.comboBoxClass.SelectedIndex.ToString();

            // 更新 IsolatedStorage中total变量
            // 需要更新成真正的数据
            double airPlaneTotal = 10 ;

            string str = IsolatedStorageSettingsHelper.ReadSetting("total");
            double total = airPlaneTotal + 
                double.Parse((str == null) ? "0.0": str);
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("total", total);

            // 显示给用户
            this.textBlockCalculateAirPlaneResult.Text = "总计航班 足迹 = " + airPlaneTotal + "吨的二氧化碳";

            // 保存当前值
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("airplane", airPlaneTotal);
        }

        private void buttonCalculateCarCarbon_Click(object sender, RoutedEventArgs e)
        {
            // 数据验证

            // 通过计算，显示结果
            string miles = this.textBoxCarMiles.Text;
            string efficiency = this.textBoxCarEfficiency.Text;

            double carTotal = double.Parse(miles) * 0.5;

            string str = IsolatedStorageSettingsHelper.ReadSetting("total");
            double total = carTotal +
                double.Parse((str == null) ? "0.0" : str);
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("total", total);

            // 显示
            this.textBlockCalculateCarResult.Text = "总计自驾车碳足迹= " + carTotal + "吨的二氧化碳";

            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("car", carTotal);
        }

        private void buttonCalculatorMotorbike_Click(object sender, RoutedEventArgs e)
        {
            // 数据验证

            // 通过计算，显示结果
            string miles = this.textBoxMotorbikeMile.Text;
            string efficiency = this.textBoxMotorbikeEfficiency.Text;

            double motorbikeTotal = double.Parse(miles) *  0.5;

            string str = IsolatedStorageSettingsHelper.ReadSetting("total");
            double total = motorbikeTotal +
                double.Parse((str == null) ? "0.0" : str);
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("total", total);

            // 显示
            this.textBlockMotorbikeCarbonResult.Text = "总计摩托车碳足迹= " + motorbikeTotal + "吨的二氧化碳";

            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("motorbike", motorbikeTotal);

        }

        private void buttonCalculateBusAndRail_Click(object sender, RoutedEventArgs e)
        {
            // 数据验证

            // 通过计算，显示结果
            string bus = this.textBoxBus.Text;  // 巴士
            string coach = this.textBoxCoach.Text;  // 长途客车
            string nationalRail = this.textBoxNationalRail.Text;    // 国内铁路
            // 国际铁路
            string internationalRail = this.textBoxInternationalRail.Text;
            string tram = this.textBoxTram.Text;    // 有轨电车
            string tube = this.textBoxTube.Text;    // 地铁
            string taxi = this.textBoxTaxi.Text;

            Random r = new Random();
            double busTotal = double.Parse(bus) + 
                double.Parse(coach) + 
                double.Parse(nationalRail) + r.Next() % 10;

            string str = IsolatedStorageSettingsHelper.ReadSetting("total");
            double total = busTotal +
                double.Parse((str == null) ? "0.0" : str);
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("total", total);

            // 显示
            this.textBlockCalculateBusCarbonResult.Text = "总计摩托车碳足迹= " + busTotal + "吨的二氧化碳";

            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("bus", busTotal);
        }

        private void buttonCalculateSecondary_Click(object sender, RoutedEventArgs e)
        {
            // 食物偏好
            string foodPreferences = this.comboBoxFoodPreferences.SelectedItem.ToString();
            // 有机产品
            string organicProduce = this.comboBoxOrganicProduce.SelectedItem.ToString();
            // 包装
            string packaging = this.comboBoxPackaging.SelectedItem.ToString();
            // 家电产品使用寿命
            string electricals = this.comboBoxElectricals.SelectedItem.ToString();
            // 循环使用
            string recycling = this.comboBoxRecycling.SelectedItem.ToString();
            // 轿车使用
            string carManufacture = this.comboBoxCarManufacture.SelectedItem.ToString();

            Random r = new Random();
            double secondaryTotal = r.Next() % 10 + 5;

            string str = IsolatedStorageSettingsHelper.ReadSetting("total");
            double total = secondaryTotal +
                double.Parse((str == null) ? "0.0" : str);
            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("total", total);

            // 显示
            this.textBlockCalculateSecondaryCarbonResult.Text = "总计摩托车碳足迹= " + secondaryTotal + "吨的二氧化碳";

            IsolatedStorageSettingsHelper.UpdateLocalStorageObject("secondary", secondaryTotal);
        }

        /// <summary>
        /// 每当tabitem加载完成之后出发这个事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tabItemResult_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateCarbonCalculatorResult(); 
        }

        private void tabControlCarbonCalculator_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
            if((this.tabItemResult != null) && (this.tabItemResult.IsSelected)) 
            {
                UpdateCarbonCalculatorResult();
            }
        }

        private void UpdateCarbonCalculatorResult()
        {
            // 查询是否存在数据，存在的话显示，下面的值可能为空
            string house = IsolatedStorageSettingsHelper.ReadSetting("house");
            string airplane = IsolatedStorageSettingsHelper.ReadSetting("airplane");
            string car = IsolatedStorageSettingsHelper.ReadSetting("car");
            string motorbike = IsolatedStorageSettingsHelper.ReadSetting("motorbike");
            string bus = IsolatedStorageSettingsHelper.ReadSetting("bus");
            string secondary = IsolatedStorageSettingsHelper.ReadSetting("secondary");


            StringBuilder resultBuilder = new StringBuilder();
            double houseCarbonAmount = ((house == null) ? 0.0 : double.Parse(house));
            resultBuilder.Append("家庭碳排放量:" + houseCarbonAmount + "\n");
            double airplaneCarbonAmount = ((airplane == null) ? 0.0 : double.Parse(airplane));
            resultBuilder.Append("航班碳排放量:" + airplaneCarbonAmount + "\n");
            double carCarbonAmount = ((car == null) ? 0.0 : double.Parse(car));
            resultBuilder.Append("私家车碳排放量:" + carCarbonAmount + "\n");
            double motorbikeCarbonAmount =
                ((motorbike == null) ? 0.0 : double.Parse(motorbike));
            resultBuilder.Append("摩托车碳排放量:" + motorbikeCarbonAmount + "\n");
            double busCarbonAmount = ((bus == null) ? 0.0 : double.Parse(bus));
            resultBuilder.Append("巴士和火车碳排放量:" + busCarbonAmount + "\n");
            double secondaryCarbonAmount =
                ((secondary == null) ? 0.0 : double.Parse(secondary));
            resultBuilder.Append("间接碳排放量:" + secondaryCarbonAmount + "\n");

            resultBuilder.Append("总计碳排放量:" +
                (houseCarbonAmount +
                airplaneCarbonAmount +
                carCarbonAmount +
                motorbikeCarbonAmount +
                busCarbonAmount +
                secondaryCarbonAmount));

            this.textBoxResult.Text = resultBuilder.ToString();
        }

        private void hyperlinkButtonClearCarbonTrace_Click(object sender, RoutedEventArgs e)
        {
            IsolatedStorageSettingsHelper.ClearSettings();

            UpdateCarbonCalculatorResult();

            HtmlPage.Window.Alert("清除数据成功!");
        }


        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            // 隐藏控件
            
            this.LoginUserNameLbl.Visibility = Visibility.Collapsed;

            LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorServiceClient client =
                new LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorServiceClient();

            client.GetSessionVariableCompleted +=
                new EventHandler<LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.GetSessionVariableCompletedEventArgs>(client_GetSessionVariableCompleted);
            client.GetSessionVariableAsync("username");
        }

        void client_GetSessionVariableCompleted(object sender, LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.GetSessionVariableCompletedEventArgs e)
        {
            if (e.Result == null)
            {
                // 当前用户没有登陆的话，直接不显示保存按钮
            }
            else
            {
                // 当前用户已经登陆
                // 保存用户配置，显示保存按钮
                this.username = e.Result.ToString();
                
                this.LoginUserNameLbl.Visibility = Visibility.Visible;
                this.LoginUserNameLbl.Content = e.Result.ToString() + "，你好：";
            }
        }

        /// <summary>
        /// 将用户信息保存到数据库中
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void saveLoginedUserCarbonBtn_Click(object sender, RoutedEventArgs e)
        {
            double total = double.Parse(IsolatedStorageSettingsHelper.ReadSetting("total").ToString());

            LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorServiceClient client =
               new LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorServiceClient();

         
            // 如果保存成功
           
        
             }

        /* 删除回调函数
        void client_SaveCarbonResultCompleted(object sender,  EventArgs e)
        {
            if ( == null)
            {
                // 当前用户没有登陆的话，直接不显示保存按钮
            }
            else
            {
                // 当前用户已经登陆
                // 保存用户配置，显示保存按钮
                this.saveLoginedUserCarbonBtn.Visibility = Visibility.Visible;
                this.LoginUserNameLbl.Visibility = Visibility.Visible;
                this.LoginUserNameLbl.Content = e.Result.ToString() + "，你好：";
            }
        }*/

    }
}
