using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facdombosco.GestureHealthCare.Dto;
using Castle.ActiveRecord.Queries;

namespace Facdombosco.GestureHealthCare.Dal
{
    public class LaudoDal : BaseDal<Laudo>
    {
        public static IList<Laudo> FindAllLaudo(int? idPaciente)
        {
            string hql = @"
                            select l
                            from Laudo l 
                                left join fetch l.SolicitacaoExameItem sei
                                left join fetch sei.Exame e
                                left join fetch sei.SolicitacaoExame se
                                left join fetch se.Atendimento a
                            where a.Paciente = :idPaciente
                         ";

            SimpleQuery<Laudo> simpleQuery = new SimpleQuery<Laudo>(hql);
            simpleQuery.SetParameter("idPaciente", idPaciente);

            return simpleQuery.Execute();
        }
    }
}
