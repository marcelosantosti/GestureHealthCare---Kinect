using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using Facdombosco.GestureHealthCare;
using Castle.ActiveRecord.Framework;
using System.Configuration;

namespace CriaBanco
{
    public class Program
    {
        static void Main(string[] args)
        {
            IConfigurationSource configurationSource = (IConfigurationSource)ConfigurationManager.GetSection("ActiveRecord");

            ActiveRecordStarter.Initialize(configurationSource, Tipos.RetornarTipos().ToArray());

            ActiveRecordStarter.DropSchema();
            ActiveRecordStarter.CreateSchema();
        }
    }
}
