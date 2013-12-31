using System;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;

namespace LowerCarbon.Web
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class LoginUserCarbonCalculatorService
    {
        [OperationContract]
        public object GetSessionVariable(string key)
        {
            return System.Web.HttpContext.Current.Session[key];
        }
    }
}
