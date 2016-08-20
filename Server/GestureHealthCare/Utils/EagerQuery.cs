using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate.Criterion;
using Castle.ActiveRecord;
using NHibernate;
using NHibernate.Transform;

namespace Facdombosco.GestureHealthCare.Utils
{
    public class EagerQuery<T>
    {
        #region FindAll

        public static IList<T> FindAll(params string[] relacionamentos)
        {
            DetachedCriteria criteria = DetachedCriteria.For<T>();

            return ActiveRecordBase<T>.FindAll(EagerQuery<T>.AdicionarEagerLoad(criteria, relacionamentos));
        }

        public static IList<T> FindAll(Order[] ordenacao, params string[] relacionamentos)
        {
            DetachedCriteria criteria = DetachedCriteria.For<T>();

            return ActiveRecordBase<T>.FindAll(EagerQuery<T>.AdicionarEagerLoad(criteria, relacionamentos), ordenacao);
        }

        public static IList<T> FindAll(DetachedCriteria criteria, Order[] ordenacao, params string[] relacionamentos)
        {
            return ActiveRecordBase<T>.FindAll(EagerQuery<T>.AdicionarEagerLoad(criteria, relacionamentos), ordenacao);
        }

        public static IList<T> FindAll(DetachedCriteria criteria, params string[] relacionamentos)
        {
            return ActiveRecordBase<T>.FindAll(EagerQuery<T>.AdicionarEagerLoad(criteria, relacionamentos));
        }

        #endregion

        #region SlicedFindAll

        public static IList<T> SlicedFindAll(int primeiroResultado, int totalResultado, params string[] relacionamentos)
        {
            DetachedCriteria criteria = DetachedCriteria.For<T>();

            return ActiveRecordBase<T>.SlicedFindAll(primeiroResultado, totalResultado, EagerQuery<T>.AdicionarEagerLoad(criteria, relacionamentos));
        }

        public static IList<T> SlicedFindAll(int primeiroResultado, int totalResultado, Order[] ordenacao, params  string[] relacionamentos)
        {
            DetachedCriteria criteria = DetachedCriteria.For<T>();

            return ActiveRecordBase<T>.SlicedFindAll(primeiroResultado, totalResultado, EagerQuery<T>.AdicionarEagerLoad(criteria, relacionamentos), ordenacao);
        }

        public static IList<T> SlicedFindAll(int primeiroResultado, int totalResultado, DetachedCriteria criteria, params string[] relacionamentos)
        {
            return ActiveRecordBase<T>.SlicedFindAll(primeiroResultado, totalResultado, EagerQuery<T>.AdicionarEagerLoad(criteria, relacionamentos));
        }

        public static IList<T> SlicedFindAll(int primeiroResultado, int totalResultado, DetachedCriteria criteria,
            Order[] ordenacao, params string[] relacionamentos)
        {
            return ActiveRecordBase<T>.SlicedFindAll(primeiroResultado, totalResultado, EagerQuery<T>.AdicionarEagerLoad(criteria, relacionamentos), ordenacao);
        }

        public static DetachedCriteria AdicionarEagerLoad(DetachedCriteria criteria, params string[] relacionamentos)
        {
            foreach (string relacionamento in relacionamentos)
                criteria.SetFetchMode(relacionamento, FetchMode.Join);

            criteria.SetResultTransformer(new DistinctRootEntityResultTransformer());

            return criteria;
        }

        #endregion
    }
}
