﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.1
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This code was auto-generated by Microsoft.Silverlight.ServiceReference, version 3.0.40818.0
// 
namespace LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="", ConfigurationName="LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService")]
    public interface LoginUserCarbonCalculatorService {
        
        [System.ServiceModel.OperationContractAttribute(AsyncPattern=true, Action="urn:LoginUserCarbonCalculatorService/GetSessionVariable", ReplyAction="urn:LoginUserCarbonCalculatorService/GetSessionVariableResponse")]
        System.IAsyncResult BeginGetSessionVariable(string key, System.AsyncCallback callback, object asyncState);
        
        object EndGetSessionVariable(System.IAsyncResult result);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface LoginUserCarbonCalculatorServiceChannel : LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class GetSessionVariableCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        public GetSessionVariableCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        public object Result {
            get {
                base.RaiseExceptionIfNecessary();
                return ((object)(this.results[0]));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class LoginUserCarbonCalculatorServiceClient : System.ServiceModel.ClientBase<LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService>, LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService {
        
        private BeginOperationDelegate onBeginGetSessionVariableDelegate;
        
        private EndOperationDelegate onEndGetSessionVariableDelegate;
        
        private System.Threading.SendOrPostCallback onGetSessionVariableCompletedDelegate;
        
        private BeginOperationDelegate onBeginOpenDelegate;
        
        private EndOperationDelegate onEndOpenDelegate;
        
        private System.Threading.SendOrPostCallback onOpenCompletedDelegate;
        
        private BeginOperationDelegate onBeginCloseDelegate;
        
        private EndOperationDelegate onEndCloseDelegate;
        
        private System.Threading.SendOrPostCallback onCloseCompletedDelegate;
        
        public LoginUserCarbonCalculatorServiceClient() {
        }
        
        public LoginUserCarbonCalculatorServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public LoginUserCarbonCalculatorServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public LoginUserCarbonCalculatorServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public LoginUserCarbonCalculatorServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Net.CookieContainer CookieContainer {
            get {
                System.ServiceModel.Channels.IHttpCookieContainerManager httpCookieContainerManager = this.InnerChannel.GetProperty<System.ServiceModel.Channels.IHttpCookieContainerManager>();
                if ((httpCookieContainerManager != null)) {
                    return httpCookieContainerManager.CookieContainer;
                }
                else {
                    return null;
                }
            }
            set {
                System.ServiceModel.Channels.IHttpCookieContainerManager httpCookieContainerManager = this.InnerChannel.GetProperty<System.ServiceModel.Channels.IHttpCookieContainerManager>();
                if ((httpCookieContainerManager != null)) {
                    httpCookieContainerManager.CookieContainer = value;
                }
                else {
                    throw new System.InvalidOperationException("无法设置 CookieContainer。请确保绑定包含 HttpCookieContainerBindingElement。");
                }
            }
        }
        
        public event System.EventHandler<GetSessionVariableCompletedEventArgs> GetSessionVariableCompleted;
        
        public event System.EventHandler<System.ComponentModel.AsyncCompletedEventArgs> OpenCompleted;
        
        public event System.EventHandler<System.ComponentModel.AsyncCompletedEventArgs> CloseCompleted;
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.IAsyncResult LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService.BeginGetSessionVariable(string key, System.AsyncCallback callback, object asyncState) {
            return base.Channel.BeginGetSessionVariable(key, callback, asyncState);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        object LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService.EndGetSessionVariable(System.IAsyncResult result) {
            return base.Channel.EndGetSessionVariable(result);
        }
        
        private System.IAsyncResult OnBeginGetSessionVariable(object[] inValues, System.AsyncCallback callback, object asyncState) {
            string key = ((string)(inValues[0]));
            return ((LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService)(this)).BeginGetSessionVariable(key, callback, asyncState);
        }
        
        private object[] OnEndGetSessionVariable(System.IAsyncResult result) {
            object retVal = ((LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService)(this)).EndGetSessionVariable(result);
            return new object[] {
                    retVal};
        }
        
        private void OnGetSessionVariableCompleted(object state) {
            if ((this.GetSessionVariableCompleted != null)) {
                InvokeAsyncCompletedEventArgs e = ((InvokeAsyncCompletedEventArgs)(state));
                this.GetSessionVariableCompleted(this, new GetSessionVariableCompletedEventArgs(e.Results, e.Error, e.Cancelled, e.UserState));
            }
        }
        
        public void GetSessionVariableAsync(string key) {
            this.GetSessionVariableAsync(key, null);
        }
        
        public void GetSessionVariableAsync(string key, object userState) {
            if ((this.onBeginGetSessionVariableDelegate == null)) {
                this.onBeginGetSessionVariableDelegate = new BeginOperationDelegate(this.OnBeginGetSessionVariable);
            }
            if ((this.onEndGetSessionVariableDelegate == null)) {
                this.onEndGetSessionVariableDelegate = new EndOperationDelegate(this.OnEndGetSessionVariable);
            }
            if ((this.onGetSessionVariableCompletedDelegate == null)) {
                this.onGetSessionVariableCompletedDelegate = new System.Threading.SendOrPostCallback(this.OnGetSessionVariableCompleted);
            }
            base.InvokeAsync(this.onBeginGetSessionVariableDelegate, new object[] {
                        key}, this.onEndGetSessionVariableDelegate, this.onGetSessionVariableCompletedDelegate, userState);
        }
        
        private System.IAsyncResult OnBeginOpen(object[] inValues, System.AsyncCallback callback, object asyncState) {
            return ((System.ServiceModel.ICommunicationObject)(this)).BeginOpen(callback, asyncState);
        }
        
        private object[] OnEndOpen(System.IAsyncResult result) {
            ((System.ServiceModel.ICommunicationObject)(this)).EndOpen(result);
            return null;
        }
        
        private void OnOpenCompleted(object state) {
            if ((this.OpenCompleted != null)) {
                InvokeAsyncCompletedEventArgs e = ((InvokeAsyncCompletedEventArgs)(state));
                this.OpenCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(e.Error, e.Cancelled, e.UserState));
            }
        }
        
        public void OpenAsync() {
            this.OpenAsync(null);
        }
        
        public void OpenAsync(object userState) {
            if ((this.onBeginOpenDelegate == null)) {
                this.onBeginOpenDelegate = new BeginOperationDelegate(this.OnBeginOpen);
            }
            if ((this.onEndOpenDelegate == null)) {
                this.onEndOpenDelegate = new EndOperationDelegate(this.OnEndOpen);
            }
            if ((this.onOpenCompletedDelegate == null)) {
                this.onOpenCompletedDelegate = new System.Threading.SendOrPostCallback(this.OnOpenCompleted);
            }
            base.InvokeAsync(this.onBeginOpenDelegate, null, this.onEndOpenDelegate, this.onOpenCompletedDelegate, userState);
        }
        
        private System.IAsyncResult OnBeginClose(object[] inValues, System.AsyncCallback callback, object asyncState) {
            return ((System.ServiceModel.ICommunicationObject)(this)).BeginClose(callback, asyncState);
        }
        
        private object[] OnEndClose(System.IAsyncResult result) {
            ((System.ServiceModel.ICommunicationObject)(this)).EndClose(result);
            return null;
        }
        
        private void OnCloseCompleted(object state) {
            if ((this.CloseCompleted != null)) {
                InvokeAsyncCompletedEventArgs e = ((InvokeAsyncCompletedEventArgs)(state));
                this.CloseCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(e.Error, e.Cancelled, e.UserState));
            }
        }
        
        public void CloseAsync() {
            this.CloseAsync(null);
        }
        
        public void CloseAsync(object userState) {
            if ((this.onBeginCloseDelegate == null)) {
                this.onBeginCloseDelegate = new BeginOperationDelegate(this.OnBeginClose);
            }
            if ((this.onEndCloseDelegate == null)) {
                this.onEndCloseDelegate = new EndOperationDelegate(this.OnEndClose);
            }
            if ((this.onCloseCompletedDelegate == null)) {
                this.onCloseCompletedDelegate = new System.Threading.SendOrPostCallback(this.OnCloseCompleted);
            }
            base.InvokeAsync(this.onBeginCloseDelegate, null, this.onEndCloseDelegate, this.onCloseCompletedDelegate, userState);
        }
        
        protected override LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService CreateChannel() {
            return new LoginUserCarbonCalculatorServiceClientChannel(this);
        }
        
        private class LoginUserCarbonCalculatorServiceClientChannel : ChannelBase<LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService>, LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService {
            
            public LoginUserCarbonCalculatorServiceClientChannel(System.ServiceModel.ClientBase<LowerCarbon.Web.Controls.LoginUserCarbonCalculatorServiceRef.LoginUserCarbonCalculatorService> client) : 
                    base(client) {
            }
            
            public System.IAsyncResult BeginGetSessionVariable(string key, System.AsyncCallback callback, object asyncState) {
                object[] _args = new object[1];
                _args[0] = key;
                System.IAsyncResult _result = base.BeginInvoke("GetSessionVariable", _args, callback, asyncState);
                return _result;
            }
            
            public object EndGetSessionVariable(System.IAsyncResult result) {
                object[] _args = new object[0];
                object _result = ((object)(base.EndInvoke("GetSessionVariable", _args, result)));
                return _result;
            }
        }
    }
}