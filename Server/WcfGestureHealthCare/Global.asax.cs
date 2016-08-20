using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using AutoMapper;
using Castle.ActiveRecord.Framework;
using Castle.ActiveRecord;
using System.Configuration;
using Facdombosco.GestureHealthCare;

namespace Facdombosco.WcfGestureHealthCare
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            IConfigurationSource configurationSource = (IConfigurationSource)ConfigurationManager.GetSection("ActiveRecord");

            ActiveRecordStarter.Initialize(configurationSource, Tipos.RetornarTipos().ToArray());
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpContext.Current.Items.Add("ar.sessionscope", new SessionScope(FlushAction.Never));
        }

        protected void Application_EndRequest(object sender, EventArgs e)
        {
            try
            {
                SessionScope scope = HttpContext.Current.Items["ar.sessionscope"] as SessionScope;

                if (scope != null)
                    scope.Dispose();
            }
            catch (Exception ex)
            {
                HttpContext.Current.Trace.Warn("Error", "EndRequest: " + ex.Message, ex);
            }
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}