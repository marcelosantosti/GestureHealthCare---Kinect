using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCare.Dto;
using Facdombosco.GestureHealthCare.Service;
using Castle.ActiveRecord.Queries;
using NHibernate.Transform;

namespace Facdombosco.GestureHealthCare.Dal
{
    public class AtendimentoDal : BaseService<Atendimento>
    {
        public static IList<Atendimento> FindAllAtendimentoWithExame(int? idPaciente)
        {
            string hql = @"
                                select a
                                from Atendimento a 
                                    left outer join fetch a.SolicitacaoExame se 
                                    left outer join fetch se.SolicitacaoExameItem sei
                                    left outer join fetch sei.Exame e
                                where a.Paciente.Codigo = :idPaciente
                          ";

            SimpleQuery<Atendimento> simpleQuery = new SimpleQuery<Atendimento>(hql);
            simpleQuery.SetParameter("idPaciente", idPaciente);
            simpleQuery.SetResultTransformer(new DistinctRootEntityResultTransformer());

            return simpleQuery.Execute();
        }

        public static IList<Atendimento> FindAllAtendimentoWithProcedimento(int? idPaciente)
        {
            string hql = @"
                                select a
                                from Atendimento a 
                                    left outer join fetch a.SolicitacaoProcedimento sp
                                    left outer join fetch sp.SolicitacaoProcedimentoItem spi
                                    left outer join fetch spi.Procedimento p
                                where a.Paciente.Codigo = :idPaciente
                          ";

            SimpleQuery<Atendimento> simpleQuery = new SimpleQuery<Atendimento>(hql);
            simpleQuery.SetParameter("idPaciente", idPaciente);
            simpleQuery.SetResultTransformer(new DistinctRootEntityResultTransformer());

            return simpleQuery.Execute();
        }

        public static IList<Atendimento> FindAllAtendimentoWithDiagnostico(int? idPaciente)
        {
            string hql = @"
                                select a
                                from Atendimento a 
                                    left outer join fetch a.Diagnostico d
                                where a.Paciente.Codigo = :idPaciente
                          ";
            SimpleQuery<Atendimento> simpleQuery = new SimpleQuery<Atendimento>(hql);
            simpleQuery.SetParameter("idPaciente", idPaciente);
            simpleQuery.SetResultTransformer(new DistinctRootEntityResultTransformer());

            return simpleQuery.Execute();
        }
    }
}
