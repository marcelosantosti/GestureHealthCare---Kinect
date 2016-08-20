using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Castle.ActiveRecord.Framework;
using Castle.ActiveRecord;
using Facdombosco.GestureHealthCare;
using System.Configuration;
using Facdombosco.GestureHealthCare.Service;
using Facdombosco.GestureHealthCare.Dto;

namespace GestureHealthCareTests
{
    [TestClass]
    public class AtendimentoServiceTest
    {
        public AtendimentoServiceTest()
        {

        }

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
        public static void AtendimentoServiceTestClassInitialize(TestContext testContext) 
        {
            IConfigurationSource configurationSource = (IConfigurationSource)ConfigurationManager.GetSection("ActiveRecord");

            ActiveRecordStarter.Initialize(configurationSource, Tipos.RetornarTipos().ToArray());
        }

        #endregion

        [TestMethod]
        public void FindAllAtendimentoWithExame()
        {
            using (SessionScope sessionScope = new SessionScope(FlushAction.Never))
            {
                IList<Atendimento> atendimento = AtendimentoService.FindAll();

                if (atendimento.Count > 0)
                {
                    AtendimentoService.FindAllAtendimentoWithExame(atendimento[0].Paciente.Codigo);
                }
            }
        }

        [TestMethod]
        public void FindAllAtendimentoWithProcedimento()
        {
            using (SessionScope sessionScope = new SessionScope(FlushAction.Never))
            {
                IList<Atendimento> atendimento = AtendimentoService.FindAll();

                if (atendimento.Count > 0)
                {
                    AtendimentoService.FindAllAtendimentoWithProcedimento(atendimento[0].Paciente.Codigo);
                }
            }
        }

        [TestMethod]
        public void FindAllAtendimentoWithDiagnostico()
        {
            using (SessionScope sessionScope = new SessionScope(FlushAction.Never))
            {
                IList<Atendimento> atendimento = AtendimentoService.FindAll();

                if (atendimento.Count > 0)
                {
                    AtendimentoService.FindAllAtendimentoWithDiagnostico(atendimento[0].Paciente.Codigo);
                }
            }
        }
    }
}
