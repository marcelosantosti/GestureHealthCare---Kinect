using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Castle.ActiveRecord.Framework;
using System.Configuration;
using Castle.ActiveRecord;
using Facdombosco.GestureHealthCare;
using Facdombosco.GestureHealthCare.Service;

namespace GestureHealthCareTests
{
    [TestClass]
    public class CirurgiaServiceTest
    {
        [ClassInitialize()]
        public static void CirurgiaServiceTestClassInitialize(TestContext testContext)
        {
            IConfigurationSource configurationSource = (IConfigurationSource)ConfigurationManager.GetSection("ActiveRecord");

            ActiveRecordStarter.Initialize(configurationSource, Tipos.RetornarTipos().ToArray());
        }

        [TestMethod]
        public void FindAllWithAtendimento()
        {
            using (SessionScope sessionScope = new SessionScope(FlushAction.Never))
            {
                CirurgiaService.FindAllWithAtendimento();
            }
        }
    }
}
