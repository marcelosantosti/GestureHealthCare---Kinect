using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Castle.ActiveRecord.Framework;
using Castle.ActiveRecord;
using Facdombosco.GestureHealthCare;
using System.Configuration;
using Facdombosco.GestureHealthCare.Dto;
using Facdombosco.GestureHealthCare.Service;

namespace GestureHealthCareTests
{
    [TestClass]
    public class LaudoServiceTest
    {
        private TestContext testContextInstance;

        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes

        [ClassInitialize()]
        public static void LaudoServiceTestClassInitialize(TestContext testContext)
        {
            IConfigurationSource configurationSource = (IConfigurationSource)ConfigurationManager.GetSection("ActiveRecord");

            ActiveRecordStarter.Initialize(configurationSource, Tipos.RetornarTipos().ToArray());
        }

        #endregion

        [TestMethod]
        public void FindAllLaudo()
        {
            using (SessionScope sessionScope = new SessionScope(FlushAction.Never))
            {
                IList<Laudo> laudo = LaudoService.FindAllLaudo(0);
            }
        }
    }
}
