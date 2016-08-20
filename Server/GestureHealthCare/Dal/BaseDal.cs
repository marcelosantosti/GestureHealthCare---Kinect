using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using Facdombosco.GestureHealthCare.Utils;
using Facdombosco.GestureHealthCare.Dto;

namespace Facdombosco.GestureHealthCare.Dal
{
    public class BaseDal<T>
    {
        public static IList<T> FindAll()
        {
            return ActiveRecordBase<T>.FindAll();
        }

        public static IList<T> FindAll(string[] relations)
        {
            return EagerQuery<T>.FindAll(relations);
        }
    }
}
