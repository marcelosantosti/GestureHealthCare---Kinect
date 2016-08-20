using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCare.Dal;
using NHibernate;

namespace Facdombosco.GestureHealthCare.Service
{
    public class BaseService<T>
    {
        public static IList<T> FindAll()
        {
            return BaseDal<T>.FindAll();
        }

        public static IList<T> FindAll(params string[] relations)
        {
            return BaseDal<T>.FindAll(relations);
        }

        public static IList<T> FindAll(ICriteria criteria, params string[] relation)
        {
            return null;
        }
    }
}
