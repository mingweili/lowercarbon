using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.IO.IsolatedStorage;

namespace LowerCarbon.Web.Controls
{
    public class IsolatedStorageSettingsHelper
    {
        public static void UpdateLocalStorageObject(string key, object value)
        {
            if (IsolatedStorageSettings.ApplicationSettings.Contains(key))
                IsolatedStorageSettings.ApplicationSettings[key] = value;
            else
                IsolatedStorageSettings.ApplicationSettings.Add(key, value);

            IsolatedStorageSettings.ApplicationSettings.Save();
        }

        public static string ReadSetting(string key)
        {
            try
            {
                return IsolatedStorageSettings.ApplicationSettings[key].ToString();
            }
            catch (System.Collections.Generic.KeyNotFoundException ex)
            {
                return null;
            }
        }

        public static void ClearSettings() 
        {
            IsolatedStorageSettings settings =
               IsolatedStorageSettings.ApplicationSettings;
            settings.Clear();
        }
    }
}
